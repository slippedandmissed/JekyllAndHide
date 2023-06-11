import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:frontend/router/router.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
        routes: const [
          MapRoute(),
          TeamsRoute(),
        ],
        builder: (context, child, _) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: const Text("Jekyll & Hide",
                  style: TextStyle(color: Colors.white)),
            ),
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.location_on),
                  label: "Map",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.group),
                  label: "Teams",
                )
              ],
            ),
          );
        });
  }
}
