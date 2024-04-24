import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shortee/data/data.dart';
import 'package:shortee/screens/cna-list.dart';
import 'package:shortee/screens/linux-list.dart';
import 'package:shortee/screens/mongodb-list.dart';
import 'package:shortee/screens/mysql-list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortee/screens/windows-list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0, top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hey there Developer!',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Color(0xFF1d2038),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Transform your mobile device into an interactive Command Line Interface cheat sheet dictionary!',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Browse by Category',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  _buildCategoryCard(
                    context,
                    'Windows',
                    dictionaryData
                        .where((data) => data['category'] == 'windows')
                        .length,
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WindowsListScreen()));
                    },
                    'lib/assets/windows-10-icon.webp',
                  ),
                  _buildCategoryCard(
                    context,
                    'Linux',
                    dictionaryData
                        .where((data) => data['category'] == 'linux')
                        .length,
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LinuxListScreen()));
                    },
                    'lib/assets/linux-icon.webp',
                  ),
                  _buildCategoryCard(
                    context,
                    'CNA Routing',
                    dictionaryData
                        .where((data) => data['category'] == 'CNA Routing')
                        .length,
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CnaListScreen()));
                    },
                    'lib/assets/cisco-icon.png',
                  ),
                  _buildCategoryCard(
                    context,
                    'MongoDB',
                    dictionaryData
                        .where((data) => data['category'] == 'mongoDB')
                        .length,
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MongodbListScreen()));
                    },
                    'lib/assets/mongodb-icon.webp',
                  ),
                  _buildCategoryCard(
                    context,
                    'MySQL Queries',
                    dictionaryData
                        .where((data) => data['category'] == 'mySQL')
                        .length,
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MysqlListScreen()));
                    },
                    'lib/assets/mysql-icon.webp',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, int resultCount,
      Function() onTap, String imagePath) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Color(0xFFb8e1ff),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Photo
            Container(
              width: 80,
              height: 80,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 10),
            // Title
            Text(
              title,
              style: TextStyle(
                color: Color(0xFF1D2038),
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            SizedBox(height: 5),
            // Description
            Text(
              '$resultCount results',
              style: TextStyle(
                color: Colors.black,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
