import 'package:flutter/material.dart';
import 'package:flutter_tinder/functions/alertfunction.dart';
import 'package:flutter_tinder/utlis/constants.dart';
import 'package:flutter_tinder/widgets/appbar.dart';
import 'package:flutter_tinder/widgets/bottombar.dart';
import 'package:swipe_cards/swipe_cards.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  List<String> names = [
    'Sushma',
    'Bhagya',
    'Sumi',
    'Navya',
    'Roshni',
    'Chandan',
    'Narendra',
  ];

  @override
  void initState() {
    for (int i = 0; i < names.length; i++) {
      _swipeItems.add(SwipeItem(
        content: Content(text: names[i]),
        likeAction: () {
          actions(context, names[i], 'Liked');
        },
        nopeAction: () {
          actions(context, names[i], 'Rejected');
        },
        superlikeAction: () {
          actions(context, names[i], 'Super Liked');
        },
      ));
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            TopBar(),
            Expanded(
                child: Container(
              child: SwipeCards(
                matchEngine: _matchEngine!,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(images[index]),
                      fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(names[index],style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  );
                },
                onStackFinished: () {
                  return ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('List is over')));
                },
              ),
            )),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}

class Content {
  final String? text;

  Content({this.text});
}
