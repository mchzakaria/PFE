// ignore_for_file: prefer_const_constructors

import 'package:google_sign_in/google_sign_in.dart';
import 'package:pfe/widget/widgets.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  bool _obscureText = true;
  Auth auth = Auth();

  void login() async {
    Auth auth = Auth();
    try {
      await auth.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message ?? "error"),
      ));
    }
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        "Log in",
                        style: TextStyle(fontSize: 33, fontFamily: "myfont"),
                      ),
                      Image.asset("assets/images/clogo.png", width: 280),
                      // Email TextField

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(66),
                        ),
                        width: 266,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          controller: emailcontroller,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: Colors.grey[800],
                              ),
                              hintText: "Email :",
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 23,
                      ),

                      // Password TextField
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(66),
                        ),
                        width: 266,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
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
                              border: InputBorder.none),
                        ),
                      ),

                      // Forget Password
                      Container(
                        padding: EdgeInsets.only(left: 130, top: 6),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPasswordPage()));
                            },
                            child: const Text(
                              "Forgot Your Password?",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),

                      SizedBox(
                        height: 12,
                      ),

                      // Button Login
                      ElevatedButton(
                        onPressed: login,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue[400]),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 103, vertical: 12)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(27))),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),

                      SizedBox(
                        height: 17,
                      ),

                      // Don't have account , go to sign up
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? "),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signup()));
                              },
                              child: Text(
                                " Sign up",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      // Black Line
                      // SizedBox(
                      //   width: 299,
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //           child: Divider(
                      //         thickness: 0.6,
                      //         color: Colors.grey[900],
                      //       )),
                      //       SizedBox(
                      //         width: 7,
                      //       ),
                      //       Text(
                      //         "OR",
                      //         style: TextStyle(
                      //           color: Colors.grey[900],
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 7,
                      //       ),
                      //       Expanded(
                      //           child: Divider(
                      //         thickness: 0.6,
                      //         color: Colors.grey[900],
                      //       )),
                      //     ],
                      //   ),
                      // ),

                      // SVG Pics
                      // Container(
                      //   margin: EdgeInsets.symmetric(vertical: 5),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       // GestureDetector(
                      //       //   onTap: () {},
                      //       //   child: Container(
                      //       //     // padding: EdgeInsets.all(9),
                      //       //     decoration: BoxDecoration(
                      //       //       shape: BoxShape.circle,
                      //       //     ),
                      //       //     child: SvgPicture.asset(
                      //       //       "assets/icons/fb.svg",
                      //       //       width: 57,
                      //       //     ),
                      //       //   ),
                      //       // ),
                      //       // Facebook
                      //       SizedBox(
                      //         width: 22,
                      //       ),
                      //       // Gmail
                      //       // GestureDetector(
                      //       //   onTap: () async {
                      //       //     print(1);
                      //       //     final user = await signInWithGoogle();
                      //       //     print(2);
                      //       //     if (user != null) {
                      //       //       print(3);
                      //       //       print(
                      //       //           'User signed in with Google: ${user.displayName}');
                      //       //     } else {
                      //       //       print(4);
                      //       //       print('User cancelled the sign-in process');
                      //       //     }
                      //       //     print(5);
                      //       //   },
                      //       //   child: Container(
                      //       //     // padding: EdgeInsets.all(13),
                      //       //     decoration: BoxDecoration(
                      //       //       shape: BoxShape.circle,
                      //       //     ),
                      //       //     child: SvgPicture.asset(
                      //       //         "assets/icons/gmail.svg",
                      //       //         width: 44),
                      //       //   ),
                      //       // ),
                      //       SizedBox(
                      //         width: 22,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
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
