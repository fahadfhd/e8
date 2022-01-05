import 'package:e8/cart/cart_screen.dart';
import 'package:e8/course/course.dart';
import 'package:e8/home/providers/home_provider.dart';
import 'package:e8/home/screens/home_screen.dart';
import 'package:e8/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatefulWidget {
  static const String route = "/bottom_nav";
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // ignore: unused_field
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreeViw(),
    CourseScreen(),
    Text(
      'Index 2: cart',
      style: optionStyle,
    ),
    CardScreen(),
    Text(
      'Index 4: Account',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //   bottomOpacity: 0.0,
      //   elevation: 0.0,
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back_ios,
      //       color: colorBlack,
      //       size: 20,
      //     ),
      //     onPressed: Navigator.of(context).pop,
      //   ),
      // ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: colorGrey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.play_circle_fill_outlined,
              color: colorGrey,
            ),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book_outlined,
              color: colorGrey,
            ),
            label: 'Exam',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: colorGrey,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              color: colorGrey,
            ),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
