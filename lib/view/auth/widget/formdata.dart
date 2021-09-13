import 'package:flutter/material.dart';

class FormDaftar extends StatelessWidget {
  final TextEditingController usernameController;
  final label;
  final IconData icon;
  const FormDaftar(
      {Key? key,
      required this.usernameController,
      this.label,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: usernameController,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.all(4),
            child: Icon(icon),
          ),
          labelText: label,
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromRGBO(96, 239, 255, 1), width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromRGBO(0, 255, 135, 1), width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
