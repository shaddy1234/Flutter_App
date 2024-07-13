import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:online_voting_system/providers/auth_provider.dart';
import 'package:online_voting_system/widgets/custom_button.dart';
import 'register_screen.dart';  // Make sure this import is correct
import 'package:online_voting_system/screens/voter/voter_dashboard.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            CustomButton(
              text: 'Login',
              onPressed: () async {
                try {
                  await Provider.of<AuthProvider>(context, listen: false)
                      .signIn(_emailController.text, _passwordController.text);
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => VoterDashboard()));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Failed')));
                }
              },
            ),
            CustomButton(
              text: 'Register',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
