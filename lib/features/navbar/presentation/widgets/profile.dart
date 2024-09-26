import 'package:flutter/material.dart';
import 'package:travel_app_flutter/core/widgets/reusable_text.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person,
            size: 200.0,
            color: Color(0xff1A434E),
          ),
          AppText(
            text: "Profile",
            size: 20,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          )
        ],
      ),
    );
  }
}
