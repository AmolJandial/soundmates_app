import 'package:auto_route/auto_route.dart';
import 'package:soundmates_app/views/dicover/discover_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [AutoRoute(page: DiscoverRoute.page, initial: true, path: '/discover')];

  @override
  List<AutoRouteGuard> get guards => [];
}
