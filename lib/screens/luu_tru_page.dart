import 'package:flutter/material.dart';
import '../widgets/base_page_scaffold.dart';

class LuuTruPage extends StatefulWidget {
  final List<Map<String, dynamic>>? favoritePlaces;
  const LuuTruPage({super.key, this.favoritePlaces});

  @override
  State<LuuTruPage> createState() => _LuuTruPageState();
}

class _LuuTruPageState extends State<LuuTruPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        break;
      case 1:
        Navigator.pushNamed(context, '/danhmuc');
        break;
      case 2:
        Navigator.pushNamed(context, '/donhang');
        break;
      case 3:
        Navigator.pushNamed(context, '/taikhoan');
        break;
    }
  }

  List<Map<String, dynamic>> hotels = [
    {
      'name': 'Sunrise Resort',
      'location': 'Đà Nẵng',
      'price': '1.200.000đ / đêm',
      'rating': 4.8,
      'image':
          'https://tse4.mm.bing.net/th/id/OIP.S2butMgeEvKAuA15PLItqwHaEz?pid=Api&P=0&h=220',
      'isFavorite': false,
    },
    {
      'name': 'Vinpearl Luxury',
      'location': 'Nha Trang',
      'price': '2.000.000đ / đêm',
      'rating': 4.9,
      'image':
          'https://tse1.mm.bing.net/th/id/OIP.HJtUZOgAWycXuekcRZCZOQHaEj?pid=Api&P=0&h=220',
      'isFavorite': false,
    },
    // ... các khách sạn khác cũng thêm 'isFavorite': false
  ];

  // Danh sách favorite tạm trong state
  List<Map<String, dynamic>> favoritePlaces = [];

  @override
  void initState() {
    super.initState();
    // Nếu có favoritePlaces từ constructor, copy vào state
    if (widget.favoritePlaces != null) {
      favoritePlaces = List.from(widget.favoritePlaces!);
      for (var hotel in hotels) {
        hotel['isFavorite'] =
            favoritePlaces.any((fav) => fav['name'] == hotel['name']);
      }
    }
  }

  void toggleFavorite(Map<String, dynamic> hotel) {
    setState(() {
      hotel['isFavorite'] = !(hotel['isFavorite'] ?? false);
      if (hotel['isFavorite']!) {
        favoritePlaces.add(hotel);
      } else {
        favoritePlaces.removeWhere((h) => h['name'] == hotel['name']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePageScaffold(
      title: 'Lưu trú & Nghỉ dưỡng',
      currentIndex: _selectedIndex,
      showHotPlaces: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Khách sạn được đề xuất',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: hotels.length,
            itemBuilder: (context, index) {
              final hotel = hotels[index];
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.symmetric(vertical: 8),
                elevation: 3,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      child: Image.network(
                        hotel['image'],
                        width: 130,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hotel['name'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                            Text('Địa điểm: ${hotel['location']}'),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.orange.shade400, size: 16),
                                const SizedBox(width: 3),
                                Text('${hotel['rating']}'),
                                const Spacer(),
                                IconButton(
                                  icon: Icon(
                                    hotel['isFavorite'] == true
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: hotel['isFavorite'] == true
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                  onPressed: () => toggleFavorite(hotel),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text('Giá: ${hotel['price']}',
                                style: const TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 4),
                                  minimumSize: Size.zero,
                                ),
                                child: const Text('Xem chi tiết'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
