import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/Custom_widget/textfiled.dart';
import 'package:spotify_clone/const/const_clr.dart';
import 'package:spotify_clone/views/Authentication/gender.dart';
import 'package:spotify_clone/views/artists/artists.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrndclr,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: txtclr,
        ),
        backgroundColor: appBarclr,
        title: const Text(
          "Create Account",
          style: TextStyle(
            color: txtclr,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "What's Your Username?",
                  style: TextStyle(
                    color: txtclr,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            CustomTextField(
              backgroundColor: Colors.grey,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "This appears on your spotify profile",
                style: TextStyle(color: txtclr),
              ),
            ),
            kheight,
            const Divider(
              height: 10,
              indent: 15,
              endIndent: 15,
            ),
            kheight,
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                "By Tapping on " +
                    "'Create account', you are agree to the spotify tearms and use.",
                style: TextStyle(color: txtclr),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Terms of use",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(13, 241, 93, 1),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                "To learn more about how Spetifyeelleeuses,shares and protects your personal data, Please see the Spotify Privacy Policy.",
                style: TextStyle(color: txtclr),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Privacy and policy",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(13, 241, 93, 1),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                "Please send me news and offers from Spotify.",
                style: TextStyle(color: txtclr),
              ),
            ),
            sheight,
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                "Share my registration data with Spotify's content providers for marketing purposes.",
                style: TextStyle(color: txtclr),
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Artist()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Create an account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
