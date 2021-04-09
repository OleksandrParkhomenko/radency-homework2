import 'package:flutter/material.dart';

class ContactDetailsPicture extends StatelessWidget {
  final defaultPictureUrl =
      'https://cdn.pixabay.com/photo/2016/08/31/11/54/user-1633249__340.png';

  final image;

  const ContactDetailsPicture({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        height: MediaQuery.of(context).size.width / 2,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: image == null
                  ? NetworkImage(defaultPictureUrl)
                  : NetworkImage(image),
              fit: BoxFit.cover,
            ),
            boxShadow: image == null
                ? null
                : [
                    new BoxShadow(
                      color: Colors.grey[800],
                      blurRadius: 8.0,
                    ),
                  ]),
      ),
    );
  }
}
