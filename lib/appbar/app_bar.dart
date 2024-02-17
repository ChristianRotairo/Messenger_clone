import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import the google_fonts package

class App extends StatefulWidget {
  const App({Key? key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // Appbar
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chats',
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.black87,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 252, 10, 10),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
