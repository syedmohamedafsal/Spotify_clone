import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/Custom_widget/textfiled.dart';
import 'package:spotify_clone/const/const_clr.dart';
import 'package:spotify_clone/views/Authentication/gender.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

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
            fontSize: 20,
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
                  "Create a password",
                  style: TextStyle(
                    color: txtclr,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            CustomTextField(backgroundColor: Colors.grey,),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Use Atleast 8 Characters",
                style: TextStyle(color: txtclr),
              ),
            ),
            kheight,
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,  MaterialPageRoute(builder: (context) => const GenderScreen()),);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
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