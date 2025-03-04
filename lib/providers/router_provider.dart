import 'package:beamer/beamer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates_app/dashboard.dart';
import 'package:soundmates_app/features/auth/views/auth_screen.dart';
import 'package:soundmates_app/features/auth/views/onboarding_screen.dart';
import 'package:soundmates_app/providers/startup_providers.dart';

final routerProvider = Provider<BeamerDelegate>((ref) {
  return BeamerDelegate(
    initialPath: '/dashboard',
    locationBuilder:
        RoutesLocationBuilder(
          routes: {
            '/dashboard': (context, state, data) => const DashboardScreen(),
            '/onboarding': (context, state, data) => const OnboardingScreen(),
            '/onboarding/auth': (context, state, data) => const AuthScreen(),
          },
        ).call,
    guards: [
      BeamGuard(
        pathPatterns: ['/dashboard'],
        check: (_, _) {
          final userState = ref.watch(userControllerProvider);
          return userState.requireValue.status.isAuthorized;
        },
        beamToNamed: (origin, target) => '/onboarding',
      ),
    ],
  );
});
