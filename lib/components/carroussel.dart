import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarrouselSlider extends StatefulWidget {
  const CarrouselSlider({Key? key}) : super(key: key);

  @override
  State<CarrouselSlider> createState() => _CarrouselSliderState();
}

class _CarrouselSliderState extends State<CarrouselSlider> {
  var items = [1,2,3,4,5];
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow:  [
              BoxShadow(
                  color: Colors.blue.withOpacity(.3),
                  blurRadius: 1.2,
                  spreadRadius: 2,
                  offset: Offset(5,5)

              )
            ]
        ),
        margin: EdgeInsets.only(left: 20,right: 20,top: 5),
        child: CarouselSlider(
            items: [Image.asset('assets/onb2.PNG'),Image.asset('assets/image.png'),Image.asset('assets/onb1.PNG')],
            options: CarouselOptions(
              height: 140,
              aspectRatio: 16/9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 5),
              autoPlayCurve: Curves.bounceOut,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              animateToClosest: true,
            )
        )
    );
  }
}
