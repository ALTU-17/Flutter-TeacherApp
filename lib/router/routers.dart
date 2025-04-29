
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:teacherapp/features/home/views/calendar_view.dart';
import 'package:teacherapp/features/home/views/dashboard_view.dart';
import 'package:teacherapp/features/home/views/scaffold_with_navigation.dart';
import 'package:teacherapp/features/home/views/teacher_profile_view.dart';
import 'package:teacherapp/splash_screen.dart';

import '../features/auth/views/views.dart';


part 'routers.g.dart';

final GlobalKey<NavigatorState> shellNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> authShellNavKey = GlobalKey<NavigatorState>();

@TypedGoRoute<SplashRoute>(path: '/')
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashView();
  }
}

// ///////////////////// HOME ////////////////////////////////
@TypedShellRoute<HomeShellRoute>(routes: [
  TypedGoRoute<DashboardRoute>(path: DashboardRoute.path, name: "Dashboard" 
   
  ),
  TypedGoRoute<CalendarRoute>(path: CalendarRoute.path, name: "Calendar"),
  TypedGoRoute<TeacherProfileRoute>(path: TeacherProfileRoute.path, name: "Profile"),

])
class HomeShellRoute extends ShellRouteData {
  const HomeShellRoute();
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavKey;
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return ScaffoldWithNavigation(child: navigator);
  }
}

class DashboardRoute extends GoRouteData {
  const DashboardRoute();
  static const path = '/dashbaord';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DashboardView();
  }
}

class CalendarRoute extends GoRouteData {
  const CalendarRoute();
  static const path = '/calender';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CalendarView();

}


class TeacherProfileRoute extends GoRouteData {
  const TeacherProfileRoute();
  static const path = '/teacher_profile';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TeacherProfileView();

}

////////////////////////////////////// AUTH ////////////////////////////////////

@TypedShellRoute<AuthShellRoute>(routes: [
  TypedGoRoute<TeacherVerificationRoute>(path: TeacherVerificationRoute.path, name: "Teacher Verification"),
  TypedGoRoute<LoginRoute>(path: LoginRoute.path, name: "Login"),

])
class AuthShellRoute extends ShellRouteData {
  const AuthShellRoute();
  static final GlobalKey<NavigatorState> $navigatorKey = authShellNavKey;
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return ScaffoldWithNavigationAuth(child: navigator);
  }
}

class TeacherVerificationRoute extends GoRouteData {
  const TeacherVerificationRoute();
  static const path = '/teacher_verification';

  @override
  Widget build(BuildContext context, GoRouterState state) => const TeacherVerificationView();
}



class LoginRoute extends GoRouteData {
  const LoginRoute();
  static const path = '/login';

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginView();
}
