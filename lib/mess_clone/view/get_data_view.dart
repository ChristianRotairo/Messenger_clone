import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../data/api.dart';
import 'add_data_view.dart';

class YourWidget extends StatefulWidget {
  const YourWidget({Key? key}) : super(key: key);

  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  late Future<List<Vacation>> _futureData;
  final ApiService _apiService = ApiService();


Future<void> _handleRefresh() async {
  await Future.delayed(const Duration(seconds: 4)); 
  setState(() {
    _futureData = _apiService.fetchVacations();
  });
}



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
            return LiquidPullToRefresh(
              onRefresh: _handleRefresh,
              child: ListView.builder(
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
                        Text('Created at: ${vacation.created_at}'),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddVacationScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
