import 'package:flutter/material.dart';
import 'package:hometask_2/repository/contacts.dart' as repository;
import 'package:hometask_2/screens/contacts/contact_item.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  var contacts = repository.contacts;

  _udpateContacts() {
    setState(() {
      contacts = repository.contacts;
    });
  }

  _letterLine(String letter) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
      child: Text(
        letter,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _buildContacts() {
    var contactList = <Widget>[];
    contacts
        .sort((a, b) => a['name'].toString().compareTo(b['name'].toString()));
    var currentLetter = '';

    for (var contact in contacts) {
      if (contact['name'].toString()[0] != currentLetter) {
        currentLetter = contact['name'].toString()[0];
        contactList.add(_letterLine(currentLetter));
      }
      contactList.add(ContactItem(
        id: contact['id'],
        name: contact['name'],
        company: contact['company'],
        image: contact['image'],
        favorite: contact['favorite'],
        updateContacts: _udpateContacts,
      ));
    }
    return contactList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
        title: Text(
          'Contacts',
          style: TextStyle(
            color: Colors.grey[900],
          ),
        ),
      ),
      body: ListView(
        children: _buildContacts(),
      ),
    );
  }
}
