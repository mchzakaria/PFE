// ignore: file_names
import 'package:pfe/widget/widgets.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  // ignore: non_constant_identifier_names
  final List Screens = [
    const HomePage(),
    const adds(),
    const QuiS(),
    const ProfilePage()
  ];
  // Widget currentScreen = HomePage();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blueAccent,
          items: const <Widget>[
            Icon(Icons.home, size: 30),
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
        body: Screens[_selectedIndex],
      ),
    );
  }
}

class Recherche extends StatefulWidget {
  const Recherche({super.key});

  @override
  State<Recherche> createState() => _RechercheState();
}

class _RechercheState extends State<Recherche> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
