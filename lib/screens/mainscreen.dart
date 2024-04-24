import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shortee/screens/bookmark-screen.dart';
import 'package:shortee/screens/homescreen.dart';
import 'package:shortee/screens/search-screen.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _HomeState();
}

class _HomeState extends State<MainScreen> {
  var widgetList = [
    HomeScreen(),
    SearchScreen(),
    BookmarkScreen(),
  ];

  int index = 0;
  late Color selectedItem = Color(0xFF022543);
  Color unselectedItem = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // Adjust the height as needed
          child: AppBar(
            backgroundColor: Color(0xFF0c6ab0),
            leading: Padding(
              padding: const EdgeInsets.only(left: 25.0), // Add padding here
              child: Image.asset(
                'lib/assets/clics-logo.png',
                width: 100,
                height: 100,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(right: 1.0), // Add padding here
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CLICS",
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: widgetList[index],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF0c6ab0),
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          elevation: 3,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house_fill,
                  color: index == 0 ? selectedItem : unselectedItem),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search,
                  color: index == 1 ? selectedItem : unselectedItem),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bookmark_fill,
                  color: index == 2 ? selectedItem : unselectedItem),
              label: 'Bookmark',
            ),
          ],
        ),
      ),
    );
  }
}
