import 'package:pfe/widget/widgets.dart';

// void main(){
//   runApp(LoadingPage());
// }
class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2),
        navigationToNextPage); // calling startSplashScreenTimer method,to start the timer
  }

  void navigationToNextPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Image.asset(
              "assets/images/clogo.png",
              width: 900,
            ),
            SizedBox(
              height: 50,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
            Container(
                padding: EdgeInsets.only(top: 20, bottom: 50),
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
