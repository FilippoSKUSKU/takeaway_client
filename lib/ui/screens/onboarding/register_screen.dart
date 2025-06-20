import 'package:flutter/material.dart';
import 'package:takeaway_client/ui/screens/onboarding/login_form.dart';
import 'package:takeaway_client/ui/screens/onboarding/register_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool register = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            register
                ? RegisterForm(onChanged: swap)
                : LoginForm(onChanged: swap),
      ),
    );
  }

  void swap() {
    setState(() {
      register = !register;
    });
  }
}
