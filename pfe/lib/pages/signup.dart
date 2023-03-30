import 'package:pfe/widget/widgets.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final emailcontroller = new TextEditingController();
  final passwordcontroller = new TextEditingController();

  // form
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  // void signup() async {
  //   Auth auth = Auth();
  //   try {
  //     await auth..registerNewUser(email: , password: );
  //   } on FirebaseAuthException catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text(e.message ?? "error"),
  //     ));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SafeArea(
        child: Scaffold(
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Text(
                          "Sign up",
                          style: TextStyle(
                              fontSize: 35,
                              fontFamily: "myfont",
                              color: Colors.grey[800]),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Image.asset(
                          "assets/images/clogo.png",
                          // height: 222,
                        ),
                        SizedBox(
                          height: 27,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(66),
                          ),
                          width: 266,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: emailcontroller,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.grey[800],
                                ),
                                hintText: "Email :",
                                border: InputBorder.none),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !value.contains(
                                    "@gmail.com",
                                  )) {
                                return 'Exemple@gmail.com';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(66),
                          ),
                          width: 266,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: passwordcontroller,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey[800],
                                ),
                              ),
                              icon: Icon(
                                Icons.lock,
                                color: Colors.grey[800],
                                size: 19,
                              ),
                              hintText: "Password :",
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 6) {
                                return 'Minimum length is 6 characters';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegistrationPage.withCredentials(
                                            email: emailcontroller.text,
                                            password: passwordcontroller.text,
                                          )));
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue[400]),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: 93, vertical: 12)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(27))),
                          ),
                          child: Text(
                            "Sign up",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: Text(
                                " Log in",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 17,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
