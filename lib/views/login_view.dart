import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notekeeper/firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({ Key? key }) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
      appBar: AppBar(
        title: const Text("Register")
        ),
        body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch(snapshot.connectionState){
              case ConnectionState.done:
                return Column(
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
                      decoration: const InputDecoration(
                        hintText: 'Enter your password here'
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        final email = _email.text;
                        final password = _password.text;
                        
                        try{

                        final userCredential = 
                          await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email, 
                            password: password
                          );
                          print(userCredential);
                        }on FirebaseAuthException catch(e){
                          print(e.code);
                          if(e.code == 'user-not-found'){
                            print("user not found");
                          }else if( e.code == 'wrong-passcode'){
                            print('wrong password');
                          }else{
                            print("SOMETHING ELSE HAPPENED");
                            print(e.code);
                          }
                        }catch(e){
                          print("Something bad happened");
                          print(e.runtimeType);
                          print(e);
                        }
              
                      },
                      child: const Text("Login"),
                    ),
                  ],
                );
              default:
              return const Text("Loading");

            }
          },
          
        ),
    );
  }
  
}