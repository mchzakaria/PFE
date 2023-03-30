import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    ); 
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool _isAddPageVisible = false;
  TextEditingController _textField1Controller = TextEditingController();
  TextEditingController _textField2Controller = TextEditingController();

  static List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Profile Page'),
    Text('Settings Page'),
  ];

  void _onItemTapped(int index) {
    if (index == 3) {
      setState(() {
        _isAddPageVisible = true;
      });
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _onAddPageClosed() {
    _textField1Controller.clear();
    _textField2Controller.clear();
    setState(() {
      _isAddPageVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 59, 211, 100),
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar Demo'),
      ),
      body: Stack(
        children: [
          _widgetOptions[_selectedIndex],
          if (_isAddPageVisible)
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _textField1Controller,
                    decoration: InputDecoration(
                      hintText: 'Enter text field 1',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                  TextField(
                    controller: _textField2Controller,
                    decoration: InputDecoration(
                      hintText: 'Enter text field 2',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 248, 212, 105),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Color.fromARGB(255, 248, 212, 105),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Color.fromARGB(255, 248, 212, 105),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
            backgroundColor: Color.fromARGB(255, 248, 212, 105),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: _isAddPageVisible
          ? FloatingActionButton(
              onPressed: _onAddPageClosed,
              child: Icon(Icons.close),
            )
          : null,
    );
  }
}
