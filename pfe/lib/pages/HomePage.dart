// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:pfe/widget/widgets.dart';

String FullName = "";
String Documentid = "";

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final user = FirebaseAuth.instance.currentUser!;

  String formateddate(timestamp) {
    var datefromtimestamp =
        DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000);
    return DateFormat.yMMMMd('en_US').format(datefromtimestamp);
  }

  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  String searchValue = "";

  List<String> suggestions = [
    'Informatique',
    'Industrielle',
    'Nothing',
    'Agriculture',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: EasySearchBar(
          backgroundColor: Colors.white,
          leading: Image.asset(
            "assets/images/clogo.png",
          ),
          title: Padding(
            padding: EdgeInsets.only(left: 66),
            child: Text(
              " Home Page ",
              style: TextStyle(color: Color.fromARGB(255, 96, 96, 96)),
            ),
          ),
          suggestions: suggestions,
          onSearch: (value) {
            setState(() {
              searchValue = value;
            });
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  width: 350,
                  height: 800,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("Publication")
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text("Something Wrong Here");
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CupertinoActivityIndicator(),
                          );
                        }
                        if (snapshot.data!.docs.isEmpty) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 150,
                              ),
                              Image.asset("assets/images/qq.png"),
                            ],
                          );
                        }
                        if (snapshot.data != null) {
                          return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                FullName = snapshot.data!.docs[index]['Name'];
                                Documentid = snapshot.data!.docs[index].id;
                                return Column(children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    width: 650,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 161, 212, 212),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 6, top: 3, bottom: 0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image.network(
                                                  snapshot.data!.docs[index]
                                                      ['image'],
                                                  fit: BoxFit.cover,
                                                  width: 45,
                                                  height: 45,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 5.0),
                                            Container(
                                              margin: EdgeInsets.only(left: 6),
                                              child: Text(
                                                FullName,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 60.0),
                                            IconButton(
                                              icon: Icon(Icons.delete),
                                              onPressed: () {
                                                // Get the DocumentReference for the document to be deleted
                                                DocumentReference
                                                    documentReference =
                                                    FirebaseFirestore.instance
                                                        .collection(
                                                            'Publication')
                                                        .doc(Documentid);
                                                // Delete the document from the Firestore database
                                                documentReference.delete();
                                                print("Deleted Succesfully");
                                              },
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(2),
                                          child: Divider(
                                            color: const Color.fromARGB(
                                                255, 128, 125, 125),
                                            height: 2,
                                            thickness: 0.5,
                                            indent: 50,
                                            endIndent: 10,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data!.docs[index]['Domaine'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text(snapshot.data!.docs[index]
                                              ['Post']),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                                onTap: _toggleFavorite,
                                                child: Icon(
                                                  _isFavorited
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                  color: _isFavorited
                                                      ? Colors.red
                                                      : Colors.grey,
                                                )),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 55),
                                                child: Text(
                                                  formateddate(
                                                      snapshot.data!.docs[index]
                                                          ['date_creation']),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ]);
                              });
                        }
                        return Container();
                      })),
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





// Container(
                                            //   child: PopupMenuButton<String>(
                                            //     onSelected: (value) {
                                            //       // Handle the selected value (either "Edit" or "Delete")
                                            //       if (value == "Edit") {
                                            //         print(
                                            //             " HI EDIT $FullName ");
                                            //       } else if (value ==
                                            //           "Delete") {
                                            //         print(
                                            //             " HI DELETE $FullName");
                                            //       }
                                            //     },
                                            //     itemBuilder: (BuildContext
                                            //             context) =>
                                            //         <PopupMenuEntry<String>>[
                                            //       PopupMenuItem<String>(
                                            //         value: "Edit",
                                            //         child: Row(
                                            //           children: <Widget>[
                                            //             Icon(Icons.edit),
                                            //             Text("Edit"),
                                            //           ],
                                            //         ),
                                            //       ),
                                            //       PopupMenuItem<String>(
                                            //         value: "Delete",
                                            //         child: Row(
                                            //           children: <Widget>[
                                            //             Icon(Icons.delete),
                                            //             Text("Delete"),
                                            //           ],
                                            //         ),
                                            //       ),
                                            //     ],
                                            //     child: Icon(Icons.more_vert),
                                            //   ),
                                            // ),