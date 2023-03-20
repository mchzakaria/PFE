// ignore_for_file: prefer_const_constructors

import 'package:pfe/widget/widgets.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  final List Screens = [HomePage(), Recherche(), add(), QuiS(), ProfilePage()];
  // Widget currentScreen = HomePage();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blueAccent,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.search, size: 30),
            Icon(Icons.add, size: 30),
            Icon(Icons.question_mark, size: 30),
            Icon(Icons.person, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        // appBar: AppBar(
        //   // leading: Image.asset("assets\images\clogo.png"),
        //   actions: [
        //     Icon(Icons.search),
        //   ],
        // ),
        body: Screens[_selectedIndex],
      ),
    );
  }
}

class add extends StatelessWidget {
  const add({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Hi Im in Add"),
    );
  }
}

class Recherche extends StatelessWidget {
  Recherche({super.key});
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Create user'),
          ),
        ),
      ),
    ));
  }
}
