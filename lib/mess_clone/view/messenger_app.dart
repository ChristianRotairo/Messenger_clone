import 'package:flutter/material.dart';
import '../../data/api.dart';

class YourWidget extends StatefulWidget {
  const YourWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  late Future<List<Vacation>> _futureData;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _futureData = _apiService.fetchVacations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Widget'),
      ),
      body: FutureBuilder<List<Vacation>>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return Center(
                child: Text('Error: ${snapshot.error ?? "Data is null"}'));
          } else {
            List<Vacation> data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final vacation = data[index];
                return ListTile(
                  title: Text(
                    vacation.vacationName,
                    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('From: ${vacation.fromDate}'),
                      Text('To: ${vacation.toDate}'),
                      Text('Description: ${vacation.description}'),
                      Text('Amount: ${vacation.amount}'), // assuming amount is an int
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
