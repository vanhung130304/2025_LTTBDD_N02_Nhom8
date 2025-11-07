import 'package:flutter/material.dart';
import '../widgets/base_page_scaffold.dart';

class TauHoaPage extends StatefulWidget {
  const TauHoaPage({super.key});

  @override
  State<TauHoaPage> createState() => _TauHoaPageState();
}

class _TauHoaPageState extends State<TauHoaPage> {
  int _selectedIndex = 1;

  // Danh sách tất cả chuyến tàu
  List<Map<String, dynamic>> trainOptions = List.generate(10, (index) {
    return {
      'name': 'Tàu Hỏa ${index + 1}',
      'route': 'Tuyến ${index + 1}',
      'price': '${500 + index * 50}.000đ',
      'rating': 4.0 + (index * 0.1),
      'image':
          'https://tse1.mm.bing.net/th/id/OIP.L368Em5wXC4Kdp_RpvKI4gHaEK?pid=Api&P=0&h=180',
    };
  });

  // Danh sách hiển thị theo tìm kiếm
  List<Map<String, dynamic>> displayedTrains = [];

  @override
  void initState() {
    super.initState();
    displayedTrains = List.from(trainOptions);
  }

  // Hàm lọc khi tìm kiếm
  void filterTrains(String keyword) {
    setState(() {
      if (keyword.isEmpty) {
        displayedTrains = List.from(trainOptions);
      } else {
        displayedTrains = trainOptions.where((train) {
          final nameLower = train['name'].toLowerCase();
          final routeLower = train['route'].toLowerCase();
          final searchLower = keyword.toLowerCase();
          return nameLower.contains(searchLower) || routeLower.contains(searchLower);
        }).toList();
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
      title: 'Tàu Hỏa',
      currentIndex: _selectedIndex,
      showHotPlaces: false,
      onSearchChanged: filterTrains, // Gắn callback tìm kiếm
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Các chuyến tàu hỏa đề xuất',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: displayedTrains.length,
            itemBuilder: (context, index) {
              final train = displayedTrains[index];
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
                        train['image'],
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
                              train['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text('Tuyến: ${train['route']}'),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange.shade400,
                                  size: 16,
                                ),
                                const SizedBox(width: 3),
                                Text('${train['rating'].toStringAsFixed(1)}'),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Giá: ${train['price']}',
                              style: const TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                onPressed: () {},
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
        ],
      ),
    );
  }
}
