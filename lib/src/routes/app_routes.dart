part of 'app_routes_barrel.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// Had only one Page
        AutoRoute(
          page: CalendarRoute.page,
          initial: true,
        )
      ];
}
