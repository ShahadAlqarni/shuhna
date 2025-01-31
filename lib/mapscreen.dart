/*
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapScreen extends StatefulWidget {
 const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _mapController;
  LatLng _currentPosition = const LatLng(24.7136, 46.6753); // الرياض كموقع افتراضي
  String _address = "جارٍ تحديد الموقع...";

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
        _address = "${place.locality}, ${place.subAdministrativeArea} ${place.postalCode}";
      });
    }
  }

  void _onMapTap(LatLng tappedPoint) {
    setState(() {
      _currentPosition = tappedPoint;
    });
    _getAddressFromLatLng(tappedPoint);
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "الموقع",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(_address, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("تأكيد", style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: _getCurrentLocation,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("عنوان جديد", style: TextStyle(fontSize: 16, color: Colors.black)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: _currentPosition, zoom: 15),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            onTap: _onMapTap,
            markers: {
              Marker(markerId: const MarkerId("selectedLocation"), position: _currentPosition)
            },
            mapType: MapType.normal, // يمكنك تغييره إلى MapType.hybrid للحصول على مظهر مشابه
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: _showBottomSheet,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.location_on, color: Colors.blue),
                  Expanded(
                    child: Text(
                      _address,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/