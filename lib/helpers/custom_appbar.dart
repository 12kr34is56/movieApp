import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'category_container.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(40.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: CarouselSlider(
        items: [
          CategoryContainer(
            category: "Comedy",
          ),
          CategoryContainer(
            category: "Sports",
          ),
          CategoryContainer(
            category: "Anime",
          ),
          CategoryContainer(
            category: "Romance",
          ),
          CategoryContainer(
            category: "K drama",
          ),
          CategoryContainer(
            category: "C drama",
          ),
          CategoryContainer(
            category: "Action",
          ),
        ],
        options: CarouselOptions(
          height: 80.0,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          viewportFraction: 0.8,
        ),
      ),
    );
  }
}

