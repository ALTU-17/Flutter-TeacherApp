
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:teacherapp/router/router.dart';
import 'package:teacherapp/router/routers.dart';

import '../../auth/providers/providers.dart';
import '../../auth/widgets/drawer_dialog.dart';

class ScaffoldWithNavigation extends HookConsumerWidget {
  final Widget child;

  const ScaffoldWithNavigation({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final scaffoldKey = useMemoized(() => GlobalKey<ScaffoldState>());
    final authP = ref.read(authProvider.notifier);
    final router = ref.read(routerProvider);
    final navItems = <BottomNavigationBarItem>[
      CustomBottomNavigationBarItem.create(
        icon: Icon(Icons.dashboard),
        context: context,
        name: "Dashbaord",
      ),
      CustomBottomNavigationBarItem.create(
        icon: Icon(Icons.calendar_month),
        context: context,
        name: "Calender",
      ),
      CustomBottomNavigationBarItem.create(
    icon: Icon(Icons.people),
        context: context,
        name: "Profile",
      ),

    ];
   
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text.rich(
       
                       TextSpan(
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        children: [
                          const TextSpan(text: "SACS Smart Teacher App ",),
                          TextSpan(
                            text: '(2025-2026)',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
        
        // leading: IconButton.filled(onPressed: () {
          
        // }, icon: Icon(Icons.bug_report,)),
     elevation: 0.0,
       
      backgroundColor: Colors.transparent,
        //automaticallyImplyLeading: false,
        //elevation: 2,
        // centerTitle: true,
      ),
      body: child,
     drawer: 
     DrawerPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: navItems,
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
        enableFeedback: true,
        type: BottomNavigationBarType.fixed,

        //  showSelectedLabels: false,
        // showUnselectedLabels: false,
        // useLegacyColorScheme: true,
        selectedItemColor: Theme.of(context).primaryColor,
        //  unselectedItemColor: greay55,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith(DashboardRoute().location)) {
      return 0;
    }
    if (location.startsWith(CalendarRoute().location)) {
      return 1;
    }
    if (location.startsWith(TeacherProfileRoute().location)) {
      return 2;
    }
   
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(DashboardRoute().location);
        break;
      case 1:
        GoRouter.of(context).go(CalendarRoute().location);
        break;
      case 2:
        GoRouter.of(context).go(TeacherProfileRoute().location);
   
    }
  }
}

class CustomBottomNavigationBarItem {
  static BottomNavigationBarItem create({
    required Icon icon,
    required BuildContext context,
    required String name,
  }) {
    return BottomNavigationBarItem(
      label: name,
      icon: icon,
     
    );
  }
}

class CustomNavigationRailDestination {
  static NavigationRailDestination create({
    required String assetPath,
    required BuildContext context,
  }) {
    return NavigationRailDestination(
      label: const Text(''),
      icon: Center(
        child: Image.asset(
          assetPath,
          width: !assetPath.contains('live') ? (25.r) : (30.r),
          height: !assetPath.contains('live') ? (25.r) : (30.r),
        ),
      ),
    );
  }
}
