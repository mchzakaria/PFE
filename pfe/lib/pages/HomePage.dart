// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:pfe/widget/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final user = FirebaseAuth.instance.currentUser!;

  // String formateddate(timestamp) {
  //   var datefromtimestamp =
  //       DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000);
  //   return DateFormat('dd-MM-yyyy').format(datefromtimestamp);
  // }

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
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Color.fromARGB(255, 200, 226, 245),
              //     border: Border.all(
              //       color: Color.fromARGB(255, 48, 159, 250),
              //       width: 3,
              //     ),
              //   ),
              //   padding: EdgeInsets.all(5),
              //   margin: EdgeInsets.all(10),
              //   // margin: EdgeInsets.only(top: 5),
              //   width: 370,
              //   height: 118,
              //   child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           Container(
              //             child: CircleAvatar(),
              //             margin: EdgeInsets.only(left: 10),
              //           ),
              //           Container(
              //             margin: EdgeInsets.only(left: 15),
              //             width: 200,
              //             child: TextField(
              //               decoration: InputDecoration(
              //                 border: UnderlineInputBorder(),
              //                 hintText: "feel free to write your Date_creation?",
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //       SizedBox(
              //         height: 12,
              //       ),
              //       Container(
              //         padding: EdgeInsets.only(left: 240, top: 8),
              //         child: ElevatedButton(
              //           style: ButtonStyle(),
              //           onPressed: () {},
              //           child: const Text('Publier'),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  width: 350,
                  height: 490,
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
                          return Text("No data Found ");
                        }
                        if (snapshot != null && snapshot.data != null) {
                          return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return Column(children: [
                                  Container(
                                    width: 600,
                                    color: Color.fromARGB(255, 246, 247, 247),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 6, top: 3, bottom: 0),
                                              child: CircleAvatar(),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 7),
                                              child: Text(
                                                snapshot.data!.docs[index]
                                                    ['Name'],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                        ),
                                        Container(
                                          child: Text(
                                            snapshot.data!.docs[index]
                                                ['Domaine'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 4),
                                          child: Text(snapshot.data!.docs[index]
                                              ['Post']),
                                        ),
                                        // Container(
                                        //   margin: EdgeInsets.only(left: 4),
                                        //   child: Text(formateddate(snapshot
                                        //       .data!
                                        //       .docs[index]['Date_creation'])),
                                        // ),
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

//
