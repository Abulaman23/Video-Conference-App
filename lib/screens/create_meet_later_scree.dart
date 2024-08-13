import 'package:flutter/material.dart';

class CreateMeetLaterScreen extends StatelessWidget {
  const CreateMeetLaterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
