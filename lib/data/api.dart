import 'package:dio/dio.dart';

class Vacation {
  final String vacationName;
  final String fromDate;
  final String toDate;
  final String description;
  final int amount;


  Vacation({
    required this.vacationName,
    required this.fromDate,
    required this.toDate,
    required this.description,
    required this.amount,
  });

  factory Vacation.fromJson(Map<String, dynamic> json) {
    return Vacation(
      vacationName: json['vacation_name'],
      fromDate: json['from_date'],
      toDate: json['to_date'],
      description: json['description'],
      amount: json['amount'],
    );
  }
}

class ApiService {
  final Dio dio = Dio();

  Future<List<Vacation>> fetchVacations() async {
    try {
      final response = await dio.get('http://10.0.2.2:8000/api/travelhistory');
      if (response.statusCode == 200) {
        List<Vacation> vacations = (response.data as List)
            .map((json) => Vacation.fromJson(json))
            .toList();
        return vacations;
      } else {
        throw Exception('Failed to fetch data. StatusCode: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }
}
