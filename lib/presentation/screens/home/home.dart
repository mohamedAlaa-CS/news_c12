import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sat/core/assets_manager.dart';
import 'package:news_app_c12_online_sat/core/colors_manager.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/home_drawer/home_drawer.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/tabs/categories/categories.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/tabs/settings/settings.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget selectedWidget = Categories();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ColorsManager.white,
          image: DecorationImage(image: AssetImage(AssetsManager.bgPattern))),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
          ),
          drawer: HomeDrawer(
            onMenuItemClicked: onDrawerItemClick,
          ),
          body: selectedWidget),
    );
  }

  void onDrawerItemClick(MenuItem item) {
    Navigator.pop(context);
    if (item == MenuItem.categories) {
      selectedWidget = Categories();
    } else if (item == MenuItem.settings) {
      selectedWidget = Settings();
    }
    setState(() {});
  }
}
