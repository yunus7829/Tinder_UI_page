import 'package:flutter/material.dart';
import 'package:flutter_tinder/widgets/bottombar.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      //color: Colors.blue,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buttonWidget(Icons.star, Colors.amber),
          imageWidget('assets/tinder.png'),
          imageWidget('assets/Diamond.png'),
          buttonWidget(Icons.notifications, Colors.grey.shade400),
        ],
      ),
    );
  }
}
Widget imageWidget(String image){
  return Container(
    height: 60,
      width: 60,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage(
          image
        ),
          fit: BoxFit.cover,
      )
    ),
  );
}