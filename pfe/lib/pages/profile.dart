import 'package:flutter/cupertino.dart';
import 'package:pfe/widget/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Isearch App',
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
      ),
      home: Editproufile(),
    );
  }
}

class Editproufile extends StatefulWidget {
  const Editproufile({Key? key}) : super(key: key);

  @override
  State<Editproufile> createState() => _EditproufileState();
}

class _EditproufileState extends State<Editproufile> {
  bool is0bscurePassword = true;
  User? userId = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: Colors.white,
      //     ),
      //     onPressed: () {},
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(
      //         Icons.settings,
      //         color: Colors.white,
      //       ),
      //       onPressed: () {},
      //     )
      //   ],
      // ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.grey,
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://pixabay.com/fr/photos/fille-mains-portrait-maquette-3033718/'),
                          )),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Colors.white,
                          ),
                          color: Colors.blue,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                // padding: EdgeInsets.all(10),
                // width: 350,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(20),
                //   border: Border.all(
                //     color: Colors.blue,
                //     width: 3,
                //   ),
                // ),
                height: 700,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("SignIn")
                      .where("uid", isEqualTo: userId?.uid)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("Something Wrong Here");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                    if (snapshot.data!.docs.isEmpty) {
                      return Text("No data Found ");
                    }
                    if (snapshot != null && snapshot.data != null) {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          // var Cin = snapshot.data!.docs[index]['CIN'];
                          // var DateNais =
                          //     snapshot.data!.docs[index]['Date Naissance'];
                          // var Email = snapshot.data!.docs[index]['Email'];
                          // var Fname = snapshot.data!.docs[index]['First name'];
                          // var Lname = snapshot.data!.docs[index]['Last name'];
                          // var Passw = snapshot.data!.docs[index]['Password'];
                          // var Pnum = snapshot.data!.docs[index]['Phone Number'];
                          // var Spec = snapshot.data!.docs[index]['Speciality'];
                          // var Ville = snapshot.data!.docs[index]['Ville'];
                          // var uid = snapshot.data!.docs[index]['uid'];

                          return Column(children: [
                            Card(
                              child: ListTile(
                                title: Text("First Name",
                                    style: TextStyle(color: Colors.blue[200])),
                                subtitle: Text(
                                    snapshot.data!.docs[index]['First name']),
                                trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.edit,
                                      ),
                                    ]),
                              ),
                              elevation: 15,
                            ),
                            Card(
                              child: ListTile(
                                  title: Text("Last Name :",
                                      style:
                                          TextStyle(color: Colors.blue[200])),
                                  trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.edit),
                                      ]),
                                  subtitle: Text(
                                      snapshot.data!.docs[index]['Last name'])),
                              elevation: 15,
                            ),
                            Card(
                              child: ListTile(
                                  title: Text("Email :",
                                      style:
                                          TextStyle(color: Colors.blue[200])),
                                  trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.edit),
                                      ]),
                                  subtitle: Text(
                                      snapshot.data!.docs[index]['Email'])),
                              elevation: 15,
                            ),
                            Card(
                              child: ListTile(
                                  title: Text("UID :",
                                      style:
                                          TextStyle(color: Colors.blue[200])),
                                  trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.edit),
                                      ]),
                                  subtitle:
                                      Text(snapshot.data!.docs[index]['uid'])),
                              elevation: 15,
                            ),
                            Card(
                              child: ListTile(
                                  title: Text("CIN :",
                                      style:
                                          TextStyle(color: Colors.blue[200])),
                                  trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.edit),
                                      ]),
                                  subtitle:
                                      Text(snapshot.data!.docs[index]['CIN'])),
                              elevation: 15,
                            ),
                            Card(
                              child: ListTile(
                                  title: Text("Password :",
                                      style:
                                          TextStyle(color: Colors.blue[200])),
                                  trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.edit),
                                      ]),
                                  subtitle: Text(
                                      snapshot.data!.docs[index]['Password'])),
                              elevation: 15,
                            ),
                            Card(
                              child: ListTile(
                                  title: Text("Phone Number :",
                                      style:
                                          TextStyle(color: Colors.blue[200])),
                                  trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.edit),
                                      ]),
                                  subtitle: Text(snapshot.data!.docs[index]
                                      ['Phone Number'])),
                              elevation: 15,
                            ),
                            Card(
                              child: ListTile(
                                  title: Text(
                                    "Speciality : ",
                                    style: TextStyle(color: Colors.blue[200]),
                                  ),
                                  trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.edit),
                                      ]),
                                  subtitle: Text(
                                    snapshot.data!.docs[index]['Speciality'],
                                    style: TextStyle(color: Colors.black),
                                  )),
                              elevation: 15,
                            ),
                            Card(
                              child: ListTile(
                                  title: Text("Ville :",
                                      style:
                                          TextStyle(color: Colors.blue[200])),
                                  trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.edit),
                                      ]),
                                  subtitle: Text(
                                      snapshot.data!.docs[index]['Ville'])),
                              elevation: 15,
                            ),
                          ]);
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ),
              // SizedBox(height: 30),

              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text("Cancel",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2,
                          color: Colors.black,
                        )),
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("SAVE",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2,
                          color: Colors.white,
                        )),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  )
                ],
              ),

              SizedBox(
                height: 40,
              ),

              ElevatedButton(
                  onPressed: () async {
                    if (FirebaseAuth.instance.currentUser != null) {
                      await FirebaseAuth.instance.signOut();
                    }
                  },
                  child: Text("signOut")),

              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
