import 'package:flutter/material.dart';
import 'package:notekeeper/constants/routes.dart';
import 'package:notekeeper/services/auth/auth_exceptions.dart';
import 'package:notekeeper/services/auth/auth_service.dart';
import 'package:notekeeper/utilities/dialogs/error_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  //TextEditor Controllers
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //this will be the screen, we need a scaffold
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Enter your email here',
            ),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration:
                const InputDecoration(hintText: 'Enter your password here'),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                await AuthService.firebase().createUser(
                  email: email,
                  password: password,
                );
                //send Verification email for user
                final user = AuthService.firebase().sendEmailVerification();
                Navigator.of(context).pushNamed(verifyEmailRoute);
              } on WeakPasswordAuthException {
                showErrorDialog(
                  context,
                  'Weak password',
                );
              } on EmailAlreadyInUseAuthException {
                showErrorDialog(
                  context,
                  'Email is already in use',
                );
              } on InvalidEmailAuthException {
                showErrorDialog(
                  context,
                  'Invalid Email address',
                );
              } on GenericAuthException catch (e) {
                showErrorDialog(
                  context,
                  "Failed To Register",
                );
              }
            },
            child: const Text("Register"),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(loginRoute, (route) => false);
              },
              child: const Text("Login"))
        ],
      ),
    );
  }
}
