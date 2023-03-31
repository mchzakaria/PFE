import 'package:flutter/cupertino.dart';
import 'package:pfe/widget/widgets.dart';

// ignore: non_constant_identifier_names
String Lastname = "";
// ignore: non_constant_identifier_names
String Firstname = "";
String img = "";

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool is0bscurePassword = true;
  User? userId = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset("assets/images/clogo.png"),
        title: const Text("Profile Page",
            style: TextStyle(color: Color.fromARGB(255, 96, 96, 96))),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const SizedBox(height: 30),
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
                      return const Text("Something Wrong Here");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                    if (snapshot.data!.docs.isEmpty) {
                      return const Text("No data Found ");
                    }
                    if (snapshot.data != null) {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          Firstname = snapshot.data!.docs[index]['First name'];
                          Lastname = snapshot.data!.docs[index]['Last name'];
                          img = snapshot.data!.docs[index]['image'];
                          return Column(children: [
                            Center(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 4, color: Colors.white),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(img),
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
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              elevation: 15,
                              child: ListTile(
                                title: const Text("First Name",
                                    style: TextStyle(color: Colors.blue)),
                                subtitle: Text(
                                  Firstname,
                                  style: TextStyle(color: Colors.grey[800]),
                                ),
                                trailing: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.edit,
                                      ),
                                    ]),
                              ),
                            ),
                            Card(
                              elevation: 15,
                              child: ListTile(
                                  title: const Text("Last Name :",
                                      style: TextStyle(color: Colors.blue)),
                                  trailing: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.edit),
                                      ]),
                                  subtitle: Text(
                                    Lastname,
                                    style: TextStyle(color: Colors.grey[800]),
                                  )),
                            ),
                            Card(
                              elevation: 15,
                              child: ListTile(
                                  title: const Text("Email :",
                                      style: TextStyle(color: Colors.blue)),
                                  trailing: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.edit),
                                      ]),
                                  subtitle: Text(
                                    snapshot.data!.docs[index]['Email'],
                                    style: TextStyle(color: Colors.grey[800]),
                                  )),
                            ),
                            Card(
                              elevation: 15,
                              child: ListTile(
                                  title: const Text("UID :",
                                      style: TextStyle(color: Colors.blue)),
                                  trailing: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.edit),
                                      ]),
                                  subtitle: Text(
                                    snapshot.data!.docs[index]['uid'],
                                    style: TextStyle(color: Colors.grey[800]),
                                  )),
                            ),
                            Card(
                              elevation: 15,
                              child: ListTile(
                                  title: const Text("CIN :",
                                      style: TextStyle(color: Colors.blue)),
                                  trailing: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.edit),
                                      ]),
                                  subtitle: Text(
                                    snapshot.data!.docs[index]['CIN'],
                                    style: TextStyle(color: Colors.grey[800]),
                                  )),
                            ),
                            Card(
                              elevation: 15,
                              child: ListTile(
                                  title: const Text("Password :",
                                      style: TextStyle(color: Colors.blue)),
                                  trailing: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.edit),
                                      ]),
                                  subtitle: Text(
                                    snapshot.data!.docs[index]['Password'],
                                    style: TextStyle(color: Colors.grey[800]),
                                  )),
                            ),
                            Card(
                              elevation: 15,
                              child: ListTile(
                                  title: const Text("Phone Number :",
                                      style: TextStyle(color: Colors.blue)),
                                  trailing: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.edit),
                                      ]),
                                  subtitle: Text(
                                    snapshot.data!.docs[index]['Phone Number'],
                                    style: TextStyle(color: Colors.grey[800]),
                                  )),
                            ),
                            Card(
                              elevation: 15,
                              child: ListTile(
                                  title: const Text(
                                    "Speciality : ",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  trailing: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.edit),
                                      ]),
                                  subtitle: Text(
                                    snapshot.data!.docs[index]['Speciality'],
                                    style: TextStyle(color: Colors.grey[800]),
                                  )),
                            ),
                            Card(
                              elevation: 15,
                              child: ListTile(
                                  title: const Text("Ville :",
                                      style: TextStyle(color: Colors.blue)),
                                  trailing: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.edit),
                                      ]),
                                  subtitle: Text(
                                    snapshot.data!.docs[index]['Ville'],
                                    style: TextStyle(color: Colors.grey[800]),
                                  )),
                            ),
                          ]);
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text("Cancel",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2,
                          color: Colors.black,
                        )),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text("SAVE",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (FirebaseAuth.instance.currentUser != null) {
                      await FirebaseAuth.instance.signOut();
                    }
                  },
                  child: const Text("signOut")),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
