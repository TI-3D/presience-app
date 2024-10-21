import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/presentation/pages/homepage.dart';
import 'package:presience_app/presentation/pages/registrations/camera.dart';
import 'package:presience_app/presentation/pages/registrations/change_password.dart';
import 'package:presience_app/presentation/pages/logins/login.dart';
import 'package:presience_app/presentation/pages/logins/success.dart';
import 'package:presience_app/presentation/pages/registrations/change_succes.dart';
import 'package:presience_app/presentation/pages/registrations/register_face.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return LoginPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'success',
          builder: (BuildContext context, GoRouterState state) {
            return LoginSuccessPage();
          },
        ),
        GoRoute(
          path: 'first_change_password',
          builder: (BuildContext context, GoRouterState state) {
            return FirstChangePasswordPage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'success',
              builder: (BuildContext context, GoRouterState state) {
                return FirstChangePasswordSuccessPage();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'register_face',
          builder: (BuildContext context, GoRouterState state) {
            return RegisterFacePage();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/camera',
      builder: (BuildContext context, GoRouterState state) {
        return CameraPage();
      },
    ),
    GoRoute(
      path: '/homepage',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
    ),
  ],
  redirect: (BuildContext context, GoRouterState state) {
    if (state.uri.toString() == '/') {
      return '/login'; // Redirect to login if trying to access root
    }
    return null; // No redirect otherwise
  },
);

GoRouter getRoute() => _router;
