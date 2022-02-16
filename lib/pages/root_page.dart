import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/src/material/navigation_bar.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';
import 'package:vortex/pages/coming_soon_page.dart';
import 'package:vortex/pages/download_page.dart';
import 'package:vortex/pages/home_page.dart';
import 'package:vortex/pages/search_page.dart';
import 'package:vortex/theme/color.dart';
import 'package:vortex/util/constant.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: getAppBar(),
      body: getBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: getFloatingActionButton(),
    );
  }

  Widget getAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: const Icon(LineIcons.bars),
                color: white,
                onPressed: () {}),
            SvgPicture.asset(
              "assets/images/logo.svg",
              width: 80,
            ),
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: white),
                image: const DecorationImage(
                    image: NetworkImage(profile), fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: selectedIndex,
      children: [
        HomePage(),
        SearchPage(),
        ComingSoonPage(),
        DownloadPage(),
      ],
    );
  }

  Widget getFloatingActionButton() {
    var navigationBar = NavigationBar;
    return navigationBar(
      selectedIndex: selectedIndex,
      showActiveButtonText: false,
      textStyle: const TextStyle(color: white, fontWeight: FontWeight.bold),
      navigationBarButtons: [
        const NavigationBarButton(
          icon: LineIcons.home,
          backgroundColor: black,
        ),
        const NavigationBarButton(
          icon: LineIcons.search,
          backgroundColor: black,
        ),
        const NavigationBarButton(
          icon: LineIcons.youtube,
          backgroundColor: black,
        ),
        const NavigationBarButton(
          icon: LineIcons.download,
          backgroundColor: black,
        ),
      ],
      onTabChange: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }
}
