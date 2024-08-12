import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../widgets/ContactAddWidget.dart';

class AddContactsScreen extends StatefulWidget {
  @override
  _AddContactsScreenState createState() => _AddContactsScreenState();
}

class _AddContactsScreenState extends State<AddContactsScreen> {
  final TextEditingController _contactController = TextEditingController();

  // Define a list of contact data
  final List<Map<String, String>> _contactData = [
    {'name': 'John Doe', 'number': '1234567890'},
    {'name': 'Jane Smith', 'number': '0987654321'},
    {'name': 'Alex Johnson', 'number': '1122334455'},
    {'name': 'Michael Brown', 'number': '2233445566'},
    {'name': 'Emily Davis', 'number': '3344556677'},
    {'name': 'David Wilson', 'number': '4455667788'},
    {'name': 'Sophia Martinez', 'number': '5566778899'},
    {'name': 'Chris Taylor', 'number': '6677889900'},
    {'name': 'Olivia Anderson', 'number': '7788990011'},
    {'name': 'James Thomas', 'number': '8899001122'},
    {'name': 'Isabella Jackson', 'number': '9900112233'},
    {'name': 'Daniel White', 'number': '0011223344'},
    {'name': 'Mia Harris', 'number': '1122334455'},
    {'name': 'Matthew Martin', 'number': '2233445566'},
    {'name': 'Ava Thompson', 'number': '3344556677'},
    {'name': 'Joshua Garcia', 'number': '4455667788'},
    {'name': 'Amelia Martinez', 'number': '5566778899'},
    {'name': 'William Robinson', 'number': '6677889900'},
    {'name': 'Evelyn Clark', 'number': '7788990011'},
    {'name': 'Benjamin Rodriguez', 'number': '8899001122'},
  ];

  // Convert the contact data list to a list of Contact instances
  List<Contact> _contactsList = [];

  @override
  void initState() {
    super.initState();
    _contactsList = _contactData
        .map((data) => Contact(data['name']!, data['number']!, 'assets/images/profile.jpg'))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contacts to Call'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Uncomment if you want to use the TextField
            // TextField(
            //   controller: _contactController,
            //   decoration: InputDecoration(
            //     labelText: 'Add Contact',
            //     suffixIcon: IconButton(
            //       icon: Icon(Icons.add),
            //       onPressed: () {
            //         // Add contact logic
            //       },
            //     ),
            //   ),
            // ),
            // SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _contactsList.length,
                itemBuilder: (context, index) {
                  return ContactAddWidget(
                    contact: _contactsList[index],
                    onAdd: () {
                      // Add contact to call logic
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
