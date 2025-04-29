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
          routes: [
            GoRouteData.$route(
              path: 'leave_application_dashboard',
              factory: $LeaveApplicationDashboardRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'leave_application',
                  factory: $LeaveApplicationRouteExtension._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'teacher_note',
              factory: $TeacherNoteRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'curriculum',
              factory: $CurriculumPageRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'homework',
              factory: $HomeWorkRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'remark',
              factory: $RemarkRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'time_table',
              factory: $TimeTableRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'daily_attendance',
              factory: $DailyAttendanceRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/calender',
          name: 'Calendar',
          factory: $CalendarRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/change_password',
          name: 'Change Password',
          factory: $ChangePasswordRouteExtension._fromState,
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

extension $LeaveApplicationDashboardRouteExtension
    on LeaveApplicationDashboardRoute {
  static LeaveApplicationDashboardRoute _fromState(GoRouterState state) =>
      const LeaveApplicationDashboardRoute();

  String get location => GoRouteData.$location(
        '/dashbaord/leave_application_dashboard',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LeaveApplicationRouteExtension on LeaveApplicationRoute {
  static LeaveApplicationRoute _fromState(GoRouterState state) =>
      const LeaveApplicationRoute();

  String get location => GoRouteData.$location(
        '/dashbaord/leave_application_dashboard/leave_application',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TeacherNoteRouteExtension on TeacherNoteRoute {
  static TeacherNoteRoute _fromState(GoRouterState state) =>
      const TeacherNoteRoute();

  String get location => GoRouteData.$location(
        '/dashbaord/teacher_note',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CurriculumPageRouteExtension on CurriRoute {
  static CurriRoute _fromState(GoRouterState state) =>
      const CurriRoute();

  String get location => GoRouteData.$location(
        '/dashbaord/curriculum',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HomeWorkRouteExtension on HomeWorkRoute {
  static HomeWorkRoute _fromState(GoRouterState state) => const HomeWorkRoute();

  String get location => GoRouteData.$location(
        '/dashbaord/homework',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RemarkRouteExtension on RemarkRoute {
  static RemarkRoute _fromState(GoRouterState state) => const RemarkRoute();

  String get location => GoRouteData.$location(
        '/dashbaord/remark',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TimeTableRouteExtension on TimeTableRoute {
  static TimeTableRoute _fromState(GoRouterState state) =>
      const TimeTableRoute();

  String get location => GoRouteData.$location(
        '/dashbaord/time_table',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DailyAttendanceRouteExtension on DailyAttendanceRoute {
  static DailyAttendanceRoute _fromState(GoRouterState state) =>
      const DailyAttendanceRoute();

  String get location => GoRouteData.$location(
        '/dashbaord/daily_attendance',
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

extension $ChangePasswordRouteExtension on ChangePasswordRoute {
  static ChangePasswordRoute _fromState(GoRouterState state) =>
      const ChangePasswordRoute();

  String get location => GoRouteData.$location(
        '/change_password',
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
