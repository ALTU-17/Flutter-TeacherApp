import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:teacherapp/features/home/views/calendar_view.dart';
import 'package:teacherapp/features/home/views/dashboard_view.dart';
import 'package:teacherapp/features/home/views/scaffold_with_navigation.dart';
import 'package:teacherapp/features/home/views/teacher_profile_view.dart';
import 'package:teacherapp/splash_screen.dart';
import 'package:teacherapp/features/daily_attaindance/views/daily_attend_dash_board_view.dart';
import 'package:teacherapp/views/home/homework/homeworkDashBoard.dart';
import 'package:teacherapp/views/home/remark/remarkDashBoard.dart';
import 'package:teacherapp/views/home/techerNote/techerNoteDashBoard.dart';
import 'package:teacherapp/views/home/timeTable/timeTableTecaher.dart';

import '../features/Curriculum/CurriculumDashboard.dart';
import '../features/auth/views/views.dart';
import '../features/leave_application/models/models.dart';
import '../features/leave_application/views/views.dart';

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
  TypedGoRoute<DashboardRoute>(
      path: DashboardRoute.path,
      name: "Dashboard",
      routes: [
        TypedGoRoute<LeaveApplicationDashboardRoute>(
            path: LeaveApplicationDashboardRoute.path,
            routes: [
              TypedGoRoute<LeaveApplicationRoute>(
                  path: LeaveApplicationRoute.path)
            ]),
        TypedGoRoute<TeacherNoteRoute>(path: TeacherNoteRoute.path),
        TypedGoRoute<HomeWorkRoute>(path: HomeWorkRoute.path),
        TypedGoRoute<RemarkRoute>(path: RemarkRoute.path),
        TypedGoRoute<TimeTableRoute>(path: TimeTableRoute.path),
        TypedGoRoute<DailyAttendanceRoute>(path: DailyAttendanceRoute.path)
      ]),
  TypedGoRoute<CalendarRoute>(path: CalendarRoute.path, name: "Calendar"),
  TypedGoRoute<ChangePasswordRoute>(
      path: ChangePasswordRoute.path, name: "Change Password"),
  TypedGoRoute<TeacherProfileRoute>(
      path: TeacherProfileRoute.path, name: "Profile"),
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

class LeaveApplicationDashboardRoute extends GoRouteData {
  const LeaveApplicationDashboardRoute();
  static const path = 'leave_application_dashboard';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LeaveApplicationDashBoardView();
  }
}

class LeaveApplicationRoute extends GoRouteData {
  const LeaveApplicationRoute();
  static const path = 'leave_application';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    final l = state.extra as Leave?;
    return LeaveApplicationView(leave: l);
  }
}

class TeacherNoteRoute extends GoRouteData {
  const TeacherNoteRoute();
  static const path = 'teacher_note';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TeacherNoteDashBoardView();
  }
}
class CurriRoute extends GoRouteData {
  const CurriRoute();
  static const path = 'curriculum';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CurriculumPage();
  }
}

class HomeWorkRoute extends GoRouteData {
  const HomeWorkRoute();
  static const path = 'homework';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeWorkDashBoardView();
  }
}

class RemarkRoute extends GoRouteData {
  const RemarkRoute();
  static const path = 'remark';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RemarkDashBoardView();
  }
}

class TimeTableRoute extends GoRouteData {
  const TimeTableRoute();
  static const path = 'time_table';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TimeTableView();
  }
}

class DailyAttendanceRoute extends GoRouteData {
  const DailyAttendanceRoute();
  static const path = 'daily_attendance';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DailyAttendDashboardView();
  }
}

class CalendarRoute extends GoRouteData {
  const CalendarRoute();
  static const path = '/calender';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CalendarView();
}

class ChangePasswordRoute extends GoRouteData {
  const ChangePasswordRoute();
  static const path = '/change_password';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ChangePasswordView();
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
  TypedGoRoute<TeacherVerificationRoute>(
      path: TeacherVerificationRoute.path, name: "Teacher Verification"),
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
  Widget build(BuildContext context, GoRouterState state) =>
      const TeacherVerificationView();
}

class LoginRoute extends GoRouteData {
  const LoginRoute();
  static const path = '/login';

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginView();
}
