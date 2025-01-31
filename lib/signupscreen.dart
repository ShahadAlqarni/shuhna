import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            // Logo
            Image.asset(
              'assets/images/logo.png',
              height: 80,
              width: 200,
            ),
            SizedBox(height: 10),
            Text(
              'انشاء حساب',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            // Toggle between "عميل" and "مالك شاحنة"
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
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
            // "تذكرني" - Centered
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                    activeColor: Colors.blue, // Matches design color
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                  Text(
                    'تذكرني',
                    style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Sign Up Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
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
            // "Or sign up using"
            Text('او التسجيل عن طريق', style: TextStyle(fontSize: 14, color: Colors.grey)),
            SizedBox(height: 12),
            // Social Login Buttons (Google & Apple)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton('assets/icons/google.png'),
                SizedBox(width: 30),
                _buildSocialButton('assets/icons/apple.png'),
              ],
            ),
            SizedBox(height: 20),
            // Login Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('هل تمتلك حساب؟ ', style: TextStyle(fontSize: 14)),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Custom Input Field with Right-Aligned Icons
  Widget _buildTextField({required String hintText, required IconData icon, bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      textAlign: TextAlign.right, // Align text to the right
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: Icon(icon, color: Colors.grey), // Move icon to the right
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Role Selection Button
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
          color: selectedRole == index ? Colors.blue : Colors.transparent,
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

  // Social Login Button
  Widget _buildSocialButton(String assetPath) {
    return Container(
      width: 50, // Ensures correct size
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(10), // Adjusts padding for perfect centering
        child: Image.asset(
          assetPath,
        ),
      ),
    );
  }
}
