import 'package:dio/dio.dart';

class AuthService {

  final Dio _dio = Dio(BaseOptions(baseUrl: "https://dummyjson.com/"));


  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await _dio.post(
        'auth/login',
        data: {
          'username': username,
          'password': password,
        },
      );


      return response.data;

    } on DioException catch (e) {
      String errorMessage = e.response?.data['message'] ?? "The Username or Password is Incorrect";

      throw errorMessage;
    }
  }


  Future<Map<String, dynamic>> signup(String firstName, String email, String password) async {
    try {
      final response = await _dio.post(
        'users/add',
        data: {
          'firstName': firstName,
          'email': email,
          'password': password,
        },
      );


      return response.data;

    } on DioException catch (e) {
      String errorMessage = e.response?.data['message'] ?? "Action field Please Try Again ! ً";
      throw errorMessage;
    }
  }

  Future<Map<String, dynamic>> signUp({
    required String name,
    required String email,
    required String password,
    String? phone,
    String? gender
  }) async {
    try {
      final response = await _dio.post('users/add', data: {
        'firstName': name,
        'email': email,
        'password': password,
        'phone': phone,
        'gender': gender,
      });
      return response.data;
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? "Loading Error";
    }
  }
}