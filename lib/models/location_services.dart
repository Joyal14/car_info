import 'package:dio/dio.dart';

class LocationService {
  final String _apiKey = 'AIzaSyBJxhus7Z88n_nl0lUfjCA10MjP7LEDciw';
  final Dio _dio = Dio();

  Future<List<String>> getSuggestions(String text) async {
    const String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    final Map<String, dynamic> params = {
      'input': text,
      'key': _apiKey,
    };

    try {
      Response response = await _dio.get(url, queryParameters: params);
      var predictions = response.data['predictions'] as List<dynamic>;
      List<String> suggestions = predictions.map<String>((prediction) {
        return prediction['description'] as String;
      }).toList();
      return suggestions;
    } catch (e) {
      print('Error fetching suggestions: $e');
      throw e;
    }
  }

  Future<String> getPlaceId(String input) async {
    const String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json';
    final Map<String, dynamic> params = {
      'input': input,
      'inputtype': 'textquery',
      'key': _apiKey,
    };

    try {
      Response response = await _dio.get(url, queryParameters: params);
      var placeId = response.data['candidates'][0]['place_id'] as String;
      return placeId;
    } catch (e) {
      print('Error fetching place ID: $e');
      throw e;
    }
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);
    const String url =
        'https://maps.googleapis.com/maps/api/place/details/json';
    final Map<String, dynamic> params = {
      'place_id': placeId,
      'key': _apiKey,
    };

    try {
      Response response = await _dio.get(url, queryParameters: params);
      var result = response.data['result'] as Map<String, dynamic>;
      return result;
    } catch (e) {
      print('Error fetching place details: $e');
      throw e;
    }
  }
}
