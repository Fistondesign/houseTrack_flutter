import 'package:flutter/material.dart';
import './login.dart';
import './about.dart';
import './homepage.dart';
import './Detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HOUSE TRACK',
      routes: {
        'detail': (context) => Detail(),
      },
      debugShowCheckedModeBanner: false,
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  MyHomeScreen({Key key}) : super(key: key);

  @override
  _MyHomeScreen createState() => _MyHomeScreen();
}

class _MyHomeScreen extends State<MyHomeScreen> {
  var pages = [MyHomePage(), About(), Login()];

  var data = [1, 2, 3, 4, 5];

  int _selectedIndex = 0;

  void _setIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HOUSE TRACK',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            child: Icon(
              Icons.search,
              color: Colors.amber,
            ),
            onTap: () {
              print('taped');
            },
          ),
          SizedBox(width: 30),
        ],
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'About'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.green,
          onTap: _setIndex),
    );
  }
}
