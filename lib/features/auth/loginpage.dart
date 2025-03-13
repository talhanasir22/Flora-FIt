import 'package:florafit_app/Shared/LoadingIndicator.dart';
import 'package:florafit_app/features/auth/forgotpasswordpage.dart';
import 'package:florafit_app/features/auth/signuppage.dart';
import 'package:florafit_app/features/home/bottomnavbar.dart';
import 'package:florafit_app/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:florafit_app/Core/appColors.dart';
import 'package:florafit_app/Core/apptext.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isVisible = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.theme,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1
                ),

                Text("Welcome\nBack!", style: AppText.authHeadingStyle()),
                SizedBox(height: 20),

                // Email Field
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.textFieldColor,
                    prefixIcon: Icon(Icons.person, color: AppColors.authIconColor),
                    hintText: "Email",
                    hintStyle: AppText.authHintTextStyle(),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (value) => (value == null || value.isEmpty) ? 'Please enter your email' : null,
                ),
                SizedBox(height: 25),
                TextFormField(
                  obscureText: _isVisible,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.textFieldColor,
                    prefixIcon: Icon(Icons.lock, color: AppColors.authIconColor),
                    suffixIcon: IconButton(
                      icon: Icon(_isVisible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () => setState(() => _isVisible = !_isVisible),
                    ),
                    hintText: "Password",
                    hintStyle: AppText.authHintTextStyle(),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (value) => (value == null || value.isEmpty) ?
                  'Please enter your password' : null,
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.97,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                        },
                        child: Text("Forgot Password?", style: TextStyle(color: Color(0xffA11D20),fontSize: 12),),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isLoading = true;
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavBar()));
                          _isLoading = false;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      backgroundColor: AppColors.bgColor,
                    ),
                    child: _isLoading ? LoadingIndicator() :Text("Login", style: AppText.buttonTextStyle()),
                  ),
                ),

                SizedBox(height: 40),

                // Or Continue With
                Center(child: Text("- or continue with -", style: AppText.authHintTextStyle())),
                SizedBox(height: 15),
                // Social Login Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Handle Google sign-in
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 1,
                        shadowColor: Colors.grey,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/Images/google.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        // Handle Apple sign-in
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 1,
                        shadowColor: Colors.grey,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/Images/apple.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Create Account Text
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "I don\'t have an account ",
                            style: AppText.authHintTextStyle(),
                          ),
                          TextSpan(
                            text: "Sign Up",
                            style: TextStyle(
                              color: AppColors.bgColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
