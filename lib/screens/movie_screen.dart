import 'dart:io';

import 'package:flutter/material.dart';
import 'package:netflix_UI_tut/models/movie_model.dart';
import 'package:netflix_UI_tut/widget/circular_clipper.dart';
import 'package:netflix_UI_tut/widget/content_scroll.dart';

class MovieScreen extends StatefulWidget {
  final Movie movie;

  MovieScreen(this.movie);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: [
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Hero(
                  tag: widget.movie.imageUrl,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: AssetImage(widget.movie.imageUrl),
                    ),
                  ),
                ),
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.only(left: 30.0),
                    onPressed: () => Navigator.pop(context),
                    icon: Icon( Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios),
                    iconSize: 30.0,
                    color: Colors.black,
                  ),
                  Image(
                    image: AssetImage('assets/images/netflix_logo.png'),
                    height: 60.0,
                    width: 150.0,
                  ),
                  IconButton(
                    padding: EdgeInsets.only(left: 30.0),
                    onPressed: () => print('Add faborite movie'),
                    icon: Icon(Icons.favorite_border),
                    iconSize: 30.0,
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
           Positioned.fill(
            bottom: -10.0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RawMaterialButton(
                elevation: 12.0,
                padding: EdgeInsets.all(10.0),
                onPressed: () => print('play video'),
                shape: CircleBorder(),
                fillColor: Colors.white,
                child: Icon(
                  Icons.play_arrow,
                  size: 60.0,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 25.0,
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () => print('Add'),
              iconSize: 30.0,
              color: Colors.black,
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 25.0,
            child: IconButton(
              icon: Icon(Icons.share),
              onPressed: () => print('share'),
              iconSize: 30.0,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              children: [
                Text(widget.movie.title.toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0,),
                Text(
                  widget.movie.categories,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 12.0),
                Text(
                  '⭐ ⭐ ⭐ ⭐',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'year',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          widget.movie.year.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'country',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          widget.movie.country.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'length',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          '${widget.movie.length} min',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25.0),
                Container(
                  height: 125.0,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.movie.description,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ContentScroll(
            images: widget.movie.screenshots,
            title: 'Screenshot',
            imageHeight: 200.0,
            imageWidth: 250.0,
          ),
        ],
      ),
    );
  }
}