import 'package:flutter/material.dart';
import '../colors.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPaymentMethod = "بطاقة إئتمان";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  String selectedMonth = "أبريل";
  String selectedYear = "2025";

  List<String> months = [
    "يناير", "فبراير", "مارس", "أبريل", "مايو", "يونيو",
    "يوليو", "أغسطس", "سبتمبر", "أكتوبر", "نوفمبر", "ديسمبر"
  ];

  List<String> years = ["2023", "2024", "2025", "2026", "2027"];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "طريقة الدفع",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios), 
            onPressed: () {
              Navigator.pop(context); 
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPaymentOption("بطاقة إئتمان", "assets/icons/mastercard.png"),
              _buildPaymentOption("آبل باي", "assets/icons/apple.png"),
              _buildPaymentOption("باي بال", "assets/icons/paypal.png"),
              SizedBox(height: 20),
              
              _buildLabel("الاسم"),
              _buildTextField(nameController, "أدخل اسمك الكامل"),

              SizedBox(height: 10),
              _buildLabel("رقم البطاقة"),
              _buildTextField(cardNumberController, ".... .... .... 4679"),

              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: _buildLabel("الرمز")),
                  Expanded(flex: 2, child: _buildLabel("تاريخ الانتهاء")),
                ],
              ),
              Row(
                children: [
                  Expanded(child: _buildTextField(cvvController, "...", isSmall: true)),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(child: _buildDropdown(months, selectedMonth, (val) => setState(() => selectedMonth = val))),
                        SizedBox(width: 10),
                        Expanded(child: _buildDropdown(years, selectedYear, (val) => setState(() => selectedYear = val))),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              _buildSummary(),
              
              SizedBox(height: 20),
              _buildPayButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String title, String assetPath) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.black, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            Radio(
              value: title,
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value.toString();
                });
              },
            ),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Spacer(),
            Text("|", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54)), // ✅ الخط الفاصل
            SizedBox(width: 10),
            Image.asset(assetPath, width: 30, height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Text(text, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, {bool isSmall = false}) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[600]),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        contentPadding: EdgeInsets.symmetric(vertical: isSmall ? 10 : 15, horizontal: 10),
      ),
    );
  }

  Widget _buildDropdown(List<String> items, String selectedValue, Function(String) onChanged) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          isExpanded: true,
          onChanged: (value) => onChanged(value!),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: TextStyle(fontSize: 14)),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildSummary() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("المجموع", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text("340 ر.س", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildPayButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor:  AppColors.secondaryColor, 
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text("دفع", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
