import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iot_cake_fast_app/models/cake.shop.dart';
import 'package:flutter_iot_cake_fast_app/views/cake_shop_detail_ui.dart';

class CakeShopListUi extends StatefulWidget {
  const CakeShopListUi({super.key});

  @override
  State<CakeShopListUi> createState() => _CakeShopListUiState();
}

class _CakeShopListUiState extends State<CakeShopListUi> {
  List<String> imgCakeShop = [
    'assets/images/ck01.png',
    'assets/images/ck02.png',
    'assets/images/ck03.png',
    'assets/images/ck04.png',
    'assets/images/ck05.png',
    'assets/images/ck06.png',
    'assets/images/ck07.png',
  ];

  List<CakeShop> cakeShops = [
    CakeShop(
        name: 'Yellow Spoon Pastry',
        address: 'โครงการเอกมัย คอมเพล็กซ์',
        phone: '0854822842',
        image1: 's11.jpg',
        image2: 's12.jpg',
        image3: 's13.jpg',
        website: 'https://www.yellowspoonpastry.com/',
        facebook: 'https://www.facebook.com/yspastry',
        latitude: '13.7366',
        longitude: '100.5875',
        description: '',
        openCloseTime: ''),
    CakeShop(
        name: 'Vista Cafe by Verasu',
        address: 'อาคารวีรสุ ถนนวิทยุ',
        phone: '022548100',
        image1: 's21.jpg',
        image2: 's22.jpg',
        image3: 's23.jpg',
        website: 'http://www.vistacafe.co.th/',
        facebook: 'https://www.facebook.com/vistacafe',
        latitude: '13.7403',
        longitude: '100.5474',
        description: '',
        openCloseTime: ''),
    CakeShop(
        name: 'Sweet Spell',
        address: 'สี่แยกเหม่งจ๋าย',
        phone: '0846666828',
        image1: 's31.jpg',
        image2: 's32.jpg',
        image3: 's33.jpg',
        website: 'http://www.sweetspell.com/',
        facebook: 'https://www.facebook.com/sweetspellcafe',
        latitude: '13.7717',
        longitude: '100.5866',
        description: '',
        openCloseTime: ''),
    CakeShop(
        name: 'Larna House',
        address: 'พัฒนาการ 61',
        phone: '023215995',
        image1: 's41.jpg',
        image2: 's42.jpg',
        image3: 's43.jpg',
        website: 'https://larnahouse.com/',
        facebook: 'https://www.facebook.com/larnahouse',
        latitude: '13.7302',
        longitude: '100.6583',
        description: '',
        openCloseTime: ''),
    CakeShop(
        name: 'I bake & You take',
        address: 'วิภาวดีรังสิต 60',
        phone: '0934499447',
        image1: 's51.jpg',
        image2: 's52.jpg',
        image3: 's53.jpg',
        website: 'https://ibakeyoutake.com/',
        facebook: 'https://www.facebook.com/Ibakeyoutakebysine',
        latitude: '13.8645',
        longitude: '100.5823',
        description: '',
        openCloseTime: ''),
    CakeShop(
        name: 'Coffee bean by dao',
        address: 'ชั้น G สยามพารากอน',
        phone: '026109702',
        image1: 's61.jpg',
        image2: 's62.jpg',
        image3: 's63.jpg',
        website: 'http://www.coffeebeans.co.th/',
        facebook: 'https://www.facebook.com/CoffeeBeansbyDao',
        latitude: '13.7469',
        longitude: '100.5349',
        description: '',
        openCloseTime: ''),
    CakeShop(
        name: 'Bake Ministry',
        address: 'สุขุมวิท 26',
        phone: '0891540474',
        image1: 's71.jpg',
        image2: 's72.jpg',
        image3: 's73.jpg',
        website: 'http://www.bakeministry.net/',
        facebook: 'https://www.facebook.com/bakeministry',
        latitude: '13.7281',
        longitude: '100.5705',
        description: '',
        openCloseTime: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF668C62),
          title: const Text('Cakeyummy',
              style: TextStyle(
                  color: Color(0xFF5D4037), fontWeight: FontWeight.bold)),
          centerTitle: true),
      body: Column(
        children: [
          const SizedBox(height: 15),
          CarouselSlider.builder(
            itemCount: imgCakeShop.length,
            options: CarouselOptions(height: 200, autoPlay: true),
            itemBuilder: (context, index, realIndex) => Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(imgCakeShop[index]),
                        fit: BoxFit.cover))),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: cakeShops.length,
              separatorBuilder: (context, index) =>
                  const Divider(color: Color(0xff4F7D62)),
              itemBuilder: (context, index) => ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CakeShopDetailUi(cakeShop: cakeShops[index]))),
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                        'assets/images/${cakeShops[index].image1}',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover)),
                title: Text(cakeShops[index].name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(cakeShops[index].phone),
                trailing: const Icon(Icons.arrow_forward_ios,
                    color: Color(0xff7FA868), size: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
