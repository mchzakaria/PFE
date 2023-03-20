import 'package:pfe/widget/widgets.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    super.dispose();
  }

  Future PasswordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Password Reset sen't, Check your email"),
            );
          });    
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        elevation: 0,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Enter Your Email To reset Your Password",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
        ),

        SizedBox(
          height: 10,
        ),

        // email
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

        SizedBox(height: 10),

        MaterialButton(
          onPressed: PasswordReset,
          child: Text("Reset Password"),
          color: Colors.blue[200],
        )
      ]),
    );
  }
}
