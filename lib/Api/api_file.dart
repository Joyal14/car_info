import 'package:dio/dio.dart';
import 'package:ork_app/models/car_color_model.dart';
import 'package:ork_app/models/showroom_model.dart';
import 'package:ork_app/models/vechile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiHelper {
  static const String baseUrl = 'https://dev-api.orkindia.com/api/v1/users';

  static Dio createDio() {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  }

  static Future<List<VechileListModel>> fetchCarProfiles() async {
    Dio dio = createDio();

    try {
      String accessToken = await _getAccessToken();
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

      return _parseCarResponse(response.data);
    } catch (e) {
      print('Error: $e');
      throw e;
    } finally {
      dio.close();
    }
  }

  static Future<List<ShowRoomModel>> fetchShowRoom() async {
    Dio dio = createDio();

    try {
      String accessToken = await _getAccessToken();
      dio.options.headers['Authorization'] = accessToken;

      Response response = await dio.get(
        'https://dev-api.orkindia.com/api/v1/users/getshowroomloc',
        queryParameters: {
          'latitude': "13.3450369",
          'longitude': "74.7512283",
          'page': '1',
          'search': '',
        },
      );
      print(accessToken);

      return _parseShowRoomResponse(response.data);
    } catch (e) {
      print('Error: $e');
      throw e;
    } finally {
      dio.close();
    }
  }

  static Future<List<CarColorModel>> fetchCarColor() async {
    Dio dio = createDio();

    try {
      String accessToken = await _getAccessToken();
      dio.options.headers['Authorization'] = accessToken;

      Response response = await dio.get(
        '$baseUrl/getcolor',
        queryParameters: {
          'page': '1',
        },
      );

      // Ensure that the response data is a Map<String, dynamic>
      if (response.data is Map<String, dynamic>) {
        // If the response is correct, parse the data
        return [_parseCarColorResponse(response.data)];
      } else {
        // If the response is not as expected, throw an error
        throw Exception(
            'Unexpected response type: ${response.data.runtimeType}');
      }
    } catch (e) {
      print('Error: $e');
      throw e;
    } finally {
      dio.close();
    }
  }

  static Future<String> _getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("access_token") ?? "";
  }

  static List<VechileListModel> _parseCarResponse(dynamic responseData) {
    return (responseData?['data']?['docs'] as List?)
            ?.map((json) => VechileListModel.fromJson(json))
            .toList() ??
        [];
  }

  static List<ShowRoomModel> _parseShowRoomResponse(dynamic responseData) {
    return (responseData?['data']?['docs'] as List?)
            ?.map((json) => ShowRoomModel.fromJson(json))
            .toList() ??
        [];
  }

  static CarColorModel _parseCarColorResponse(
      Map<String, dynamic> responseData) {
    return CarColorModel.fromJson(responseData);
  }
}
