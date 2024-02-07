import 'dart:convert';
import 'package:http/http.dart' as http;

class LocationApi {
  final String apiKey;

  LocationApi(this.apiKey);

  Future<List<String>> getSuggestions(String query) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      final predictions = decodedResponse['predictions'] as List<dynamic>;
      return predictions
          .map<String>((prediction) => prediction['description'] as String)
          .toList();
    } else {
      throw Exception('Failed to fetch suggestions');
    }
  }
}
