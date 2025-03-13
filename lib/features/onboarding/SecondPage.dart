import 'package:florafit_app/Core/apptext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget{
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
                child: Image.asset("assets/Images/ob-Page2.png"),
              ),
            ),
            Center(
              child: Text("💳 Safe & Easy Pay",style: AppText.onboardingHeadingStyle()),
            ),
            Center(
              child: SizedBox(
                height: 30,
                width: 300,
                child: Text("Enjoy fast, hassle-free, and 100% secure payment options. We support multiple payment methods for your convenience.",
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