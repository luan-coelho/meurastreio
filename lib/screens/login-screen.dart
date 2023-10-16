import 'package:flutter/material.dart';
import 'package:meurastreio/widgets/label.dart';
import 'package:meurastreio/widgets/text-field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('images/box.png'),
          const Text('Meu Rastreio',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600)),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Label(text: "Login"), MyTextField()],
            ),
          ),
        ]),
      ),
    );
  }
}
