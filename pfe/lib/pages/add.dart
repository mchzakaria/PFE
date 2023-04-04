import 'package:pfe/widget/widgets.dart';

// ignore: camel_case_types
class adds extends StatefulWidget {
  const adds({super.key});

  @override
  State<adds> createState() => _addsState();
}

class _addsState extends State<adds> {
  String dropdownValue = 'Informatique';

  final postcontroller = TextEditingController();

  // Get the current user's ID
  // final user = FirebaseAuth.instance.currentUser!;
  User? userId = FirebaseAuth.instance.currentUser;
  var fullname = Lastname + " " + Firstname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset("assets/images/clogo.png"),
        title: const Text(
          " Publier ",
          style: TextStyle(color: Color.fromARGB(255, 96, 96, 96)),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 180),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 244, 245, 246),
              ),
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(10),
              width: 370,
              height: 200,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 120),
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
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Image.network(
                          img,
                          fit: BoxFit.cover,
                          width: 45,
                          height: 45,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        width: 260,
                        child: TextField(
                          controller: postcontroller,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: "Feel free to write your post",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 230, top: 8),
                    child: ElevatedButton(
                      style: const ButtonStyle(),
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
                          'Post': postcontroller.text.toString(),
                          'Name': fullname.toString(),
                          'date_creation': DateTime.now(),
                          'image': img.toString(),
                        };
                        newPostRef.set(postData).then((value) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Success'),
                                content: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/added.jpg",
                                      width: 28,
                                      height: 28,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    const Text('Post Created Successfully'),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }).catchError((error) {
                          print('Error adding data: $error');
                        });
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
