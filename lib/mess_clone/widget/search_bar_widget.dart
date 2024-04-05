import 'package:flutter/material.dart';


class SearchBar extends StatelessWidget {
  final String hintText;

  const SearchBar({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white), // Text color
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white), // Hint text color
        filled: true,
        fillColor: Colors.grey[800], // Background color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none, // No border side
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        prefixIcon: Icon(Icons.search, color: Colors.white), // Icon color
      ),
    );
  }
}
