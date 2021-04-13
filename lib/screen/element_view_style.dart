import 'package:flutter/material.dart';
import 'package:news_api_project/models/news_info_model.dart';

class ElementViewStyle extends StatelessWidget {
  const ElementViewStyle({
    Key key,
    @required this.articles,
  }) : super(key: key);

  final Article articles;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 100,
      child: Row(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                articles.urlToImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Flexible(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                articles.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                articles.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
            ],
          ))
        ],
      ),
    );
  }
}
