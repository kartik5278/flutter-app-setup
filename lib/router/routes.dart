import 'package:app_setup/features/auth/view/screens/login_screen.dart';
import 'package:app_setup/features/auth/view/screens/splash_screen.dart';
import 'package:app_setup/features/dashboard/view/screens/dashboard_screen.dart';
import 'package:app_setup/features/dashboard/view/screens/discover_screen.dart';
import 'package:app_setup/features/settings/view/screens/settings_screen.dart';
import 'package:go_router/go_router.dart';

final List<GoRoute> authRoutes = [
  GoRoute(
    path: '/login',
    pageBuilder: (context, state) {
      return const NoTransitionPage(
        child: LoginScreen(),
      );
    },
  ),
  GoRoute(
    path: '/splash',
    pageBuilder: (context, state) {
      return const NoTransitionPage(
        child: SplashScreen(),
      );
    },
  )
];

final List<GoRoute> dashboardRoutes = [
  GoRoute(
      path: '/dashboard',
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: DashboardScreen(),
        );
      },
      routes: [
        GoRoute(
          path: 'discover',
          builder: (context, state) => const DiscoverScreen(),
        ),
      ])
];

final List<GoRoute> settingsRoutes = [
  GoRoute(
    path: '/settings',
    pageBuilder: (context, state) {
      return const NoTransitionPage(
        child: SettingsScreen(),
      );
    },
  )
];
