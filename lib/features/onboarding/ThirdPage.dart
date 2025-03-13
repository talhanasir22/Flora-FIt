import 'package:florafit_app/Core/apptext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget{
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
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
                child: Image.asset("assets/Images/ob-Page3.png"),
              ),
            ),
            Center(
              child: Text("🚚 Swift Delivery",style: AppText.onboardingHeadingStyle()),
            ),
            Center(
              child: SizedBox(
                height: 30,
                width: 300,
                child: Text("Get your orders delivered quickly and safely to your doorstep. We ensure smooth tracking and timely delivery",
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