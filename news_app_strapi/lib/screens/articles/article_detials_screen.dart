import 'package:flutter/material.dart';
import 'package:news_app_strapi/models/categories_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetialsScreen extends StatelessWidget {
  final Article article;
  const ArticleDetialsScreen({this.article});

  _lanchUrl() async {
    var url = article.urlArticle;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Article Detials',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    Text(
                      article.titleArticle,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(height: 10),
                    Text(
                      article.descriptionArticle,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            article.imageArticle.caption,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      article.contentArticle,
                      style: TextStyle(
                        wordSpacing: 5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                _lanchUrl();
              },
              color: Colors.indigo[200],
              child: Text(
                'More Detials',
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
