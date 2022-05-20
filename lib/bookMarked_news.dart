import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:news_app/homePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'style.dart';


class bookMark extends StatefulWidget {
  Map<int, String> data;
  bookMark({Key? key,required this.data}) : super(key: key);

  @override
  _bookMarkState createState() => _bookMarkState();
}

class _bookMarkState extends State<bookMark> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.106925),
        child: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          backgroundColor: const Color(0xFF1B1B1B),
          title: Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.035236, left: screenWidth * 0.077858),
            child: Text(
              "Bookmarked news",
              style: GoogleFonts.firaSans(
                textStyle: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.040097,
                    right: screenWidth * 0.077858),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => homePage()));
                  },
                  child: const Icon(
                    Icons.close,
                    size: 30,
                  ),
                )),
          ],
        ),
      ),
      /////////////////////////////////////////////////////////////////////////////////////////////////////
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight * 0.761,
          child: ListView.builder(
            itemCount: widget.data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return
                Neumorphic(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        style: const NeumorphicStyle(
                          intensity: .3,
                          color: Color.fromRGBO(43, 43, 43, 1),
                          depth: -10,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          child: Text(
                            widget.data[index+1].toString(),
                            style: Theme.of(context).textTheme.h3,
                          ),
                        ),
                      );
            },
          ),
        ),
      )
    );
  }
}
