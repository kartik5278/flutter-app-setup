import 'package:app_setup/core/bottom_tabs/bottom_tabs.dart';
import 'package:app_setup/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorDashboardKey =
    GlobalKey<NavigatorState>(debugLabel: "DashboardShell");
final _shellNavigatorSettingsKey =
    GlobalKey<NavigatorState>(debugLabel: "SettingsShell");

@riverpod
GoRouter router(RouterRef ref) {
  final router = GoRouter(
    initialLocation: '/dashboard',
    navigatorKey: _rootNavigatorKey,
    routes: [
      ...authRoutes,
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BottomTabs(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorDashboardKey,
            routes: dashboardRoutes,
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettingsKey,
            routes: settingsRoutes,
          ),
        ],
      )
    ],
  );
  return router;
}
