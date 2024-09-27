import 'package:app_setup/core/bottom_tabs/bottom_tabs.dart';
import 'package:app_setup/core/models/user_model.dart';
import 'package:app_setup/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:app_setup/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorDashboardKey =
    GlobalKey<NavigatorState>(debugLabel: "DashboardShell");
final _shellNavigatorSettingsKey =
    GlobalKey<NavigatorState>(debugLabel: "SettingsShell");

class GoRouterRefreshNotifier extends ChangeNotifier {
  GoRouterRefreshNotifier(Ref ref) {
    // Listen to the auth state changes and call notifyListeners on change
    ref.listen<AsyncValue<UserModel?>>(
      authViewModelProvider, // This should match the type expected
      (_, __) => notifyListeners(), // Triggers GoRouter refresh
    );
  }
}

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authViewModelProvider);

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
      ),
    ],
    redirect: (context, state) {
      // Check if authState is null
      if (authState == const AsyncValue.data(null)) {
        return '/login';
      }

      // Check the auth state for loading, error, or user data
      if (authState.isLoading) {
        // Redirect to splash screen when loading
        return '/splash';
      } else if (authState.hasError || authState.value == null) {
        // Redirect to login if there's no user data or an error occurred
        return '/login';
      } else if (authState.value!.token.isNotEmpty) {
        // Redirect to dashboard if authenticated
        return '/dashboard';
      }

      // Return null if no redirect is necessary
      return '/login';
    },
    refreshListenable: GoRouterRefreshNotifier(ref),
  );
  return router;
}
