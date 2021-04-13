import 'package:flutter/material.dart';
import 'package:news_api_project/models/news_info_model.dart';
import 'package:news_api_project/services/api_manager.dart';

import 'element_view_style.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Welcome> _newsModel;

  @override
  void initState() {
    // TODO: implement initState
    _newsModel = ApiManager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News'),
        ),
        body: Container(
          child: FutureBuilder<Welcome>(
            future: _newsModel,
            builder: (context, snapshot) {
              //if(snapshot.hasData)
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.articles.length,
                      itemBuilder: (context, index) {
                        var articles = snapshot.data.articles[index];
                        return ElementViewStyle(articles: articles);
                      })
                  : Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
            },
          ),
        ));
  }
}
