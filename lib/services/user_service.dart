import 'package:dio/dio.dart';
import 'package:meurastreio/models/user.dart';

class UserService {
  final Dio _dio = Dio();
  final String _baseUrl = "http://10.0.2.2:3000";

  Future<bool> login(String email, String password) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/users',
        queryParameters: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final List users = response.data;
        if (users.isNotEmpty) {
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<User?> getUserById(String id) async {
    try {
      final response = await _dio.get('$_baseUrl/users/$id');
      return User.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  Future<bool> createUser(User user) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/users',
        data: user.toJson(),
      );
      return response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateUser(String id, User user) async {
    try {
      final response = await _dio.put(
        '$_baseUrl/users/$id',
        data: user.toJson(),
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteUser(String id) async {
    try {
      final response = await _dio.delete('$_baseUrl/users/$id');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
