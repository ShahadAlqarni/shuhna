import 'package:flutter/material.dart';
import '../colors.dart';
import '../signup_screen.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/truck.png',
            fit: BoxFit.cover,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 3), 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "جاهز لنقل حمولتك؟",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "احصل على أفضل خدمة لنقل سيارتك أو حمولتك في أي وقت وبأسرع طريقة ممكنة!",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: AppColors.whiteColor, 
                    fontSize: 24,
                  ),
                ),
              ),
              Spacer(flex: 2),

           
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text(
                      "ابدأ",
                      style: TextStyle(
                        color: AppColors.whiteColor, 
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
