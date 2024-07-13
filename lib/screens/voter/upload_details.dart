// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';
// import 'package:online_voting_system/providers/auth_provider.dart';  // Correct import
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:online_voting_system/providers/auth_provider.dart';  // Correct import

// Other imports as needed


class UploadDetails extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Details'),
      ),
      body: user == null
          ? Center(child: Text('User not authenticated'))
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: _addressController,
                    decoration: InputDecoration(labelText: 'Address'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance.collection('voters').doc(user.uid).set({
                        'name': _nameController.text,
                        'address': _addressController.text,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Details Uploaded')));
                    },
                    child: Text('Upload'),
                  ),
                ],
              ),
            ),
    );
  }
}
