// lib/widgets/contact_add_widget.dart
import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactAddWidget extends StatelessWidget {
  final Contact contact;
  final VoidCallback onAdd;

  const ContactAddWidget({required this.contact, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(contact.imageUrl), // Use AssetImage for local images
        ),
        title: Text(contact.name),
        subtitle: Text(contact.number),
        trailing: IconButton(
          icon: Icon(Icons.add),
          onPressed: onAdd,
        ),
      ),
    );
  }
}
