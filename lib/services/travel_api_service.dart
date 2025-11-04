import 'dart:convert';
import 'package:http/http.dart' as http;

class TravelApiService {
  static const String _baseUrl =
      'https://travel-guide-api-city-guide-top-places.p.rapidapi.com/check?noqueue=1';

  static const Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'X-RapidAPI-Key': '79005bb626msh69464491d30ab1cp188d36jsn2748d10431f9',
    'X-RapidAPI-Host': 'travel-guide-api-city-guide-top-places.p.rapidapi.com',
  };

  static Future<List<dynamic>> fetchPlaces({
    String region = "London",
    String language = "en",
    List<String> interests = const ["historical", "cultural", "food"],
  }) async {
    final body = json.encode({
      "region": region,
      "language": language,
      "interests": interests,
    });

    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: _headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return jsonBody['data'] ?? jsonBody['places'] ?? [];
    } else {
      throw Exception('Không thể tải dữ liệu: ${response.statusCode}');
    }
  }
}
