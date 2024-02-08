// // import 'package:http/http.dart' as http;
// // import 'dart:convert' as convert;

// // class LocationService {
// //   final String key = 'AIzaSyBJxhus7Z88n_nl0lUfjCA10MjP7LEDciw';

// //   Future<String> getPlaceId(String input) async {
// //     final String url =
// //         'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';

// //     var response = await http.get(Uri.parse(url));

// //     var json = convert.jsonDecode(response.body);

// //     var placeId = json['candidates'][0]['place_id'] as String;

// //     print(placeId);

// //     return placeId;
// //   }

// //   Future<Map<String, dynamic>> getPlace(String input) async {
// //     final placeId = await getPlaceId(input);
// //     final String url =
// //         'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';

// //     var response = await http.get(Uri.parse(url));

// //     var json = convert.jsonDecode(response.body);

// //     var result = json['result'] as Map<String, dynamic>;
// //     print(result);
// //     return result;
// //   }
// // }

// import 'package:dio/dio.dart';

// class LocationService {
//   final String _key = 'AIzaSyBJxhus7Z88n_nl0lUfjCA10MjP7LEDciw';
//   final Dio _dio = Dio();

//   Future<String> getPlaceId(String input) async {
//     final String url =
//         'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$_key';

//     try {
//       Response response = await _dio.get(url);
//       var json = response.data;
//       var placeId = json['candidates'][0]['place_id'] as String;
//       return placeId;
//     } catch (e) {
//       print('Error: $e');
//       throw e;
//     }
//   }

//   Future<Map<String, dynamic>> getPlace(String input) async {
//     final placeId = await getPlaceId(input);
//     final String url =
//         'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$_key';

//     try {
//       Response response = await _dio.get(url);
//       var json = response.data;
//       var result = json['result'] as Map<String, dynamic>;
//       return result;
//     } catch (e) {
//       print('Error: $e');
//       throw e;
//     }
//   }

//   getSuggestions(String text) {}
// }

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
