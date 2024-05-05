// ignore_for_file: lines_longer_than_80_chars

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmbiz/app/app.dart';
import 'package:tmbiz/player/player.dart';

enum BottomNavigationBarItemType {
  home,
  search,
  add,
  video,
  profile,
}

const colorFilter = ColorFilter.mode(AppColors.primary, BlendMode.srcIn);

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  Map<BottomNavigationBarItemType, Widget> get pages => {
        BottomNavigationBarItemType.home: const PlayerPage(),
        BottomNavigationBarItemType.search: const SizedBox(),
        BottomNavigationBarItemType.add: const SizedBox(),
        BottomNavigationBarItemType.video: const SizedBox(),
        BottomNavigationBarItemType.profile: const SizedBox(),
      };

  Map<BottomNavigationBarItemType, BottomNavigationBarItem> get items => {
        BottomNavigationBarItemType.home: BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            'assets/icons/nav/home.svg',
            colorFilter: colorFilter,
          ), // TmbizAssets.icons.nav.home.svg(colorFilter: colorFilter),
          icon: SvgPicture.asset('assets/icons/nav/home.svg'), // TmbizAssets.icons.nav.home.svg(),
          label: 'Home',
        ),
        BottomNavigationBarItemType.search: BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            'assets/icons/nav/search.svg',
            colorFilter: colorFilter,
          ), // TmbizAssets.icons.nav.search.svg(colorFilter: colorFilter),
          icon: SvgPicture.asset(
              'assets/icons/nav/search.svg'), //  const PhosphorIcon(PhosphorIconsBold.addressBook), //  TmbizAssets.icons.nav.search.svg(),
          label: 'Search',
        ),
        BottomNavigationBarItemType.add: const BottomNavigationBarItem(
          icon: _AddButton(), //  SizedBox(),
          label: 'Add',
        ),
        BottomNavigationBarItemType.video: BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            'assets/icons/nav/video.svg',
            colorFilter: colorFilter,
          ), // TmbizAssets.icons.nav.video.svg(colorFilter: colorFilter),
          icon: SvgPicture.asset(
              'assets/icons/nav/video.svg'), //  const PhosphorIcon(PhosphorIconsBold.addressBook), //  TmbizAssets.icons.nav.video.svg(),
          label: 'Video',
        ),
        BottomNavigationBarItemType.profile: BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            'assets/icons/nav/user.svg',
            colorFilter: colorFilter,
          ), // TmbizAssets.icons.nav.user.svg(colorFilter: colorFilter),
          icon: SvgPicture.asset(
              'assets/icons/nav/user.svg'), //  const PhosphorIcon(PhosphorIconsBold.addressBook), //  TmbizAssets.icons.nav.user.svg(),
          label: 'Profile',
        ),
      };

  static final itemOrder = [
    BottomNavigationBarItemType.home,
    BottomNavigationBarItemType.search,
    BottomNavigationBarItemType.add,
    BottomNavigationBarItemType.video,
    BottomNavigationBarItemType.profile,
  ];

  @override
  Widget build(BuildContext context) {
    final currentType = context.select((AppCubit cubit) => cubit.state.currentBottomNavigationBarType);

    return Scaffold(
      body: pages[currentType],
      bottomNavigationBar: BottomNavBarView(
        currentIndex: itemOrder.indexOf(currentType),
        onTap: (int index) {
          context.read<AppCubit>().updateAppBottomNavigationBarItemType(itemOrder[index]);
        },
        items: itemOrder.map<BottomNavigationBarItem>((e) => items[e]!).toList(),
      ),
      // floatingActionButton: ,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({
    required this.items,
    this.currentIndex = 0,
    this.onTap,
    super.key,
  });

  final int currentIndex;
  final List<BottomNavigationBarItem> items;
  final void Function(int)? onTap;

  Widget _buildItem(BottomNavigationBarItem item, bool active) {
    return GestureDetector(
      onTap: () {
        final index = items.indexOf(item);
        if (index == 2) return; // middle button not clickable
        onTap?.call(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          active ? item.activeIcon : item.icon,
          SizedBox(height: active ? 8 : 6),
          if (active)
            Container(
              width: 24,
              height: 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.primary,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < items.length; i++) {
      children.add(_buildItem(items[i], currentIndex == i));
    }

    return BottomAppBar(
      height: 90, // kBottomNavigationBarHeight + 2,
      color: AppColors.container,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(200),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(200),
        child: const Padding(
          padding: EdgeInsets.all(11.0),
          child: Icon(
            Icons.add_rounded,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }
}
