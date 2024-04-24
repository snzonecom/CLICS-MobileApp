import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortee/data/data.dart';

class LinuxListScreen extends StatefulWidget {
  const LinuxListScreen({Key? key}) : super(key: key);

  @override
  _LinuxListScreenState createState() => _LinuxListScreenState();
}

class _LinuxListScreenState extends State<LinuxListScreen> {
  late List<Map<String, dynamic>> cssData;

  @override
  void initState() {
    cssData =
        dictionaryData.where((data) => data['category'] == 'linux').toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Adjust the height as needed
        child: AppBar(
          backgroundColor: Color(0xFF0c6ab0),
          title: Text(
            "Home",
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Padding(
          padding: const EdgeInsets.all(14.0), // Add margin around the contents
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Image.asset(
                    'lib/assets/linux-icon.webp', // Adjust the path as needed
                    width: 70, // Adjust the width as needed
                    height: 70, // Adjust the height as needed
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Linux List',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Text(
                'In need for a CLI cheat sheet dictionary for Linux? Here you go! Quickly access Linux command-line references on the go.',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: ListView.builder(
                  itemCount: cssData.length,
                  itemBuilder: (context, index) {
                    final String command = cssData[index]['command'] as String;
                    final String code = cssData[index]['description'] as String;
                    bool isBookmarked = cssData[index]['isBookmark'] as bool;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: BookmarkableItem(
                        command: command,
                        code: code,
                        isBookmarked: isBookmarked,
                        onBookmarkToggle: (newValue) {
                          setState(() {
                            cssData[index]['isBookmark'] = newValue;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookmarkableItem extends StatelessWidget {
  final String command;
  final String code;
  final bool isBookmarked;
  final ValueChanged<bool> onBookmarkToggle;

  const BookmarkableItem({
    Key? key,
    required this.command,
    required this.code,
    required this.isBookmarked,
    required this.onBookmarkToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFb8e1ff),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              command,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF1d2038),
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            SizedBox(height: 5),
            Text(
              code,
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF1d2038),
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    onBookmarkToggle(!isBookmarked);
                  },
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
                    color: isBookmarked ? Colors.blue : null,
                  ),
                  label: Text(
                    isBookmarked ? 'Remove from Bookmark' : 'Add to Bookmark',
                    style: TextStyle(color: isBookmarked ? Colors.blue : null),
                  ),
                ),
                // Add any additional buttons or widgets here
              ],
            ),
          ],
        ),
      ),
    );
  }
}
