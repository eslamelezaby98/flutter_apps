import 'package:flutter/material.dart';
import 'package:news_app_strapi/api/api_network.dart';
import 'package:news_app_strapi/models/categories_model.dart';
import 'package:news_app_strapi/screens/articles/article_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ApiNetwork().getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'News',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<List<CategoriesModel>>(
            future: ApiNetwork().getCategory(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                        ),
                        itemCount:
                            snapshot.data == null ? 0 : snapshot.data.length,
                        itemBuilder: (context, index) {
                          CategoriesModel category = snapshot.data[index];
                          return InkWell(
                            child: GridTile(
                              child: Container(
                                child: Text(
                                  category.nameCategory,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.black,
                                    backgroundColor: Colors.white,
                                    fontSize: 35,
                                  ),
                                ),
                                margin: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        category.imageCategory.caption,
                                      ),
                                    )),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ArticleScreen(
                                    article: category.articles,
                                    articleName: category.nameCategory,
                                  ),
                                ),
                              );
                              print(index);
                            },
                          );
                        },
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
