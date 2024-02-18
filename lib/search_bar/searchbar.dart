// ignore_for_file: unused_label

import 'package:flutter/material.dart';

class SearchApp extends StatefulWidget {
  const SearchApp({Key? key}) : super(key: key);

  @override
  State<SearchApp> createState() => _SearchAppState();
}class _SearchAppState extends State<SearchApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(16.0), // Adjust margin as needed
      child: TextField(
        decoration:  InputDecoration(
          // Search bar style
          focusedBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(50.0),
               borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: 'Search',
         hintStyle:  const TextStyle(fontSize: 20.0, color: Color.fromARGB(255, 146, 135, 135)),
          prefixIcon: const Icon(Icons.search,
          color: Color.fromARGB(255, 131, 131, 131),),
           filled: true,
          fillColor: const Color.fromARGB(255, 51, 51, 51), // Set background color here
                    contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
        ),
        
        onChanged: (value) {
          // Implement your search logic here
        },
      ),
    );
  }
}
