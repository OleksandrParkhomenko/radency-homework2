import 'package:flutter/material.dart';
import 'package:hometask_2/screens/details/contact_details_picture.dart';
import 'package:hometask_2/repository/contacts.dart' as repostitory;

class ContactDetails extends StatefulWidget {
  final id;
  final name;
  final company;
  final image;
  final phone;
  final bio;
  final Function updateContacts;

  const ContactDetails(
      {Key key,
      this.id,
      this.name,
      this.company,
      this.image,
      this.phone,
      this.bio,
      this.updateContacts})
      : super(key: key);

  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _companyController = TextEditingController();
  final _phoneController = TextEditingController();
  final _bioController = TextEditingController();

  final _nameValidator = (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some name';
    } else if (value.length > 70) {
      return 'Name max length is 70 symbols';
    }
    return null;
  };

  final _phoneValidator = (value) {
    String patttern = r'(^\+?3?8?(0\d{9})$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  };

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name;
    _companyController.text = widget.company;
    _phoneController.text = widget.phone;
    _bioController.text = widget.bio;
  }

  _saveUpdates() {
    for (var contact in repostitory.contacts) {
      if (contact['id'] == widget.id) {
        contact['name'] = _nameController.text;
        contact['company'] = _companyController.text;
        contact['phone'] = _phoneController.text;
        contact['bio'] = _bioController.text;
      }
    }
  }

  _formField(
      TextEditingController controller, String label, Function validator) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: TextFormField(
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey[700]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey[700], width: 2),
          ),
        ),
        controller: controller,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _saveUpdates();
                widget.updateContacts();
                Navigator.pop(context);
              }
            },
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ContactDetailsPicture(
                  image: widget.image,
                ),
                _formField(_nameController, "Name", _nameValidator),
                _formField(_companyController, "Company", null),
                _formField(_phoneController, "Phone", _phoneValidator),
                _formField(_bioController, "Bio", null),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
