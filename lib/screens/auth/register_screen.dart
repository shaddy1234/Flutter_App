// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:online_voting_system/providers/auth_provider.dart';
// import 'package:online_voting_system/widgets/custom_button.dart';

// class RegisterScreen extends StatelessWidget {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             CustomButton(
//               text: 'Register',
//               onPressed: () async {
//                 try {
//                   await Provider.of<AuthProvider>(context, listen: false)
//                       .register(_emailController.text, _passwordController.text);
//                   Navigator.pop(context);
//                 } catch (e) {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration Failed')));
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:online_voting_system/providers/auth_provider.dart';
import 'package:online_voting_system/widgets/custom_button.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
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
              text: 'Register',
              onPressed: () async {
                try {
                  await Provider.of<AuthProvider>(context, listen: false)
                      .register(_emailController.text, _passwordController.text);
                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration Failed')));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
