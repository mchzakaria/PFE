import 'package:pfe/widget/widgets.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({super.key});

  String? email, password;
  RegistrationPage.withCredentials({
    required this.email,
    required this.password,
  });

  @override
  State<StatefulWidget> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  // Controllers :
  TextEditingController _date = TextEditingController();
  TextEditingController lastname = new TextEditingController();
  TextEditingController first_name = new TextEditingController();
  TextEditingController DateNaissance = new TextEditingController();
  TextEditingController CIN = new TextEditingController();
  TextEditingController Ville = new TextEditingController();
  TextEditingController Phone_Number = new TextEditingController();
  TextEditingController Speciality = new TextEditingController();

  // email and password controllers :
  TextEditingController _textemailController = new TextEditingController();
  TextEditingController _textpassController = new TextEditingController();

  // String _feedbackText = '';

  @override
  void initState() {
    super.initState();
    _textemailController = TextEditingController(text: widget.email);
    _textpassController = TextEditingController(text: widget.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(25, 20, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // GestureDetector(
                        //   child: Stack(
                        //     children: [
                        //       Container(
                        //         child: Text("Remplir les infos please"),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        // SizedBox(
                        //   height: 20,
                        // ),

                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: first_name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your First Name';
                              }
                              return null;
                            },
                            decoration:
                                ThemeHelper().textInputDecoration('First Name'),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: lastname,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Last Name';
                              }
                              return null;
                            },
                            decoration:
                                ThemeHelper().textInputDecoration('Last Name'),
                          ),
                        ),

                        SizedBox(height: 20.0),

                        // Container(
                        //   child: TextFormField(
                        //     decoration: ThemeHelper().textInputDecoration(
                        //         "E-mail address", "exemple@gmail.com"),
                        //     keyboardType: TextInputType.emailAddress,
                        //     validator: (val) {
                        //       if (!(val!.isEmpty) &&
                        //           !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                        //               .hasMatch(val)) {
                        //         return "Enter a valid email address";
                        //       }
                        //       return null;
                        //     },
                        //   ),
                        //   decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        // ),
                        // SizedBox(height: 20.0),

                        Container(
                          // ignore: sort_child_properties_last
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a date';
                              }
                              return null;
                            },
                            controller: DateNaissance,
                            decoration: ThemeHelper().textInputDecoration(
                              "Date Naissance",
                            ),
                            keyboardType: TextInputType.phone,
                            onTap: () async {
                              DateTime? pickddate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1800),
                                lastDate: DateTime(2100),
                              );
                              if (pickddate != null) {
                                setState(() {
                                  DateNaissance.text = DateFormat('yyyy-MM-dd')
                                      .format(pickddate);
                                });
                              }
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),

                        SizedBox(height: 20.0),

                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: CIN,
                            decoration:
                                ThemeHelper().textInputDecoration("CIN"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your CIN';
                              }
                              return null;
                            },
                          ),
                        ),

                        SizedBox(height: 20.0),

                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: Ville,
                            decoration:
                                ThemeHelper().textInputDecoration("Ville"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Ville';
                              }
                              return null;
                            },
                          ),
                        ),

                        SizedBox(height: 20.0),

                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _textemailController,
                            decoration:
                                ThemeHelper().textInputDecoration("Email"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Email ';
                              }
                              return null;
                            },
                          ),
                        ),

                        SizedBox(height: 20.0),

                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _textpassController,
                            decoration:
                                ThemeHelper().textInputDecoration("Password"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Pasword ';
                              }
                              return null;
                            },
                          ),
                        ),

                        SizedBox(height: 10.0),

                        // Container(
                        //   child: TextFormField(
                        //     decoration: ThemeHelper().textInputDecoration(
                        //         "Mobile Number", "Mobile Number"),
                        //     keyboardType: TextInputType.datetime,
                        //     validator: (value) {
                        //       if (value!.isEmpty) {
                        //         return 'Please enter your mobile number';
                        //       } else {
                        //         return null;
                        //       }
                        //     },
                        //   ),
                        //   decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        // ),

                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: IntlPhoneField(
                              controller: Phone_Number,
                              showDropdownIcon: true,
                              decoration: const InputDecoration(
                                labelText: 'Phone Number',
                              ),
                              initialCountryCode: 'MA',
                            ),
                          ),
                        ),

                        SizedBox(height: 10.0),

                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: Speciality,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Speciality';
                              }
                              return null;
                            },
                            decoration: ThemeHelper().textInputDecoration(
                              "Specialite",
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),

                        SizedBox(height: 15.0),

                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text(
                                      "I accept all terms and conditions.",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'You need to accept terms and conditions';
                            } else {
                              return null;
                            }
                          },
                        ),

                        SizedBox(height: 20.0),

                        // Container(
                        //   decoration:
                        //       ThemeHelper().buttonBoxDecoration(context),
                        //   child: ElevatedButton(
                        //     style: ThemeHelper().buttonStyle(),
                        //     child: Padding(
                        //       padding:
                        //           const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        //       child: Text(
                        //         "Register".toUpperCase(),
                        //         style: TextStyle(
                        //           fontSize: 20,
                        //           fontWeight: FontWeight.bold,
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //     ),
                        //     onPressed: checkboxValue == true
                        //         ? () {
                        //             // if (_formKey.currentState!.validate()) {
                        //             //   Navigator.of(context).pushAndRemoveUntil(
                        //             //       MaterialPageRoute(
                        //             //           builder: (context) => ProfilePage()
                        //             //       ),
                        //             //           (Route<dynamic> route) => false
                        //             //   );
                        //             // }
                        //           }
                        //         : null,
                        //   ),
                        // ),

                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // setState(() {
                              //   _feedbackText = 'Processing data';
                              //   //Navigate to Home Page
                              // });
                              try {
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: _textemailController.text,
                                            password: _textpassController.text);
                                String uid = userCredential.user!.uid;

                                // Create a reference to the collection
                                CollectionReference usersRef = FirebaseFirestore
                                    .instance
                                    .collection('SignIn');
                                // Add a new document with an auto-generated ID
                                DocumentReference newUserRef =
                                    await usersRef.add({
                                  'uid': uid,
                                  // Add additional user data here after authentication is successful
                                  'Last name': lastname.text,
                                  'First name': first_name.text,
                                  'Email': widget.email,
                                  'Password': widget.password,
                                  'Date Naissance ': DateNaissance.text,
                                  'CIN': CIN.text,
                                  'Ville': Ville.text,
                                  'Phone Number': Phone_Number.text,
                                  'Speciality': Speciality.text,
                                });
                                print(
                                    'New user added with ID: ${newUserRef.id}');
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   SnackBar(
                                //       content:
                                //           Text('User created successfully')),
                                // );
                                // Future.delayed(Duration(seconds: 2), () {
                                // });
                              } on FirebaseException catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      e.message ?? "error",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: () {},
                                    ),
                                    backgroundColor:
                                        Colors.redAccent.withOpacity(0.1),
                                  ),
                                );
                              }
                            }
                            ;
                          },
                          child: Text('Submit'),
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(15),
                          ),
                        ),
                        SizedBox(height: 10.0),
                      ],
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
