import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GlobalScaffold extends StatefulWidget {
  const GlobalScaffold(
      {super.key, required this.appBarTitle, required this.body});

  final String appBarTitle;
  final Widget body;

  @override
  GlobalScaffoldState createState() => GlobalScaffoldState();
}

class GlobalScaffoldState extends State<GlobalScaffold> {
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
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Image.asset('images/box.png', width: 36, height: 36),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(widget.appBarTitle,
                    style: const TextStyle(color: Colors.white)),
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
        body: widget.body,
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
          selectedItemColor: Colors.orange,
          onTap: _onItemTapped,
        ));
  }
}
