import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/Custom_widget/textfiled.dart';
import 'package:spotify_clone/const/const_clr.dart';
import 'package:spotify_clone/controller/passwordcont.dart';
import 'package:spotify_clone/model/authentication.dart';
import 'package:spotify_clone/views/Authentication/email.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: backgrndclr,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(image: AssetImage("assets/Image/home.png")),
            const Image(image: AssetImage("assets/icons/Logo.png")),
            kheight,
            const Column(children: [
              Text(
                "Millions of Songs.",
                style: TextStyle(
                    color: txtclr, fontSize: 25, fontWeight: FontWeight.w600),
              ),
              Text(
                "Free On Spotify.",
                style: TextStyle(
                    color: txtclr, fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ]),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EmailScreen()),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(13, 241, 93, 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Text(
                          "Sign Up Free",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                const Buttons(
                  img: Image(image: AssetImage("assets/icons/google.png")),
                  words: "Continue With Google",
                  txtclr1: Colors.white,
                ),
                const Buttons(
                  img: Image(image: AssetImage("assets/icons/facebook.png")),
                  words: "Continue With Facebook",
                  txtclr1: Colors.white,
                ),
                const Buttons(
                  img: Image(image: AssetImage("assets/icons/Apple.png")),
                  words: "Continue With Apple",
                  txtclr1: Colors.white,
                ),
              ],
            ),
            kheight,
            const Divider(
              color: Colors.grey,
              endIndent: 20,
              indent: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "Email or username",
                    style: TextStyle(
                      color: txtclr,
                      fontFamily: "Avenir_bold",
                      fontSize: 18,
                    ),
                  ),
                ),
                CustomTextField(
                  hinttxt: "Email or Username",
                  controller: _controllerEmail,
                  textColor: txtclr,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "Password",
                    style: TextStyle(
                      color: txtclr,
                      fontFamily: "Avenir_bold",
                      fontSize: 18,
                    ),
                  ),
                ),
                Consumer<PasswordSuffixIconState>(
                    builder: (context, state, child) {
                  return CustomTextField(
                    hinttxt: "Password",
                    textColor: txtclr,
                    suffixIcon: Icon(Icons.visibility),
                    controller: _controllerPassword,
                  );
                }),
                kheight,
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 20),
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: mjrclr,
                        borderRadius:
                            BorderRadius.circular(100), // 50% of 200 is 100
                      ),
                      child: TextButton(
                        onPressed: () {
                          authProvider.login();
                        },
                        child: const Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Avenir_bold",
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  final Image? img;
  final String words;
  final Color? clr;
  final Color? txtclr1;
  const Buttons({
    super.key,
    required this.words,
    this.txtclr1,
    this.clr,
    this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: clr,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 2, color: Colors.grey)),
        child: Row(children: [
          kwidth,
          if (img != null) img!,
          kwidth,
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              words,
              style: TextStyle(
                color: txtclr1,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
