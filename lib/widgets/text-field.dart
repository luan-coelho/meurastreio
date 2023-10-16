import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return const TextField(
        decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(203, 213, 225, 1), width: 2),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      hintText: 'Enter a search term',
    ));
  }
}
