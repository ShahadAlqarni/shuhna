import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
<<<<<<< HEAD
          'المحادثة',
          style: TextStyle(
            color: Colors.black,  
=======
          'الدردشة',
          style: TextStyle(
            color: Colors.black,
>>>>>>> b5ad347
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
