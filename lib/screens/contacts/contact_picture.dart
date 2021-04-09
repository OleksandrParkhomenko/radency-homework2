import 'package:flutter/material.dart';

class ContactPicture extends StatelessWidget {
  final defaultPictureUrl =
      'https://cdn.pixabay.com/photo/2016/08/31/11/54/user-1633249__340.png';

  final image;

  const ContactPicture({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: image == null
                ? NetworkImage(defaultPictureUrl)
                : NetworkImage(image),
            fit: BoxFit.cover,
          )),
    );
  }
}
