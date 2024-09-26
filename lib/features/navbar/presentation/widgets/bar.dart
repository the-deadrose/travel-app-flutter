import 'package:flutter/material.dart';
import 'package:travel_app_flutter/core/widgets/reusable_text.dart';

class Bar extends StatelessWidget {
  const Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite,
            size: 200.0,
            color: Color(0xffE1D5C9),
          ),
          AppText(
            text: "Favorite",
            size: 20,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          )
        ],
      ),
    );
  }
}
