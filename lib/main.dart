import 'package:flutter/material.dart';
import 'package:notekeeper/views/login_view.dart';
//On main we can out of the gate include the MaterialApp information
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginView(),
    ));
}


