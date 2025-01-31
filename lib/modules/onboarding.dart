import 'package:flutter/material.dart';
import '../SignUpScreen.dart';


class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // الخلفية (صورة الشاحنة)
          Image.asset(
            'assets/images/truck.png',
            fit: BoxFit.cover,
          ),

          // النصوص والزر
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 3), // يترك مسافة في الأعلى
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "جاهز لنقل حمولتك؟",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "احصل على أفضل خدمة لنقل سيارتك أو حمولتك في أي وقت وبأسرع طريقة ممكنة!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Spacer(flex: 2), // يترك مسافة قبل الزر

              // زر "ابدأ"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // لون الزر
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // تنفيذ عند الضغط على الزر
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: Text(
                      "ابدأ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(), // يترك مسافة في الأسفل
            ],
          ),
        ],
      ),
    );
  }
}
