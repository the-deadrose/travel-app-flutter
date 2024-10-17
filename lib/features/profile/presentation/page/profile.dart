import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Profile'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // circular image
            const Center(
              child: CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('assets/images/main.jpg'),
              ),
            ),

            // name
            const SizedBox(height: 10.0),
            // Text(
            //   'Bishal Shrestha',
            //   style: TextStyle(
            //     fontSize: 20.0,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),

            Center(
              child: Container(
                alignment: Alignment.center,
                height: 300,
                width: 300,
                color: Colors.red,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      profileText('Name', 'Bishal Shrestha'),
                      const SizedBox(height: 10.0),
                      profileText('Email', 'bishals554@gmail.com'),
                    ],
                  ),
                ),
              ),
            )

            // email
          ],
        ));
  }
}

// widget

Widget profileText(String key, String value) {
  return Row(
    children: [
      Center(
        child: Text(
          '$key:',
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(width: 5.0),
      Align(
          alignment: Alignment.centerLeft,
          child: Text(value, style: const TextStyle(fontSize: 16.0))),
    ],
  );
}
