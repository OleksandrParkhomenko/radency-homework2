import 'package:flutter/material.dart';
import 'package:hometask_2/repository/contacts.dart';
import 'package:hometask_2/screens/contacts/contact_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ContactList(),
    );
  }
}
