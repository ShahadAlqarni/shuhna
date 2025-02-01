import 'package:flutter/material.dart';
import 'package:shuhna/screen/chat_screen.dart';
import 'package:shuhna/screen/search_screen.dart';
import 'package:shuhna/screen/home_screen.dart';
import 'package:shuhna/screen/orders_screen.dart';
import '../screen/setting_screen.dart';
import '../colors.dart'; 

class LayoutScreen extends StatefulWidget {
  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _currentIndex = 0; 

  final List<Widget> _widgetOptions = [
    HomeScreen(),     // 0: الرئيسية
    OrdersScreen(),   // 1: الطلبات
    SearchScreen(),   // 2: البحث
    ChatScreen(),     // 3: المحادثة
    SettingsScreen(), // 4: الإعدادات
  ];

  void _changeItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_currentIndex],
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl, //  جعل الترتيب من اليمين إلى اليسار
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.grayColor,
          backgroundColor: AppColors.whiteColor,
          onTap: _changeItem,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"), // أقصى اليمين
            BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "الطلبات"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "البحث"),
            BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: "المحادثة"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "الإعدادات"), // أقصى اليسار
          ],
        ),
      ),
    );
  }
}
