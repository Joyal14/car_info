import 'package:dio/dio.dart';
import 'package:ork_app/models/vechile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiHelper {
  static const String baseUrl = 'https://api.orkindia.com/api/v1/users';

  static Dio createDio() {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  }

  static Future<List<Doc>> fetchCarProfiles() async {
    Dio dio = createDio();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String accessToken = prefs.getString("access_token") ?? "";
      print(accessToken);
      dio.options.headers['Authorization'] = accessToken;

      Response response = await dio.get(
        '$baseUrl/getCarProfiles',
        queryParameters: {
          'latitude': "13.3450369",
          'longitude': "74.7512283",
          'sort': "1",
          'page': '1',
          'search': '',
        },
      );

      dynamic responseData = response.data;

      if (responseData is Map<String, dynamic> &&
          responseData.containsKey('data') &&
          responseData['data'] is Map<String, dynamic> &&
          responseData['data'].containsKey('docs') &&
          responseData['data']['docs'] is List) {
        List<Doc> carProfiles = (responseData['data']['docs'] as List)
            .map((json) => Doc.fromJson(json))
            .toList();
        return carProfiles;
      } else {
        print('Invalid response format: $responseData');
        // Handle the error or return an empty list as needed
        return [];
      }
    } catch (e) {
      print('Error: $e');
      // Rethrow the error to be handled in the UI
      throw e;
    }
  }

  static Future<List<Doc>> fetchShowRoom() async {
    Dio dio = createDio();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String accessToken = prefs.getString("access_token") ?? "";
      print(accessToken);
      dio.options.headers['Authorization'] = accessToken;

      Response response = await dio.get(
        '$baseUrl/getshowroomloc',
        queryParameters: {
          'latitude': "13.3450369",
          'longitude': "74.7512283",
          'sort': "1",
          'page': '1',
          'search': '',
        },
      );

      dynamic responseData = response.data;

      if (responseData is Map<String, dynamic> &&
          responseData.containsKey('data') &&
          responseData['data'] is Map<String, dynamic> &&
          responseData['data'].containsKey('docs') &&
          responseData['data']['docs'] is List) {
        List<Doc> showRoomProfiles = (responseData['data']['docs'] as List)
            .map((json) => Doc.fromJson(json))
            .toList();
        return showRoomProfiles;
      } else {
        print('Invalid response format: $responseData');
        // Handle the error or return an empty list as needed
        return [];
      }
    } catch (e) {
      print('Error: $e');
      // Rethrow the error to be handled in the UI
      throw e;
    }
  }
}
