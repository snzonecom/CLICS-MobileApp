import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/data.dart';

final List<Map<String, dynamic>> data = dictionaryData.toList();

List<Map<String, dynamic>> _foundCodes = data;

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This function is called whenever the text field changes
    void _runFilter(String enteredKeyword) {
      List<Map<String, dynamic>> searched = [];
      if (enteredKeyword.isEmpty) {
        // if the search field is empty or only contains white-space, we'll display all users
        searched = data;
        _foundCodes = searched;
        (context as Element).reassemble();
      } else {
        searched = data
            .where((datum) => datum["command"]
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
        (context as Element).reassemble();

        _foundCodes = searched;
      }
    }

    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0, top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search here Developer!',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'In search for a specific CLI command? Search here to find it faster!',
              style: GoogleFonts.poppins(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFF0c6ab0),
              ),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  hintText: 'Search...',
                  filled: true,
                  fillColor: Colors.transparent,
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: _foundCodes.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundCodes.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundCodes[index]["command"]),
                        color: Color(0xFFb8e1ff),
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(
                            _foundCodes[index]["command"].toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1d2038),
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Category: ${_foundCodes[index]["category"].toString()}',
                                style: GoogleFonts.poppins(color: Colors.black),
                              ),
                              Text(
                                'Description: ${_foundCodes[index]["description"].toString()}',
                                style: GoogleFonts.poppins(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Text(
                      'No results found',
                      style: GoogleFonts.poppins(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
