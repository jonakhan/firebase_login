import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_screen.dart'; // Asegúrate de importar tu pantalla de inicio de sesión

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inicializa Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase App',
      theme: ThemeData.dark(),
      home: LoginScreen(), // Cambia esto a tu pantalla de inicio de sesión
    );
  }
}
