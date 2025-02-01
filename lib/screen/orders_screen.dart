import 'package:flutter/material.dart';

import '../colors.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Map<String, dynamic>> orders = [
    {
      'status': 'قيد التنفيذ',
      'time': '13 دقيقة',
      'truckType': 'شاحنة صغيرة',
      'distance': '2.8 كم',
      'showFollowButton': true,
    },
    {
      'status': 'تم التنفيذ',
      'time': '',
      'truckType': 'شاحنة صغيرة',
      'distance': '2.8 كم',
      'showFollowButton': false,
    },
  ];

  void _reorder(int index) {
    setState(() {
      orders[index]['status'] = 'قيد التنفيذ';
      orders[index]['time'] = '5 دقائق';
      orders[index]['showFollowButton'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الطلبات',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return _buildOrderCard(
                    index: index,
                    status: orders[index]['status'],
                    time: orders[index]['time'],
                    truckType: orders[index]['truckType'],
                    distance: orders[index]['distance'],
                    showFollowButton: orders[index]['showFollowButton'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderCard({
    required int index,
    required String status,
    required String time,
    required String truckType,
    required String distance,
    required bool showFollowButton,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryColor, 
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
            //  زر "تتبع" أو "إعادة الطلب"
            _buildOrderButton(index, showFollowButton),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end, // لجعل النصوص على اليمين
                children: [
                  Text(
                    status,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 4),
                  Text(
                    truckType,
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 6),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(distance, style: TextStyle(fontSize: 14)),
                      SizedBox(width: 6),
                      Icon(Icons.location_on, size: 18, color: Colors.black54),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///  زر الطلب - يتم ضبطه بناءً على حالة الطلب
  Widget _buildOrderButton(int index, bool showFollowButton) {
    return ElevatedButton(
      onPressed: () {
        if (!showFollowButton) {
          _reorder(index);
        } else {
          print('تتبع الطلب');
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: showFollowButton ?  AppColors.primaryColor  : Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)
      ),
      child: Text(
        showFollowButton ? 'تتبع' : 'إعادة الطلب',
        style: TextStyle(
          color: showFollowButton ? Colors.white : Colors.black54,
          fontSize: 16,
        ),
      ),
    );
  }
}
