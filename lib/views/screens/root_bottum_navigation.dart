import 'package:flutter/material.dart';
import 'package:online_store/views/screens/nav_screens/account_screen.dart';
import 'package:online_store/views/screens/nav_screens/cart_screen.dart';
import 'package:online_store/views/screens/nav_screens/favorite.dart';
import 'package:online_store/views/screens/nav_screens/home_screen.dart';
import 'package:online_store/views/screens/nav_screens/store_screen.dart';

class RootNottumNavigationScreen extends StatefulWidget {
  @override
  State<RootNottumNavigationScreen> createState() =>
      _RootNottumNavigationScreenState();
}

class _RootNottumNavigationScreenState
    extends State<RootNottumNavigationScreen> {
  //const MainScreen({super.key});
  int _pageIndex = 0;
  final List<Widget> pages = [
    const HomeScreen(),
    const FavoriteScreen(),
    const StoreScreen(),
    const CartScreen(),
    const AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          //BottomNavigationBarItem(icon: Image.asset('assets/icons/home.png',width : 25)),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Store"),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: "Account"),
        ],
      ),
      body: pages[_pageIndex],
    );
  }
}
