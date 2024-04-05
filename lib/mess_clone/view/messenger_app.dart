import 'package:flutter/material.dart';

import '../../data/api.dart';

class YourWidget extends StatefulWidget {
  const YourWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  late Future<List<dynamic>> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Widget'),
      ),
      body: Column(
        children: [
          const SearchBar(hintText: 'Search'),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: _futureData,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      List<dynamic> data = snapshot.data ?? [];
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final item = data[index];
                          return InkWell(
                              onTap: () {
                                // Handle item tap
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(item['avatar'] ?? ''),
                                ),
                                title: Text(
                                  '${item['first_name']} ${item['last_name']}',
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                                subtitle: Text('${item['email']}'),
                              ));
                        },
                      );
                    }
                  default:
                    return const SizedBox(); // Return an empty SizedBox for other connection states
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final String hintText;

  const SearchBar({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        style: const TextStyle(color: Colors.white), // Text color
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white), // Hint text color
          filled: true,
          fillColor: const Color.fromARGB(255, 29, 29, 29), // Background color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide.none, // No border side
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          prefixIcon:
              const Icon(Icons.search, color: Colors.white), // Icon color
        ),
      ),
    );
  }
}
