import 'package:flutter/material.dart';
import '../home_screen/home_screen.dart';
import 'custom_desktop_app_bar.dart';
import 'custom_tab_bar.dart';
import '../../widgets/responsive_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screen = const [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _screen.length,
      child: Scaffold(
        appBar: ResponsiveWidget.isDesktop(context)
            ? PreferredSize(
                child: CustomDesktopAppBar(
                  icons: _icons,
                  onTap: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  selectedTap: _selectedIndex,
                ),
                preferredSize: Size(size.width, 100),
              )
            : null,
        body: IndexedStack(
          children: _screen,
          index: _selectedIndex,
        ),
        bottomNavigationBar: !ResponsiveWidget.isDesktop(context)
            ? Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomTabBar(
                  isBottomIndicuator: ResponsiveWidget.isDesktop(context),
                  icons: _icons,
                  selectedTap: _selectedIndex,
                  onTap: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
