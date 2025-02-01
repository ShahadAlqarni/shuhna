import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shuhna/screen/payment_screen.dart';

import '../colors.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _mapController;
  LatLng _currentPosition =
      const LatLng(24.7136, 46.6753); // الرياض كموقع افتراضي
  String _address = "جارٍ تحديد الموقع...";
  int currentStep = 1; // 1: تحديد الموقع، 2: تفاصيل الطلب، 3: الدفع

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });
    _mapController.animateCamera(CameraUpdate.newLatLng(_currentPosition));
    _getAddressFromLatLng(_currentPosition);
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      setState(() {
        _address =
            "${place.locality}, ${place.subAdministrativeArea} ${place.postalCode}";
      });
    }
  }

  void _onMapTap(LatLng tappedPoint) {
    setState(() {
      _currentPosition = tappedPoint;
    });
    _getAddressFromLatLng(tappedPoint);
  }

  void _nextStep() {
    setState(() {
      if (currentStep < 3) {
        currentStep++;
      }
    });
  }

  void _previousStep() {
    setState(() {
      if (currentStep > 1) {
        currentStep--;
      }
    });
  }

Widget _buildBottomSheet() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    //عشان الارتفاع يكون مرن
    child: Wrap( 
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, 
            children: [
              if (currentStep == 1) _buildLocationConfirmation(),
              if (currentStep == 2) _buildOrderDetails(),
              if (currentStep == 3) _buildPaymentDetails(),
            ],
          ),
        ),
      ],
    ),
  );
}


  Widget _buildLocationConfirmation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text("الموقع",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text(_address, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _nextStep,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text("تأكيد",
                style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: _getCurrentLocation,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text("عنوان جديد",
                style: TextStyle(fontSize: 16, color: Colors.black)),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text("سطة 2",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("شاحنة صغيرة", style: TextStyle(fontSize: 14)),
            Row(
              children: [
                Icon(Icons.timer, size: 18, color: Colors.black54),
                SizedBox(width: 5),
                Text("28 دقيقة", style: TextStyle(fontSize: 14)),
              ],
            ),
            Row(
              children: [
                Icon(Icons.location_on, size: 18, color: Colors.black54),
                SizedBox(width: 5),
                Text("28 كم", style: TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 10),
        const Text("المرفقات",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          children: const [
            Icon(Icons.camera_alt, size: 24, color: Colors.black54),
            SizedBox(width: 15),
            Expanded(child: Text("إضافة ملاحظة")),
          ],
        ),
        const SizedBox(height: 15),
        const Divider(),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("189 ر.س",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ElevatedButton(
              onPressed: _nextStep,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("تأكيد",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text("سطة 2",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        const Text("شاحنة صغيرة", style: TextStyle(fontSize: 14)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              "محمد إبراهيم",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 15),
            Icon(Icons.phone, size: 24, color: Colors.black54),
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
               Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text("الدفع",
                style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: _currentPosition, zoom: 15),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            onTap: _onMapTap,
            markers: {
              Marker(
                  markerId: const MarkerId("selectedLocation"),
                  position: _currentPosition)
            },
          ),
          Positioned(bottom: 0, left: 0, right: 0, child: _buildBottomSheet()),
        ],
      ),
    );
  }
}
