import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'api_services.dart';
import 'article_model.dart';
import 'neu_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'detailed_news.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'style.dart';
import 'bookMarked_news.dart';
import 'package:shimmer/shimmer.dart';


class homePage extends StatefulWidget {

  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  ApiService client = ApiService();


  final user = FirebaseAuth.instance.currentUser!;
  @override

  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    int count=0;
    var Data ={
      1 : "No BookMarks"
    };

    return Scaffold(
      backgroundColor: const Color(0xff212121),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF1B1B1B),

          title: const Text('Home Page'),
          actions: <Widget>[
      Padding(
      padding: EdgeInsets.only(
          top: screenHeight * 0.040097,
          right: screenWidth * 0.077858),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => bookMark(data: Data,)));
          },
          child: const Icon(
            Icons.book,
            size: 30,
            color: Colors.white,
          ),
        )),
    ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      Text(
                        'Signed in as',
                        style: GoogleFonts.firaSans(
                      textStyle: const TextStyle(
                          color: Colors.white, fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        user.email!,
                        style: GoogleFonts.firaSans(
                      textStyle: const TextStyle(
                          color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 40),
                  child: NeuButton(
                      onPressed: () => FirebaseAuth.instance.signOut(),
                      child: const SizedBox(
                          height: 50,
                          width: 100,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 18,
                              top: 10,
                            ),
                            child:
                                Text("Logout", style: TextStyle(fontSize: 20)),
                          )),
                      border: 4),
                )
              ],
            ),
          ),
          FutureBuilder(
              future: client.getArticle(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Article>> snapshot) {
                if (snapshot.hasData) {
                  List<Article>? articles = snapshot.data;
                  return SingleChildScrollView(
                    child: SizedBox(
                      height: screenHeight * 0.761,
                      child: ListView.builder(
                        itemCount: articles!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return
                            GestureDetector(
                              onTap: () async {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => detailedNews(headline: articles[index].title, imageURL: articles[index].urlToImage, detail: articles[index].content, author: articles[index].author,)));
                              },
                              child: Stack(
                                  alignment: Alignment.topRight,
                                children: <Widget>[
                                  Neumorphic(
                                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                                  style: const NeumorphicStyle(
                                    intensity: .3,
                                    color: Color.fromRGBO(43, 43, 43, 1),
                                    depth: -10,
                                  ),
                                  child: Column(
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 2 / 1,
                                        child: Center(
                                          child: CachedNetworkImage(
                                            imageUrl: articles[index].urlToImage,
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
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 16.0),
                                        child: Text(
                                         articles[index].title,
                                          style: Theme.of(context).textTheme.h3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                  Positioned(
                                    top:10,
                                    child: GestureDetector(
                                      child: const Icon(
                                        Icons.bookmark_add,
                                        color: Colors.pink,
                                        size: 50.0,
                                      ),
                                      onTap: (){
                                        const snackBar = SnackBar(content: Text('Bookmarked'));
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                           addBookmark(newsHeadline: articles[index].title);
                                           count++;
                                           Data[count]= articles[index].title.toString();
                                        },
                                    ),
                                  ),
                                ]
                              ),
                            );
                        },
                      ),
                    ),
                  );
                }
             else return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ],
      ),
    );
  }
}



Future addBookmark({required String newsHeadline})async{
final docUser =FirebaseFirestore.instance.collection('user').doc('my-id');
  final json={
    'bookmark':newsHeadline,
  };
  await docUser.set(json);
}