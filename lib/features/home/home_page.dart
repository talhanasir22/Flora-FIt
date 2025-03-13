import 'package:florafit_app/Core/appColors.dart';
import 'package:florafit_app/Core/apptext.dart';
import 'package:florafit_app/Shared/categories.dart';
import 'package:florafit_app/Shared/small_action_btns.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.theme,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.theme,
        title: Text("FloraFit",style: AppText.splashPageTextStyle()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.0248,),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9523,
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: AppColors.textFieldColor,
                      prefixIcon: Icon(Icons.search,color: Colors.black54,),
                      hintText: "Search any product...",
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.0248,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("All Featured",style: AppText.mainHeadingTextStyle(),),
                ),
                Spacer(),
                SmallActionButton(btnName: " Sort", btnIcon: Icons.sort),
                SizedBox(width: 10,),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SmallActionButton(btnName: " Filter", btnIcon: Icons.filter_alt),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.0248,),
            Categories(),

          ],
        ),
      ),
    );
  }
}