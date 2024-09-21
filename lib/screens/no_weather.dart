import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('there is no weather 😔 start',
              style: TextStyle(color: Colors.black, fontSize: 30)),
          Text(
            'searching now 🔍',
            style: TextStyle(color: Colors.black, fontSize: 30),
          )
        ],
      ),
    );
  }
}
