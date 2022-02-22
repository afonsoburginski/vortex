import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vortex/pages/coming_soon_page.dart';
import 'package:vortex/pages/download_page.dart';
import 'package:vortex/pages/chromecast_page.dart';
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
      preferredSize: Size.fromHeight(50),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(LineIcons.bars),
              color: white,
              onPressed: () {},
            ),
            SvgPicture.asset(
              "assets/images/logo.svg",
              width: 90,
            ),
            Container(
              height: 30,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: white),
                image: DecorationImage(
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
        ChromecastPage(),
        DownloadPage(),
      ],
    );
  }

  Widget getFloatingActionButton() {
    return NavigationBar(
      selectedIndex: selectedIndex,
      backgroundColor: Colors.transparent,
      showActiveButtonText: false,
      textStyle: TextStyle(color: white, fontWeight: FontWeight.bold),
      navigationBarButtons: [
        NavigationBarButton(
          icon: Icons.home_rounded,
          text: "Home",
          backgroundColor: Colors.transparent,
        ),
        NavigationBarButton(
          icon: LineIcons.search,
          text: "Pesquisar",
          backgroundColor: Colors.transparent,
        ),
        NavigationBarButton(
          icon: Icons.smart_display_rounded,
          text: "Em Breve",
          backgroundColor: Colors.transparent,
        ),
        NavigationBarButton(
          icon: LineIcons.chromecast,
          text: "Chromecast",
          backgroundColor: Colors.transparent,
        ),
        NavigationBarButton(
          icon: LineIcons.download,
          text: "Downloads",
          backgroundColor: Colors.transparent,
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
