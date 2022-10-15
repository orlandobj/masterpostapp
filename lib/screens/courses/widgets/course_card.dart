import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:masterpost/utils/masterColors.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseCard extends StatefulWidget {
  CourseCard(String name, String description, String imagePath, String link, double rating) {
    this.name = name;
    this.description = description;
    this.imagePath = imagePath;
    this.link = link;
    this.rating = rating;
  }

  String name;
  String description;
  String imagePath;
  String link;
  double rating;

  @override
  _CourseCardState createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        launch(widget.link);
      },
      child: Container(
        height: MediaQuery.of(context).size.height*0.15,
        margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.03),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.transparent,
              child: Center(
                child: Image.network(
                  widget.imagePath,
                  height: MediaQuery.of(context).size.width * 0.15,
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width*0.04,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(widget.name),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: RatingBar(
                        initialRating: widget.rating,
                        direction: Axis.horizontal,
                        ignoreGestures: true,
                        allowHalfRating: true,
                        glowRadius: 0,
                        itemSize: MediaQuery.of(context).size.width*0.04,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                          full: _image('images/heart.png', MediaQuery.of(context).size.width*0.003),
                          half: _image('images/heart_half.png', MediaQuery.of(context).size.width*0.003),
                          empty: _image('images/heart_border.png', MediaQuery.of(context).size.width*0.003),
                        ),
                        itemPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.00),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                    Text(widget.rating.toString())
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.6,
                  height: MediaQuery.of(context).size.width*0.16,
                  child: SingleChildScrollView(child: Text(widget.description, softWrap: true,),),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}

Widget _image(String asset, height) {
  return Container(
    constraints: BoxConstraints(
      maxHeight: 2,
      maxWidth: 2
    ),
    height: 2,
    width: 2,
    child: Center(
      child: Image.asset(
        asset,
        height: height,
        color: MasterColors.red,
      ),
    ),
  );
}
