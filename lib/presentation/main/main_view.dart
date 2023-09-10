import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_comerce/presentation/main/main_view_provider.dart';
import 'package:e_comerce/presentation/main/sections/home/home_view.dart';
import 'package:e_comerce/presentation/main/sections/saved/saved_view.dart';

import 'sections/cart/cart_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  final _pageController =  PageController();
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainViewProvider(),
      child: Consumer<MainViewProvider>(builder: (context, provider, _) {
        final List<Widget> pages = [
          const HomeView(),
          const SavedView(),
          CartPage(),
        ];
        return Scaffold(
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: pages,
          ),
          bottomNavigationBar: _bottomNavigation(provider),
        );
      }),
    );
  }

  BottomNavigationBar _bottomNavigation(MainViewProvider provider) {
    return BottomNavigationBar(
      currentIndex: provider.currentIndex, 
      onTap: (index) {
        provider.setCurrentIndex(index);
        _pageController.jumpToPage(provider.currentIndex);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Saved',
          activeIcon: Icon(Icons.favorite,color: Colors.red,),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Cart',
        ),
      ],
    );
  }
}
