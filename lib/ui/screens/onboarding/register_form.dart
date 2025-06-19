import 'dart:convert';
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:takeaway_client/model/insert_user_dto.dart';
import 'package:takeaway_client/service/onboarding_service.dart';
import 'package:takeaway_client/ui/widgets/custom_form_text_field.dart';
import 'package:takeaway_client/utility/my_utility.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.onChanged});
  final void Function() onChanged;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final formStateKey = GlobalKey<FormState>(debugLabel: 'registerFormKey');
  bool passwordHidden = true;

  final FocusNode usernameNode = FocusNode();
  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  bool requestLoading = false;

  @override
  Widget build(BuildContext context) {
    final deviceType = MyUtility.getDisplayType(context);
    final size = MyUtility.getSize(context);
    return Card(
      child: SizedBox(
        height: size.height * 0.4,
        width:
            deviceType == DisplayType.compact ||
                    deviceType == DisplayType.medium ||
                    deviceType == DisplayType.expanded
                ? size.width * 0.8
                : size.width * 0.4,
        child: Form(
          key: formStateKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FormField<String>(
                  builder:
                      (state) => CustomFormTextField(
                        state: state,
                        onSubmit: (value) {
                          emailNode.unfocus();
                          usernameNode.requestFocus();
                        },
                        label: 'email',
                        focusNode: emailNode,
                        autoFocus: true,
                        icon: Icon(Icons.alternate_email),
                        controller: emailController,
                      ),
                  validator:
                      (value) =>
                          EmailValidator.validate(emailController.text)
                              ? null
                              : 'inserire un\'email valida',
                ),
                FormField<String>(
                  builder:
                      (state) => CustomFormTextField(
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
                          child: Text('login'),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: () {
                            setState(() {
                              if (formStateKey.currentState!.validate()) {
                                tryRegister();
                              }
                            });
                          },
                          child: Text(
                            'registrati',
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

  @override
  void dispose() {
    // TODO: implement dispose
    usernameNode.dispose();
    passwordNode.dispose();
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void tryRegister() async {
    setState(() {
      requestLoading = true;
    });
    await Future.delayed(Durations.medium4);
    InsertUserDto dto = InsertUserDto(
      email: emailController.text,
      username: usernameController.text,
      password: passwordController.text,
    );
    OnBoardingService.instance.registerUser(dto).then(
      (response) {
        setState(() {
          requestLoading = false;
          final duration = Durations.long4;
          switch (response.statusCode) {
            case HttpStatus.ok:
              if (context.mounted) {
                MyUtility.showSnackBar(
                  context,
                  text: 'utente registrato',
                  duration: duration,
                );
              }
              break;
            case HttpStatus.badRequest:
              if (context.mounted) {
                String message = '';
                message = jsonDecode(response.body)['message'];
                MyUtility.showSnackBar(
                  duration: duration,
                  context,
                  text:
                      message == 'chiave duplicata'
                          ? 'utente già registrato'
                          : 'errore sconosciuto, contattare il supporto tecnico',
                );
              }
              break;
          }
        });
      },
      // onError: (e) {
      //   if (context.mounted) {
      //     MyUtility.showSnackBar(
      //       context,
      //       text: e.toString(),
      //       duration: Duration(),
      //     );
      //   }
      // },
    );
  }
}
