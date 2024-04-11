import 'package:dio/dio.dart';

class Vacation {
  final String vacationName;
  final String fromDate;
  final String toDate;
  final String description;
  final String created_at;

  Vacation({
    required this.vacationName,
    required this.fromDate,
    required this.toDate,
    required this.description, 
    required this.created_at,

  });

  factory Vacation.fromJson(Map<String, dynamic> json) {
    return Vacation(
      vacationName: json['vacation_name'],
      fromDate: json['from_date'],
      toDate: json['to_date'],
      description: json['description'],
      created_at: json['created_at'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vacation_name': vacationName,
      'from_date': fromDate,
      'to_date': toDate,
      'description': description,
      'created_at': created_at,

    };
  }
}

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<List<Vacation>> fetchVacations() async {
    try {
      final response = await _dio.get('http://10.0.2.2:8000/api/travelhistory');
      if (response.statusCode == 200) {
        List<Vacation> vacations = (response.data as List)
            .map((json) => Vacation.fromJson(json))
            .toList();
        return vacations;
      } else {
        throw Exception(
            'Failed to fetch data. StatusCode: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }


// Post
  Future<Vacation> postVacation(Vacation vacation) async {
    try {
      final response = await _dio.post(
        'http://10.0.2.2:8000/api/travelhistory',
        data: vacation.toJson(),
      );

      if (response.statusCode == 201) {
        return Vacation.fromJson(response.data);
      } else if (response.statusCode == 422) {
        final errorMessage = response.data;
        throw Exception('Failed to create vacation: $errorMessage');
      } else {
        throw Exception(
          'Failed to create vacation. StatusCode: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('Error creating vacation: $e');
      rethrow;
    }
  }
}