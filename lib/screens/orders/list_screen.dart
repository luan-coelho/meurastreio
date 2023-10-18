import 'package:flutter/material.dart';

class ListOrdersScreen extends StatefulWidget {
  const ListOrdersScreen({super.key});

  @override
  ListOrdersState createState() {
    return ListOrdersState();
  }
}

class ListOrdersState extends State<ListOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(29.0),
            child: Text("Listagem"),
          ),
        ),
      ),
    );
  }
}
