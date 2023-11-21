import 'package:flutter/material.dart';
import 'main.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: 'Email'
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {_handleLogin(context);}, child: Text('Login')
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () {_handleRegistration(context);}, child: Text('Registration')
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    String email = _emailController.text;
    String password = _passwordController.text;
  }
  void _handleRegistration(BuildContext context) {
    String email = _emailController.text;
    String password = _passwordController.text;
  }
}