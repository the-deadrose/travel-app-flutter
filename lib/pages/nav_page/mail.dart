import 'package:flutter/material.dart';
import 'package:travel_app_flutter/widget/reusable_text.dart';

class Mail extends StatelessWidget {
  const Mail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.mail,
            size: 200.0,
            color: Color(0xff1A434E),
          ),
          AppText(
            text: "Mail",
            size: 20,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          )
        ],
      ),
    );
  }
}
