import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'إعدادات',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
          SizedBox(height: 20),
          // Profile Section
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/girl.png'),
                ),
                SizedBox(height: 10),
                Text(
                  'مها',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  '+966 55 555 5555',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Settings List
          Expanded(
            child: ListView(
              //space
              padding: EdgeInsets.symmetric(horizontal: 40),
              children: [
               _buildSettingsOption('تعديل الملف الشخصي', 'assets/icons/profile.png'),
                _buildSettingsOption('الموقع', 'assets/icons/icon2.png'),
                _buildSettingsOption('الدفع', 'assets/icons/payment.png'),
                _buildSettingsOption('الحماية', 'assets/icons/pri.png'),
                _buildSettingsOption('اللغة', 'assets/icons/language.png', trailingText: 'العربية'),
                _buildSettingsOption('الخصوصية', 'assets/icons/securety.png'),
                _buildSettingsOption('الدعم الفني', 'assets/icons/support.png'),
                // Logout Button
                _buildLogoutButton(),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }

  Widget _buildSettingsOption(String title, String iconPath, {String? trailingText}) {
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: 16)),
      leading: Image.asset(iconPath, width: 24, height: 24),
      trailing: trailingText != null
          ? Text(trailingText, style: TextStyle(color: Colors.black, fontSize: 14))
          : Image.asset(
              'assets/icons/arrow.png',
              height: 20,
            ),
      onTap: () {},
    );
  }

  Widget _buildLogoutButton() {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/icons/logout.png', width: 24, height: 24),
              SizedBox(width: 8),
              Text(
                'تسجيل الخروج',
                style: TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
