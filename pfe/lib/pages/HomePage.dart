// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:pfe/Model/model.dart';
import 'package:pfe/widget/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // void getData() async {
  //   QuerySnapshot querySnapshot = await _firestore.collection('SignIn').get();
  //   querySnapshot.docs.forEach((doc) {
  //     print(doc.data());
  //   });
  // }

  User? userId = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // leading: Image.asset("assets\images\clogo.png"),
          actions: [
            Icon(Icons.search),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 200, 226, 245),
                  border: Border.all(
                    color: Color.fromARGB(255, 48, 159, 250),
                    width: 3,
                  ),
                ),
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(10),
                // margin: EdgeInsets.only(top: 5),
                width: 370,
                height: 118,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: CircleAvatar(),
                          margin: EdgeInsets.only(left: 10),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: "feel free to write your post?",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 240, top: 8),
                      child: ElevatedButton(
                        style: ButtonStyle(),
                        onPressed: () {},
                        child: const Text('Publier'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  width: 80,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (FirebaseAuth.instance.currentUser != null) {
                          await FirebaseAuth.instance.signOut();
                        }
                      },
                      child: Text("signOut"))),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: 80,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => quisommes()));
                  },
                  child: Text("Go to ?"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.blue,
                      width: 3,
                    ),
                  ),
                  height: 120,
                  child: StreamBuilder<List<Users>>(
                    stream: readUser(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("Invalid");
                      } else if (snapshot.hasData) {
                        final users = snapshot.data!;
                        return ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (context, index) => ListTile(
                            title: Text(users[index].email),
                          ),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  )),
              SizedBox(
                height: 10,
              ),
              
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.blue,
                    width: 3,
                  ),
                ),
                height: 120,
                child: Text(user.email!),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Stream<List<Users>> readUser() => FirebaseFirestore.instance
    .collection("SignIn")
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((e) => Users.fromJson(e.data())).toList());

//Text(Cin),
// Text(DateNais),
// Text(Email),
// Text(Fname),
// Text(Lname),
// Text(Passw),
// Text(Pnum),
// Text(Spec),
// Text(Ville),
// Text(uid),
