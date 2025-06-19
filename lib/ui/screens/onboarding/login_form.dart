import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:takeaway_client/model/insert_user_dto.dart';
import 'package:takeaway_client/model/login_dto.dart';
import 'package:takeaway_client/service/onboarding_service.dart';
import 'package:takeaway_client/ui/screens/base_user/user_restaurant_list_page.dart';
import 'package:takeaway_client/ui/widgets/custom_form_text_field.dart';
import 'package:takeaway_client/utility/my_utility.dart';
import 'package:takeaway_client/utility/shared_pref_manager.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.onChanged});

  final void Function() onChanged;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordHidden = true;

  final FocusNode usernameNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  bool requestLoading = false;
  final formKey = GlobalKey<FormState>(debugLabel: 'loginForm');

  @override
  Widget build(BuildContext context) {
    final deviceType = MyUtility.getDisplayType(context);
    final size = MyUtility.getSize(context);
    return Card(
      child: SizedBox(
        height: size.height * 0.3,
        width:
            deviceType == DisplayType.compact ||
                    deviceType == DisplayType.medium ||
                    deviceType == DisplayType.expanded
                ? size.width * 0.8
                : size.width * 0.4,
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FormField<String>(
                  builder:
                      (state) => CustomFormTextField(
                        autoFocus: true,
                        state: state,
                        label: 'username',
                        onSubmit: (value) {
                          usernameNode.unfocus();
                          passwordNode.requestFocus();
                        },
                        focusNode: usernameNode,

                        icon: Icon(Icons.person),
                        controller: usernameController,
                      ),
                  validator:
                      (value) =>
                          usernameController.text.isNotEmpty
                              ? null
                              : 'inserire uno username',
                ),
                FormField<String>(
                  builder:
                      (state) => CustomFormTextField(
                        state: state,
                        obscureText: passwordHidden,
                        focusNode: passwordNode,
                        label: 'password',
                        controller: passwordController,
                        icon: IconButton(
                          constraints: BoxConstraints(),
                          padding: EdgeInsets.zero,
                          onPressed:
                              () => setState(() {
                                passwordHidden = !passwordHidden;
                              }),
                          icon: Icon(
                            passwordHidden
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                  validator:
                      (value) =>
                          passwordController.text.isEmpty
                              ? 'inserire una password'
                              : RegExp(
                                '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[^A-Za-z\\d]).{8,}\$',
                              ).hasMatch(passwordController.text)
                              ? null
                              : 'la password deve essere lunga almeno 8 caratteri, contenere 1 numero, 1 carattere speciale, una lettera maiuscola e una lettera minuscola',
                ),
                requestLoading
                    ? CircularProgressIndicator()
                    : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Spacer(),
                        TextButton(
                          onPressed: widget.onChanged,
                          child: Text('registrati'),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: () {
                            setState(() {
                              if (formKey.currentState!.validate()) {
                                tryLogin();
                              }
                            });
                          },
                          child: Text(
                            'login',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void tryLogin() async {
    final navigator = Navigator.of(context);
    final sp = SharedPrefManager.instance;
    // Navigator.of(
    //   context,
    // ).push(MaterialPageRoute(builder: (ctx) => UserHomePage()));
    try {
      LoginDto dto = LoginDto(
        username: usernameController.text,
        password: passwordController.text,
      );
      await OnBoardingService.instance.loginUser(dto);
      String? token = await sp.getToken();
      if (token != null) {
        navigator.push(
          PageRouteBuilder(
            pageBuilder: (ch, a, sa) => UserRestaurantListPage(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              double start = 0;
              double end = 1;
              final tween = Tween<double>(begin: start, end: 1);
              final curve = tween.chain(CurveTween(curve: Curves.ease));
              return FadeTransition(
                opacity: curve.animate(animation),
                child: child,
              );
            },
          ),
        );
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
