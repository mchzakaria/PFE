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

  // ignore: non_constant_identifier_names
  Future PasswordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Enter Your Email To reset Your Password",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        // email
        Container(
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(66),
          ),
          width: 266,
          padding: const EdgeInsets.symmetric(horizontal: 16),
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

        const SizedBox(height: 10),

        MaterialButton(
          onPressed: PasswordReset,
          color: Colors.blue[200],
          child: const Text("Reset Password"),
        )
      ]),
    );
  }
}
