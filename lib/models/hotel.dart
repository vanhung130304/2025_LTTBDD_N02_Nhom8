class Hotel {
  final String name;
  final String city;
  final num price;
  final String image;

  Hotel({
    required this.name,
    required this.city,
    required this.price,
    required this.image,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      name: json['name']?.toString() ?? 'Không tên',
      city: json['city']?.toString() ?? '',
      price: (json['price'] is num)
          ? json['price']
          : num.tryParse('${json['price']}') ?? 0,
      image: json['image']?.toString() ?? '',
    );
  }
}
