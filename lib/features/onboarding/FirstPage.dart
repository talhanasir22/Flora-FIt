import 'package:florafit_app/Core/apptext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget{
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .35,
                width: MediaQuery.of(context).size.height * .75,
                child: Image.asset("assets/Images/ob-Page1.png"),
            ),
          ),
          Center(
            child: Text("🔍 Explore & Discover",style: AppText.onboardingHeadingStyle()),
          ),
          Center(
              child: SizedBox(
                height: 30,
                width: 300,
                child: Text(
                  "Find a wide range of high-quality products tailored to your needs. Shop effortlessly from the comfort of your home",
                  overflow: TextOverflow.visible,
                  maxLines: 5, // Limits text to 2 lines
                  textAlign: TextAlign.center, // Centers text
                  style: AppText.onboardingDescStyle(),
                ),
              ),

          )
        ],
      )
    );
  }
}