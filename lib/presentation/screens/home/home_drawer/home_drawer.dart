import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c12_online_sat/config/theme/app_styles.dart';
import 'package:news_app_c12_online_sat/core/colors_manager.dart';
import 'package:news_app_c12_online_sat/core/strings_manager.dart';

typedef OnMenuItemClicked = void Function(MenuItem);

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key, required this.onMenuItemClicked});

  OnMenuItemClicked onMenuItemClicked;

  static const categories = 1;
  static const settings = 2;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 110.h,
            color: ColorsManager.green,
            child: Text(
              StringsManager.drawerTitle,
              style: AppStyles.drawerTitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // InkWell(
                //   onTap: () {
                //     onMenuItemClicked(MenuItem.categories);
                //   },
                //   child: Row(
                //     children: [
                //       Icon(Icons.list),
                //       SizedBox(
                //         width: 8.w,
                //       ),
                //       Text(
                //         StringsManager.categories,
                //         style: AppStyles.categories,
                //       ),
                //     ],
                //   ),
                // ),
                // InkWell(
                //   onTap: () {
                //     onMenuItemClicked(MenuItem.settings);
                //   },
                //   child: Row(
                //     children: [
                //       Icon(Icons.settings),
                //       SizedBox(
                //         width: 8.w,
                //       ),
                //       Text(
                //         StringsManager.settings,
                //         style: AppStyles.categories,
                //       ),
                //     ],
                //   ),
                // ),
                buildDrawerItem(
                    icon: Icons.list,
                    text: StringsManager.categories,
                    onClicked: onMenuItemClicked,
                    item: MenuItem.categories),
                SizedBox(
                  height: 12.h,
                ),
                buildDrawerItem(
                    icon: Icons.settings,
                    text: StringsManager.settings,
                    onClicked: onMenuItemClicked,
                    item: MenuItem.settings)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildDrawerItem({
    IconData? icon,
    required String text,
    required MenuItem item,
    required OnMenuItemClicked onClicked,
  }) {
    return InkWell(
      onTap: () {
        onClicked(MenuItem.categories);
      },
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 8.w,
          ),
          Text(
            text,
            style: AppStyles.categories,
          ),
        ],
      ),
    );
  }
}

enum MenuItem {
  categories, // 0
  settings, // 1
}
