import 'package:florafit_app/features/auth/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Shared/DotIndicator.dart';
import 'FirstPage.dart';
import 'SecondPage.dart';
import 'ThirdPage.dart';
import 'package:florafit_app/features/home/home_page.dart';

class OnboardingPage extends StatefulWidget {
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  Future<void> _onboardingComplete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingComplete', true);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: _onPageChanged,
            children: [
              FirstPage(),
              SecondPage(),
              ThirdPage(),
            ],
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: _onboardingComplete,
              child: Text("Skip",
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  3, (index) => DotIndicator(isActive: index == _currentPage)),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Color(0xFFA11D20),
              onPressed: () {
                if (_currentPage == 2) {
                  _onboardingComplete();
                } else {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                }
              },
              child: Icon(
                _currentPage == 2 ? Icons.check : Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
