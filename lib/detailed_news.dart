import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'loginPage.dart';
import 'homePage.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'style.dart';


class detailedNews extends StatefulWidget {
  String detail;
  String imageURL;
  String headline;
  String author;
   detailedNews({Key? key, required this.author,required this.imageURL, required this.headline,required this.detail}) : super(key: key);

  @override
  _detailedNewsState createState() => _detailedNewsState();
}

class _detailedNewsState extends State<detailedNews> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff212121),
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
              "By "+widget.author,
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
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight*0.7,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Text(
                  widget.headline,
                  style: Theme.of(context).textTheme.h3,
                ),
              ),
              Container(
                child: AspectRatio(
                  aspectRatio: 2 / 1,
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl:widget.imageURL ,
                      imageBuilder: (context, imageProvider) =>
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                      placeholder: (context, url) => Center(
                        child: Container(),
                      ),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.image),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Text(
                  widget.detail,
                  style: Theme.of(context).textTheme.h4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

