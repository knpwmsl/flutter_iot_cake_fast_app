import 'package:flutter/material.dart';
import 'package:flutter_iot_cake_fast_app/models/cake.shop.dart';
import 'package:url_launcher/url_launcher.dart';
// เพิ่มการ Import สำหรับแผนที่
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CakeShopDetailUi extends StatefulWidget {
  final CakeShop cakeShop;
  const CakeShopDetailUi({super.key, required this.cakeShop});

  @override
  State<CakeShopDetailUi> createState() => _CakeShopDetailUiState();
}

class _CakeShopDetailUiState extends State<CakeShopDetailUi> {
  Future<void> _launchInBrowser() async {
    final String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=${widget.cakeShop.latitude},${widget.cakeShop.longitude}';

    final Uri url = Uri.parse(googleMapsUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    // แปลงค่าพิกัดล่วงหน้าเพื่อความสะอาดของโค้ด
    final double lat = double.tryParse(widget.cakeShop.latitude) ?? 0.0;
    final double lng = double.tryParse(widget.cakeShop.longitude) ?? 0.0;

    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF668C62),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.cakeShop.name,
          style: const TextStyle(
              color: Color.fromARGB(255, 98, 51, 8),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: _buildImageFrame(widget.cakeShop.image1, 250, 160),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildImageFrame(widget.cakeShop.image2, 150, 110),
                const SizedBox(width: 10),
                _buildImageFrame(widget.cakeShop.image3, 150, 110),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F3F5),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 4)
                  ],
                ),
                child: Column(
                  children: [
                    _buildInfoRow(Icons.store, widget.cakeShop.name),
                    const Divider(),
                    _buildInfoRow(Icons.location_on, widget.cakeShop.address),
                    const Divider(),
                    _buildInfoRow(Icons.phone, widget.cakeShop.phone, () {
                      _launchURL('tel:${widget.cakeShop.phone}');
                    }),
                    const Divider(),
                    _buildInfoRow(Icons.language, widget.cakeShop.website, () {
                      _launchURL(widget.cakeShop.website);
                    }),
                    const Divider(),
                    _buildInfoRow(Icons.facebook, widget.cakeShop.facebook, () {
                      _launchURL(widget.cakeShop.facebook);
                    }),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Let's find the location!",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF5D4037)),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xFF668C62), width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: FlutterMap(
                    options: MapOptions(
                      initialCenter: LatLng(lat, lng),
                      initialZoom: 15.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(lat, lng),
                            width: 80,
                            height: 80,
                            child: GestureDetector(
                              onTap: _launchInBrowser,
                              child: const Icon(
                                Icons.location_pin,
                                color: Colors.red,
                                size: 45,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildImageFrame(String imageName, double w, double h) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset('assets/images/$imageName', fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String data, [VoidCallback? onTap]) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF668C62)),
      title: Text(
        data,
        style: TextStyle(
          fontSize: 14,
          color: onTap != null ? Colors.blue : Colors.black87,
          decoration: onTap != null ? TextDecoration.underline : null,
        ),
      ),
      onTap: onTap,
      visualDensity: const VisualDensity(vertical: -4),
    );
  }
}
