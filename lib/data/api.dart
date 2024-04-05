import 'package:dio/dio.dart';

Future<List<dynamic>> fetchUsers() async {
  try {
    final dio = Dio();
    final response = await dio.get('https://reqres.in/api/users?page=2');
    if (response.statusCode == 200) {
      return response.data['data'];
    } else {
      throw Exception('Failed to fetch users. StatusCode: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to fetch users');
  }
}