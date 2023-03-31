import 'package:pfe/widget/widgets.dart';

// void main(){
//   runApp(LoadingPage());
// }
class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10),
        navigationToNextPage); // calling startSplashScreenTimer method,to start the timer
  }

  void navigationToNextPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Welcome()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Image.asset(
              "assets/images/clogo.png",
              width: 900,
            ),
            const SizedBox(
              height: 50,
            ),
            const CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
            Container(
                padding: const EdgeInsets.only(top: 20, bottom: 50),
                child: Text(
                  'Loading ... ',
                  style: TextStyle(color: Colors.grey[900], fontSize: 25),
                ))
          ]),
        ),
      ),
    );
  }
}
