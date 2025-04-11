import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xff53B175),
      unselectedItemColor: Color(0xff131A2E),
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/shop_icon.svg",
            colorFilter: selectedIndex == 0
                ? ColorFilter.mode(Color(0xff53B175), BlendMode.srcIn)
                : ColorFilter.mode(Color(0xff000000), BlendMode.srcIn),
          ),
          label: 'Shop',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/explore_icon.svg",
            colorFilter: selectedIndex == 1
                ? ColorFilter.mode(Color(0xff53B175), BlendMode.srcIn)
                : ColorFilter.mode(Color(0xff000000), BlendMode.srcIn),
          ),
          label: 'Explore',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/cart_icon.svg",
            colorFilter: selectedIndex == 2
                ? ColorFilter.mode(Color(0xff53B175), BlendMode.srcIn)
                : ColorFilter.mode(Color(0xff000000), BlendMode.srcIn),
          ),
          label: 'Cart',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/favorite_icon.svg",
            colorFilter: selectedIndex == 3
                ? ColorFilter.mode(Color(0xff53B175), BlendMode.srcIn)
                : ColorFilter.mode(Color(0xff000000), BlendMode.srcIn),
          ),
          label: 'Favourite',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/account_icon.svg",
            colorFilter: selectedIndex == 4
                ? ColorFilter.mode(Color(0xff53B175), BlendMode.srcIn)
                : ColorFilter.mode(Color(0xff000000), BlendMode.srcIn),
          ),
          label: 'Account',
          backgroundColor: Colors.white,
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      elevation: 1,
    );
  }
}
