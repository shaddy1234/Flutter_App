import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:online_voting_system/providers/auth_provider.dart';
import 'package:online_voting_system/screens/auth/login_screen.dart';  // Ensure this import is correct
import 'upload_details.dart';
import 'view_results.dart';
import 'package:online_voting_system/widgets/custom_button.dart';

class VoterDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voter Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomButton(
              text: 'Upload Details',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UploadDetails()));
              },
            ),
            CustomButton(
              text: 'View Results',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewResults()));
              },
            ),
            // Add more buttons for other functionalities like Vote in an Election
          ],
        ),
      ),
    );
  }
}
