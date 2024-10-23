import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/presentation/pages/ajukan_izin/form_pengajuan.dart';
import 'package:presience_app/presentation/pages/homepage.dart';
import 'package:presience_app/presentation/pages/home/homepage.dart';
import 'package:presience_app/presentation/pages/presensi/detail.dart';
import 'package:presience_app/presentation/pages/presensi/pengajuan/detail.dart';
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
            return const LoginSuccessPage();
          },
        ),
        GoRoute(
          path: 'first_change_password',
          builder: (BuildContext context, GoRouterState state) {
            return const FirstChangePasswordPage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'success',
              builder: (BuildContext context, GoRouterState state) {
                return const FirstChangePasswordSuccessPage();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'register_face',
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterFacePage();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/camera',
      builder: (BuildContext context, GoRouterState state) {
        return const CameraPage();
      },
    ),
    GoRoute(
      path: '/homepage',
      builder: (BuildContext context, GoRouterState state) {
        return NavigationHomePage();
      },
    ),
    GoRoute(
      path: '/pengajuan_izin',
      builder: (BuildContext context, GoRouterState state) {
        return FormPengajuanPage();
      },
    ),
        path: '/presensi',
        redirect: (BuildContext context, GoRouterState state) {
          return '/presensi/detail';
        },
        routes: [
          GoRoute(
            path: '/detail',
            builder: (BuildContext context, GoRouterState state) {
              return DetailPresensiPage();
            },
          ),
        ]),
    GoRoute(
        path: '/pengajuan',
        redirect: (BuildContext context, GoRouterState state) {
          return '/presensi/detail';
        },
        routes: [
          GoRoute(
            path: '/detail',
            builder: (BuildContext context, GoRouterState state) {
              return DetailPengajuanPage();
            },
          ),
        ]),
  ],
  redirect: (BuildContext context, GoRouterState state) {
    if (state.uri.toString() == '/') {
      // return '/login'; // Redirect to login if trying to access root
      return '/pengajuan_izin'; // Redirect to login if trying to access root
    }
    return null; // No redirect otherwise
  },
);

GoRouter getRoute() => _router;
