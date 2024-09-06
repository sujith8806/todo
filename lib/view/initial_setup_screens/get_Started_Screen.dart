import 'package:flutter/material.dart';
import 'package:todo/utils/imageConstants.dart';
import 'package:todo/view/initial_setup_screens/setup_screen.dart';
import 'package:todo/view/widgets/buttonContainer.dart';


class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Keep You \nOrganaized',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Center(
                child: Image.asset(Imageconstants.getStartedImage),
              ),
              SizedBox(height: 20),
              Spacer(),
              Container(
                child: Column(
                  children: [
                    Text(
                      'Stay on the Track',
                      style: TextStyle(color: Colors.black, fontSize: 35),
                    ),
                    Text(
                        textAlign: TextAlign.center,
                        "Ready to conquer your to-do list? Let’s dive in and make productivity effortless!"),
                  ],
                ),
              ),
              SizedBox(height: 35),
              ButtonContainer(
                text: 'Get Started',
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SetupScreen(),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
