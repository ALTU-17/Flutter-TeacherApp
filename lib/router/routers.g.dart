// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routers.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashRoute,
      $homeShellRoute,
      $authShellRoute,
    ];

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeShellRoute => ShellRouteData.$route(
      navigatorKey: HomeShellRoute.$navigatorKey,
      factory: $HomeShellRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/dashbaord',
          name: 'Dashboard',
          factory: $DashboardRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/calender',
          name: 'Calendar',
          factory: $CalendarRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/teacher_profile',
          name: 'Profile',
          factory: $TeacherProfileRouteExtension._fromState,
        ),
      ],
    );

extension $HomeShellRouteExtension on HomeShellRoute {
  static HomeShellRoute _fromState(GoRouterState state) =>
      const HomeShellRoute();
}

extension $DashboardRouteExtension on DashboardRoute {
  static DashboardRoute _fromState(GoRouterState state) =>
      const DashboardRoute();

  String get location => GoRouteData.$location(
        '/dashbaord',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CalendarRouteExtension on CalendarRoute {
  static CalendarRoute _fromState(GoRouterState state) => const CalendarRoute();

  String get location => GoRouteData.$location(
        '/calender',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TeacherProfileRouteExtension on TeacherProfileRoute {
  static TeacherProfileRoute _fromState(GoRouterState state) =>
      const TeacherProfileRoute();

  String get location => GoRouteData.$location(
        '/teacher_profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $authShellRoute => ShellRouteData.$route(
      navigatorKey: AuthShellRoute.$navigatorKey,
      factory: $AuthShellRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/teacher_verification',
          name: 'Teacher Verification',
          factory: $TeacherVerificationRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/login',
          name: 'Login',
          factory: $LoginRouteExtension._fromState,
        ),
      ],
    );

extension $AuthShellRouteExtension on AuthShellRoute {
  static AuthShellRoute _fromState(GoRouterState state) =>
      const AuthShellRoute();
}

extension $TeacherVerificationRouteExtension on TeacherVerificationRoute {
  static TeacherVerificationRoute _fromState(GoRouterState state) =>
      const TeacherVerificationRoute();

  String get location => GoRouteData.$location(
        '/teacher_verification',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
