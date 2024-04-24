import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortee/data/data.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20), // Add SizedBox here
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Bookmarks',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  color: Color(0xFF1d2038),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Catch a glimpse of your bookmarked accessed commands, this section is dedicated for swift retrieval and enhanced productivity.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  color: Color(0xFF1d2038),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: dictionaryData
                    .where((data) => data['isBookmark'] == true)
                    .length,
                itemBuilder: (context, int i) {
                  final bookmarkedData = dictionaryData
                      .where((data) => data['isBookmark'] == true)
                      .toList();
                  final String command = bookmarkedData[i]['command'] as String;
                  final String category =
                      bookmarkedData[i]['category'] as String;
                  final String description =
                      bookmarkedData[i]['description'] as String;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
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
                              '$command',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF1d2038),
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Category: $category',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: Color(0xFF1d2038),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Description: $description',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: Color(0xFF1d2038),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.bookmark,
                                  color: Color(0xFF0c6ab0),
                                ),
                                SizedBox(width: 5),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      dictionaryData.firstWhere((data) =>
                                          data['command'] ==
                                          command)['isBookmark'] = false;
                                    });
                                  },
                                  child: Text(
                                    'Remove Bookmark',
                                    style: TextStyle(
                                      color: Color(0xFF0c6ab0),
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
