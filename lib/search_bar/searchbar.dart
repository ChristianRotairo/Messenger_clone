import 'package:flutter/material.dart';

class SearchApp extends StatefulWidget {
  const SearchApp({Key? key}) : super(key: key);

  @override
  State<SearchApp> createState() => _SearchAppState();
}

class _SearchAppState extends State<SearchApp> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: TextField(
                controller: _textEditingController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: 'Search',
                  hintStyle: const TextStyle(fontSize: 20.0, color: Color.fromARGB(255, 146, 135, 135)),
                  prefixIcon: const Icon(Icons.search, color: Color.fromARGB(255, 131, 131, 131)),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 51, 51, 51),
                  contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                ),
                onChanged: (value) {
                  // Implement your search logic here
                  
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 0, 0, 0),
              child: ListView.builder(
                itemCount: 130, // Example item count, replace with your actual data
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index'),
                    textColor: Colors.white,
                    // Add more ListTile properties or customize as needed
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
