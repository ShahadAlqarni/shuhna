import 'package:flutter/material.dart';
import 'colors.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool rememberMe = false;
  int selectedRole = 0; // 0 for "عميل", 1 for "مالك شاحنة"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            // Logo
            Image.asset(
              'assets/images/logo.png',
              height: 80,
            ),
            SizedBox(height: 16),
            Text(
              'إنشاء حساب',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            // Toggle between "عميل" and "مالك شاحنة"
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildRoleButton("عميل", 0),
                  _buildRoleButton("مالك شاحنة", 1),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Input Fields
            _buildTextField(hintText: 'رقم الجوال', icon: Icons.phone),
            SizedBox(height: 12),
            _buildTextField(hintText: 'الإيميل', icon: Icons.email),
            SizedBox(height: 12),
            _buildTextField(hintText: 'كلمة السر', icon: Icons.lock, obscureText: true),
            SizedBox(height: 16),
            // "تذكرني"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value!;
                    });
                  },
                  activeColor: AppColors.primaryColor, 
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                Text(
                  'تذكرني',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Sign Up Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                //opean next page
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  'تسجيل',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('أو التسجيل عن طريق', style: TextStyle(fontSize: 14, color: Colors.grey)),
            SizedBox(height: 0),
            // Social Login Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton('assets/icons/google.png'),
                SizedBox(width: 30),
                _buildSocialButton('assets/icons/apple.png'),
              ],
            ),
            SizedBox(height: 10),
            // Login Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                   GestureDetector(
                  onTap: () {
                                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                       builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(' هل تمتلك حساب؟ ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String hintText, required IconData icon, bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: Icon(icon, color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildRoleButton(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selectedRole == index ?  AppColors.secondaryColor: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selectedRole == index ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String assetPath) {
    return Container(
      width: 70,
      height: 80,
      child: Image.asset(
        assetPath,
        fit: BoxFit.contain,
      ),
    );
  }
}
