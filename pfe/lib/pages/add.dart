import 'package:flutter/cupertino.dart';
import 'package:pfe/widget/widgets.dart';

class adds extends StatefulWidget {
  const adds({super.key});

  @override
  State<adds> createState() => _addsState();
}

class _addsState extends State<adds> {
  String dropdownValue = 'Informatique';
  
  // @override
  // void initState() {
  //   super.initState();
  //   getCurrentUserNames().then((value) {
  //     setState(() {
  //       FirstName = value!;
  //     });
  //   });
  // }

  final postcontroller = TextEditingController();

  // Get the current user's ID
  // final user = FirebaseAuth.instance.currentUser!;

  String lname = "Fuck me";
  String fname = "Fuck me";

  void getdata() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection('SignIn')
        .doc(user!.uid)
        .get();
    setState(() {
      fname = vari.data()!['First name'];
      lname = vari.data()!['Last name'];
    });
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset("assets/images/clogo.png"),
        title: Text(
          " Publier ",
          style: TextStyle(color: Color.fromARGB(255, 96, 96, 96)),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(fname),
            Text(lname),
            SizedBox(height: 180),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 244, 245, 246),
              ),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(10),
              // margin: EdgeInsets.only(top: 5),
              width: 370,
              height: 200,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 120),
                        child: DropdownButton<String>(
                          alignment: Alignment.center,
                          value: dropdownValue,
                          onChanged: (newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Informatique',
                            'Industrielle',
                            'Economique',
                            'Sanitaire',
                            'Juridique',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey[800],
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    width: 280,
                    child: TextField(
                      controller: postcontroller,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "Feel free to write your post",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 230, top: 8),
                    child: ElevatedButton(
                      style: ButtonStyle(),
                      onPressed: () {
                        // Initialize Firesto
                        //re instance.
                        FirebaseFirestore firestore =
                            FirebaseFirestore.instance;

                        // Create a document in a collection.
                        CollectionReference postsRef =
                            firestore.collection('Publication');
                        DocumentReference newPostRef = postsRef.doc();
                        Map<String, dynamic> postData = {
                          'Domaine': dropdownValue,
                          'publication': postcontroller.text.toString(),
                          // 'name': user.displayName.toString(),
                          'date_creation': DateTime.now(),
                        };
                        newPostRef.set(postData);
                        print("Added Succesfuly");
                      },
                      child: const Text(' Publier '),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
