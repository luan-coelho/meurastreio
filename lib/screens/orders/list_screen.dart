import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListOrdersScreen extends StatefulWidget {
  const ListOrdersScreen({super.key});

  @override
  ListOrdersState createState() {
    return ListOrdersState();
  }
}

class ListOrdersState extends State<ListOrdersScreen> {
  int _selectedIndex = 0;

  var optionStyle = const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset('images/box.png', width: 36, height: 36),
              const Padding(
                padding: EdgeInsets.only(left: 18),
                child:
                    Text("Meu Rastreio", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          backgroundColor: const Color(0xff0F172A),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onPressed: () {
                  context.go('/');
                },
              ),
            )
          ],
        ),
        body: const Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(29.0),
              child: Text("Listagem"),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(color: Colors.orange),
          unselectedLabelStyle: const TextStyle(color: Colors.white),
          unselectedItemColor: Colors.white,
          backgroundColor: const Color(0xff0F172A),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Histórico',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }
}
