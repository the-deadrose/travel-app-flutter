import 'package:flutter/material.dart';
import 'package:travel_app_flutter/core/widgets/reusable_text.dart';

class MiddleAppText extends StatelessWidget {
  const MiddleAppText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: text,
            size: 19,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          const AppText(
            text: "See All",
            size: 14,
            color: Color(0xff1A434E),
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
