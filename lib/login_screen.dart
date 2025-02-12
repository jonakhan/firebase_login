import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'welcome_screen.dart';
import 'package:logger/logger.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Logger _logger = Logger();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _message = '';

  void _login() async {
    _logger.i("Intentando iniciar sesión...");
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _message = 'Por favor, completa todos los campos.';
      });
      return;
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Aquí puedes usar userCredential para obtener información del usuario
      _logger.i("Usuario autenticado: ${userCredential.user?.email}");

      // Navegar a la pantalla de bienvenida
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _message = 'Inicio de sesión fallido: ${e.message}';
      });
      _logger.e("Error de inicio de sesión: ${e.message}");
    }
  }

  void _register() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _message = 'Por favor, completa todos los campos.';
      });
      return;
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      setState(() {
        _message =
            'Usuario creado exitosamente:  ${userCredential.user?.email}. Puedes iniciar sesión ahora.';
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        _message = 'Registro fallido: ${e.message}';
      });
    }
  }

  void _resetPassword() async {
    final email = _emailController.text;

    if (email.isEmpty) {
      setState(() {
        _message = 'Por favor, ingresa tu correo electrónico.';
      });
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      setState(() {
        _message = 'Se ha enviado un correo para restablecer la contraseña.';
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        _message = 'Error al enviar el correo: ${e.message}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Iniciar Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_OLy53eBNqQNHMVE1VEa3x2ajvOZYAK8S5A&s', // Replace with your image URL
              height: 150, // Set the height of the image
              fit: BoxFit.cover, // Adjust the image fit
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Iniciar Sesión'),
            ),
            ElevatedButton(
              onPressed: _register,
              child: Text('Registrar Usuario'),
            ),
            ElevatedButton(
              onPressed: _resetPassword,
              child: Text('Recuperar Contraseña'),
            ),
            SizedBox(height: 20),
            Text(_message, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
