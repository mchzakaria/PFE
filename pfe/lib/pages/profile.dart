import 'package:flutter/cupertino.dart';
import 'package:pfe/widget/widgets.dart';

// ignore: non_constant_identifier_names
String Lastname = "";
// ignore: non_constant_identifier_names
String Firstname = "";
String img = "";
String docid = "";
//////////////////////
TextEditingController _textEditingController = TextEditingController();
TextEditingController lastnameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController idController = TextEditingController();
TextEditingController cinController = TextEditingController();
TextEditingController numberController = TextEditingController();
TextEditingController specialityController = TextEditingController();
TextEditingController villeController = TextEditingController();

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

Auth auth = Auth();

bool un = false;
bool deux = false;
bool trois = false;
bool quatre = false;
bool cinq = false;
bool six = false;
bool sept = false;
bool huit = false;
bool neuf = false;

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
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Container(
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
                          //
                          _textEditingController.text =
                              snapshot.data!.docs[index]['First name'];
                          lastnameController.text =
                              snapshot.data!.docs[index]['Last name'];
                          emailController.text =
                              snapshot.data!.docs[index]['Email'];
                          idController.text = snapshot.data!.docs[index]['uid'];
                          cinController.text =
                              snapshot.data!.docs[index]['CIN'];
                          numberController.text =
                              snapshot.data!.docs[index]['Phone Number'];
                          specialityController.text =
                              snapshot.data!.docs[index]['Speciality'];
                          villeController.text =
                              snapshot.data!.docs[index]['Ville'];

                          return Column(children: [
                            Center(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 400,
                                    height: 170,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(80.0),
                                          bottomRight: Radius.circular(80.0),
                                        ),
                                        color:
                                            Color.fromARGB(255, 197, 221, 240),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    height: 120,
                                    margin: const EdgeInsets.only(
                                        left: 120, top: 80),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 4, color: Colors.white),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(img),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 15, top: 10, right: 15),
                              child: Card(
                                elevation: 15,
                                child: ListTile(
                                  title: const Text("First Name",
                                      style: TextStyle(color: Colors.blue)),
                                  subtitle: un
                                      ? TextFormField(
                                          controller: _textEditingController,
                                          decoration: const InputDecoration(
                                            hintText: "Enter First Name",
                                            border: InputBorder.none,
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                          onFieldSubmitted: (value) {
                                            setState(() {
                                              un = false;
                                              snapshot.data!.docs[index]
                                                  ['First name'];
                                            });
                                          },
                                        )
                                      : Text(
                                          snapshot.data!.docs[index]
                                              ['First name'],
                                        ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      setState(() {
                                        un = true;
                                        _textEditingController.text = snapshot
                                            .data!.docs[index]['First name'];
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Card(
                                elevation: 15,
                                child: ListTile(
                                  title: const Text("Last Name",
                                      style: TextStyle(color: Colors.blue)),
                                  subtitle: deux
                                      ? TextFormField(
                                          controller: lastnameController,
                                          decoration: const InputDecoration(
                                            hintText: "Enter Last Name",
                                            border: InputBorder.none,
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                          onFieldSubmitted: (value) {
                                            setState(() {
                                              deux = false;
                                              snapshot.data!.docs[index]
                                                  ['Last name'];
                                            });
                                          },
                                        )
                                      : Text(
                                          snapshot.data!.docs[index]
                                              ['Last name'],
                                        ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      setState(() {
                                        deux = true;
                                        lastnameController.text = snapshot
                                            .data!.docs[index]['Last name'];
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Card(
                                elevation: 15,
                                child: ListTile(
                                  title: const Text("Email",
                                      style: TextStyle(color: Colors.blue)),
                                  subtitle: trois
                                      ? TextFormField(
                                          controller: emailController,
                                          decoration: const InputDecoration(
                                            hintText: "Enter Email",
                                            border: InputBorder.none,
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                          onFieldSubmitted: (value) {
                                            setState(() {
                                              trois = false;
                                              snapshot.data!.docs[index]
                                                  ['Email'];
                                            });
                                          },
                                        )
                                      : Text(
                                          snapshot.data!.docs[index]['Email'],
                                        ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      setState(() {
                                        trois = true;
                                        emailController.text =
                                            snapshot.data!.docs[index]['Email'];
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Card(
                                elevation: 15,
                                child: ListTile(
                                  title: const Text("DOC ID",
                                      style: TextStyle(color: Colors.blue)),
                                  subtitle: Text(
                                    docid = snapshot.data!.docs[index].id,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Card(
                                elevation: 15,
                                child: ListTile(
                                  title: const Text("UID",
                                      style: TextStyle(color: Colors.blue)),
                                  subtitle: quatre
                                      ? TextFormField(
                                          controller: idController,
                                          decoration: const InputDecoration(
                                            hintText: "Enter UID",
                                            border: InputBorder.none,
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                          onFieldSubmitted: (value) {
                                            setState(() {
                                              quatre = false;
                                              snapshot.data!.docs[index]['uid'];
                                            });
                                          },
                                        )
                                      : Text(
                                          snapshot.data!.docs[index]['uid'],
                                        ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      setState(() {
                                        quatre = true;
                                        idController.text =
                                            snapshot.data!.docs[index]['uid'];
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Card(
                                elevation: 15,
                                child: ListTile(
                                  title: const Text("CIN",
                                      style: TextStyle(color: Colors.blue)),
                                  subtitle: cinq
                                      ? TextFormField(
                                          controller: cinController,
                                          decoration: const InputDecoration(
                                            hintText: "Enter CIN",
                                            border: InputBorder.none,
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                          onFieldSubmitted: (value) {
                                            setState(() {
                                              cinq = false;
                                              snapshot.data!.docs[index]['CIN'];
                                            });
                                          },
                                        )
                                      : Text(
                                          snapshot.data!.docs[index]['CIN'],
                                        ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      setState(() {
                                        cinq = true;
                                        cinController.text =
                                            snapshot.data!.docs[index]['CIN'];
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Card(
                                elevation: 15,
                                child: ListTile(
                                  title: const Text("Phone Number",
                                      style: TextStyle(color: Colors.blue)),
                                  subtitle: sept
                                      ? TextFormField(
                                          controller: numberController,
                                          decoration: const InputDecoration(
                                            hintText: "Enter Phone Number",
                                            border: InputBorder.none,
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                          onFieldSubmitted: (value) {
                                            setState(() {
                                              sept = false;
                                              snapshot.data!.docs[index]
                                                  ['Phone Number'];
                                            });
                                          })
                                      : Text(
                                          snapshot.data!.docs[index]
                                              ['Phone Number'],
                                        ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      setState(() {
                                        sept = true;
                                        numberController.text = snapshot
                                            .data!.docs[index]['Phone Number'];
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Card(
                                elevation: 15,
                                child: ListTile(
                                  title: const Text("Speciality",
                                      style: TextStyle(color: Colors.blue)),
                                  subtitle: huit
                                      ? TextFormField(
                                          controller: specialityController,
                                          decoration: const InputDecoration(
                                            hintText: "Enter Speciality",
                                            border: InputBorder.none,
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                          onFieldSubmitted: (value) {
                                            setState(() {
                                              huit = false;
                                              snapshot.data!.docs[index]
                                                  ['Speciality'];
                                            });
                                          },
                                        )
                                      : Text(
                                          snapshot.data!.docs[index]
                                              ['Speciality'],
                                        ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      setState(() {
                                        huit = true;
                                        specialityController.text = snapshot
                                            .data!.docs[index]['Speciality'];
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Card(
                                elevation: 15,
                                child: ListTile(
                                  title: const Text("Ville",
                                      style: TextStyle(color: Colors.blue)),
                                  subtitle: neuf
                                      ? TextFormField(
                                          controller: villeController,
                                          decoration: const InputDecoration(
                                            hintText: "Enter Ville",
                                            border: InputBorder.none,
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                          onFieldSubmitted: (value) {
                                            setState(() {
                                              neuf = false;
                                              snapshot.data!.docs[index]
                                                  ['Ville'];
                                            });
                                          },
                                        )
                                      : Text(
                                          snapshot.data!.docs[index]['Ville'],
                                        ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      setState(() {
                                        neuf = true;
                                        villeController.text =
                                            snapshot.data!.docs[index]['Ville'];
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ]);
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (FirebaseAuth.instance.currentUser != null) {
                        await auth.logout();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text("Signout",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2,
                          color: Colors.white,
                        )),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text("Save",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2,
                          color: Colors.white,
                        )),
                    onPressed: () {
                      un = false;
                      auth.updateDocument(
                          docid,
                          cinController.text,
                          emailController.text,
                          _textEditingController.text,
                          lastnameController.text,
                          numberController.text,
                          specialityController.text,
                          villeController.text);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
