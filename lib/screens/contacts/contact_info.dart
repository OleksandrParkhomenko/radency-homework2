import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  final name;
  final company;

  ContactInfo({this.name, this.company});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[900],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                company,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey[500],
                ),
              ),
            ),
          ],
        ));
  }
}
