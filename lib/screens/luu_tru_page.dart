import 'package:flutter/material.dart';

class LuuTruPage extends StatefulWidget {
  const LuuTruPage({super.key});

  @override
  State<LuuTruPage> createState() => _LuuTruPageState();
}

class _LuuTruPageState extends State<LuuTruPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
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

  final List<Map<String, dynamic>> hotels = [
    {
      'name': 'Sunrise Resort',
      'location': 'Đà Nẵng',
      'price': '1.200.000đ / đêm',
      'rating': 4.8,
      'image':
          'https://tse4.mm.bing.net/th/id/OIP.S2butMgeEvKAuA15PLItqwHaEz?pid=Api&P=0&h=220',
    },
    {
      'name': 'Vinpearl Luxury',
      'location': 'Nha Trang',
      'price': '2.000.000đ / đêm',
      'rating': 4.9,
      'image':
          'https://tse1.mm.bing.net/th/id/OIP.HJtUZOgAWycXuekcRZCZOQHaEj?pid=Api&P=0&h=220',
    },
    {
      'name': 'HomeStay Mộc Châu',
      'location': 'Sơn La',
      'price': '600.000đ / đêm',
      'rating': 4.4,
      'image':
          'https://tse2.mm.bing.net/th/id/OVP.6wOcu0p4HredStI3mlSqlgHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Dalala Boutique Hotel',
      'location': 'Đà Lạt',
      'price': '850.000đ / đêm',
      'rating': 4.6,
      'image':
          'https://tse4.mm.bing.net/th/id/OIP.j9quAdHHWX-BVz-ZX0XivgHaE8?pid=Api&P=0&h=220',
    },
    {
      'name': 'Premier Village Phú Quốc',
      'location': 'Phú Quốc',
      'price': '3.500.000đ / đêm',
      'rating': 5.0,
      'image':
          'https://tse4.mm.bing.net/th/id/OVP.s6SWNkeQ5QH0TlQc2Mq8ggHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Aira Boutique Sapa Hotel & Spa',
      'location': 'Sa Pa',
      'price': '1.300.000đ / đêm',
      'rating': 4.7,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.TZLFyVKnTO6RzqrsB081tQEsDh?pid=Api&h=225&w=300&c=7&rs=1',
    },
    {
      'name': 'Little Riverside Hoi An',
      'location': 'Hội An',
      'price': '1.500.000đ / đêm',
      'rating': 4.8,
      'image':
          'https://tse2.mm.bing.net/th/id/OVP.XnywE5QNt36scEcbTwkRUAEsDh?pid=Api&h=225&w=300&c=7&rs=1',
    },
    {
      'name': 'Peridot Grand Hotel & Spa',
      'location': 'Hà Nội',
      'price': '2.200.000đ / đêm',
      'rating': 4.9,
      'image':
          'https://tse4.mm.bing.net/th/id/OVP.taYhQUENxHjzIDwjms4bnQEsDh?pid=Api&h=225&w=300&c=7&rs=1',
    },
    {
      'name': 'Victoria Can Tho Resort',
      'location': 'Cần Thơ',
      'price': '1.400.000đ / đêm',
      'rating': 4.7,
      'image':
          'https://tse4.mm.bing.net/th/id/OVP.ueftYSd1AanlHsnfV8NZkQEsDh?pid=Api&h=225&w=300&c=7&rs=1',
    },
    {
      'name': 'FLC Luxury Resort Quy Nhơn',
      'location': 'Quy Nhơn',
      'price': '2.800.000đ / đêm',
      'rating': 4.8,
      'image':
          'https://tse2.mm.bing.net/th/id/OVP.a1sO03p5bwLd_pVPbh1dXAHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFA),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Lưu trú & Nghỉ dưỡng',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final hotel = hotels[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 3,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
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
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text('Địa điểm: ${hotel['location']}'),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange.shade400,
                              size: 16,
                            ),
                            const SizedBox(width: 3),
                            Text('${hotel['rating']}'),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Giá: ${hotel['price']}',
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigator.pushNamed(context, '/chitietLuuTru', arguments: hotel);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Khám phá'),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Danh mục',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Đơn hàng',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tài khoản'),
        ],
      ),
    );
  }
}
