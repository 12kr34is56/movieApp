import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen/category_screen.dart';

class CategoryContainer extends StatelessWidget {
  final String category;
  const CategoryContainer({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>CategoryScreen(category: category,)),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: Colors.white, width: 2.3),
          // White border color
        ),
        elevation: 4.0, // Adjust the elevation as needed
        shadowColor: Colors.white, // Color of the shadow

        child: Center(
            child: Text(
              category,
              style: TextStyle(color: Colors.red,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                  fontFamily: "Playfair Display SC"),
            )),
      ),
    );
  }
}
