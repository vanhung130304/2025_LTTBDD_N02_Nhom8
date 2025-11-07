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

  List<Map<String, dynamic>> hotels = [
    {
    'name': 'Sunrise Resort',
    'location': 'Đà Nẵng',
    'price': '1.200.000đ / đêm',
    'rating': 4.8,
    'image': 'https://tse3.mm.bing.net/th/id/OIP.8-5FqFW0ORGO5-Hcb9c8ZQHaFH?pid=Api&P=0&h=180',
    'isFavorite': false,
  },
  {
    'name': 'Vinpearl Luxury',
    'location': 'Nha Trang',
    'price': '2.000.000đ / đêm',
    'rating': 4.9,
    'image': 'https://tse4.mm.bing.net/th/id/OIP.dvU0L4nUe8Qacq1W4J4_2wHaE8?pid=Api&P=0&h=180',
    'isFavorite': false,
  },
  {
    'name': 'Mường Thanh Luxury',
    'location': 'Hà Nội',
    'price': '1.500.000đ / đêm',
    'rating': 4.6,
    'image': 'https://tse4.mm.bing.net/th/id/OIP.gvtlMgX3tmJBcJ0qHMSHzwHaEu?pid=Api&P=0&h=180',
    'isFavorite': false,
  },
  {
    'name': 'FLC Luxury Hotel',
    'location': 'Quảng Bình',
    'price': '1.100.000đ / đêm',
    'rating': 4.4,
    'image': 'https://tse1.mm.bing.net/th/id/OIP.srgYo_SfPfo3ePaCJdFBnQHaD5?pid=Api&P=0&h=180',
    'isFavorite': false,
  },
  {
    'name': 'InterContinental Hotel',
    'location': 'Hồ Chí Minh',
    'price': '2.500.000đ / đêm',
    'rating': 4.9,
    'image': 'https://tse1.mm.bing.net/th/id/OIP.d82wEFsImqpZdaruUt8EnwHaDt?pid=Api&P=0&h=180',
    'isFavorite': false,
  },
  {
    'name': 'Novotel Saigon',
    'location': 'Hồ Chí Minh',
    'price': '1.800.000đ / đêm',
    'rating': 4.7,
    'image': 'https://tse4.mm.bing.net/th/id/OIP.vj5QA5LoB_ENuE8v77uKSwHaFi?pid=Api&P=0&h=180',
    'isFavorite': false,
  },
  {
    'name': 'Sheraton Hanoi',
    'location': 'Hà Nội',
    'price': '2.200.000đ / đêm',
    'rating': 4.8,
    'image': 'https://tse1.mm.bing.net/th/id/OIP.LzI2vfecOXhxXQpcbRiDrwHaE8?pid=Api&P=0&h=180',
    'isFavorite': false,
  },
  {
    'name': 'Saigon Prince Hotel',
    'location': 'Hồ Chí Minh',
    'price': '1.600.000đ / đêm',
    'rating': 4.5,
    'image': 'https://tse3.mm.bing.net/th/id/OIP.-305XwJXHOSLGv86x0tVtgHaEJ?pid=Api&P=0&h=180',
    'isFavorite': false,
  },
  {
    'name': 'Ha Long Bay Resort',
    'location': 'Quảng Ninh',
    'price': '1.900.000đ / đêm',
    'rating': 4.7,
    'image': 'https://tse2.mm.bing.net/th/id/OIP.u_6ErtlIuON9k1EqoIZOawHaFj?pid=Api&P=0&h=180',
    'isFavorite': false,
  },
  {
    'name': 'Mia Saigon Hotel',
    'location': 'Hồ Chí Minh',
    'price': '1.700.000đ / đêm',
    'rating': 4.6,
    'image': 'https://tse2.mm.bing.net/th/id/OIP.QE4r9GslFH603XVjKYApPAHaE7?pid=Api&P=0&h=180',
    'isFavorite': false,
  },
  {
    'name': 'Pullman Vung Tau',
    'location': 'Vũng Tàu',
    'price': '2.100.000đ / đêm',
    'rating': 4.8,
    'image': 'https://tse4.mm.bing.net/th/id/OIP.okcbzKA3MEey_Bs20_nwIQHaDp?pid=Api&P=0&h=180',
    'isFavorite': false,
  },
  {
    'name': 'Ana Mandara Resort',
    'location': 'Nha Trang',
    'price': '2.300.000đ / đêm',
    'rating': 4.9,
    'image': 'https://tse2.mm.bing.net/th/id/OIP.3TIGinZN1yeiSbeu-7kewwHaEH?pid=Api&P=0&h=180',
    'isFavorite': false,
  },
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
    // ... thêm khách sạn khác
  ];

  List<Map<String, dynamic>> favoritePlaces = [];
  List<Map<String, dynamic>> displayedHotels = [];

  @override
  void initState() {
    super.initState();

    // Copy danh sách khách sạn để hiển thị
    displayedHotels = List.from(hotels);

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

  void filterHotels(String keyword) {
    setState(() {
      if (keyword.isEmpty) {
        displayedHotels = List.from(hotels);
      } else {
        displayedHotels = hotels
            .where((hotel) =>
                hotel['name'].toLowerCase().contains(keyword.toLowerCase()) ||
                hotel['location'].toLowerCase().contains(keyword.toLowerCase()))
            .toList();
      }
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return BasePageScaffold(
      title: 'Lưu trú & Nghỉ dưỡng',
      currentIndex: _selectedIndex,
      showHotPlaces: false,
      onSearchChanged: filterHotels, // <-- gắn callback tìm kiếm
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
            itemCount: displayedHotels.length,
            itemBuilder: (context, index) {
              final hotel = displayedHotels[index];
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
