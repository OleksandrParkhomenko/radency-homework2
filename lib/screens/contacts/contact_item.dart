import 'package:flutter/material.dart';
import 'package:hometask_2/repository/contacts.dart';
import 'package:hometask_2/screens/contacts/contact_info.dart';
import 'package:hometask_2/screens/contacts/contact_picture.dart';
import 'package:hometask_2/screens/details/contact_details.dart';

class ContactItem extends StatelessWidget {
  final id;
  final name;
  final company;
  final image;
  final favorite;
  final phone;
  final bio;
  final Function updateContacts;

  const ContactItem(
      {Key key,
      this.id,
      this.name,
      this.company,
      this.image,
      this.favorite,
      this.phone,
      this.bio,
      this.updateContacts})
      : super(key: key);

  _markFavorite() {
    for (var contact in contacts) {
      if (contact['id'] == id) {
        contact['favorite'] = !contact['favorite'];
        updateContacts();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                onPressed: _markFavorite,
                icon: favorite
                    ? Icon(Icons.star)
                    : Icon(Icons.star_outline_rounded),
              ),
              ContactPicture(image: image),
              ContactInfo(name: name, company: company),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ContactDetails(
                      id: id,
                      name: name,
                      company: company,
                      image: image,
                      phone: phone,
                      bio: bio,
                      updateContacts: updateContacts,
                    )),
          );
        },
      ),
    );
  }
}
