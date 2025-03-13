import 'package:florafit_app/Shared/LoadingIndicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Core/appColors.dart';
import '../../Core/apptext.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose(); // Dispose the controller to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.theme,
      body: SingleChildScrollView( // Prevents overflow issues
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Forgot\nPassword?", style: AppText.authHeadingStyle()),
            ),
            SizedBox(height: 20),

            // Wrap TextFormField inside Form
            Form(
              key: _formKey,
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.87,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.textFieldColor,
                      prefixIcon: Icon(Icons.email, color: AppColors.authIconColor),
                      hintText: "Enter your email address",
                      hintStyle: AppText.authHintTextStyle(),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    validator: (value) => (value == null || value.isEmpty) ? 'Please enter your email' : null,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.87,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "* ",
                          style: AppText.authHintTextStyle().copyWith(color: AppColors.bgColor),
                        ),
                        TextSpan(
                          text: "We will send you a message to set or reset your new password",
                          style: AppText.authHintTextStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.87,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                     setState(() {
                       _isLoading = true;
                     });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: AppColors.bgColor,
                  ),
                  child: _isLoading ? LoadingIndicator() : Text("Submit", style: AppText.buttonTextStyle()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
