import 'package:clone_mess/search_bar/searchbar.dart';
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
       drawer: const Drawer(),
      appBar: AppBar(
        title: Text(
          'Chats',
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              color: Colors.white,     
            ),
          ),
        ),
        iconTheme:const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        backgroundColor: Colors.black87,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: const SearchApp(),
      backgroundColor: Colors.black12,
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.chat_bubble_rounded,
            ),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Icons.video_camera_back_rounded, color: Colors.white),
            label: 'Calls',
          ),
           NavigationDestination(
            icon: Icon(Icons.electric_bolt_sharp, color: Colors.white),
            label: 'Highlights',
          ),
           NavigationDestination(
            icon: Icon(Icons.people, color: Colors.white),
            label: 'People',
          ),
        ],
      ),
    );
  }
}
