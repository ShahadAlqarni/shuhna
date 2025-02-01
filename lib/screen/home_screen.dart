import 'package:flutter/material.dart';
import '../colors.dart';
import 'map_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الصفحة الرئيسية',
          style: TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        backgroundColor: AppColors.whiteColor, 
        elevation: 1,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(0.2), 
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ToggleButtons(
                  isSelected: [true, false],
                  borderRadius: BorderRadius.circular(10),
                  selectedColor: AppColors.whiteColor,
                  fillColor: AppColors.primaryColor, 
                  color: AppColors.blackColor,
                  borderColor: Colors.transparent,
                  selectedBorderColor: Colors.transparent,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Text('أثاث'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Text('سيارة'),
                    ),
                  ],
                  onPressed: (int index) {},
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 6.0),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor, 
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.secondaryColor.withOpacity(0.3), 
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                                Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MapScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor, 
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                            ),
                            child: Text(
                              'طلب',
                              style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end, 
                              children: [
                                Text(
                                  'شاحنة 2',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  textAlign: TextAlign.right,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  index % 2 == 0
                                      ? 'شاحنة صغيرة'
                                      : 'شاحنة كبيرة',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.grayColor), 
                                  textAlign: TextAlign.right,
                                ),
                                SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('28 كم',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.grayColor)),
                                    SizedBox(width: 6),
                                    Image.asset(
                                      'assets/icons/icon1.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
