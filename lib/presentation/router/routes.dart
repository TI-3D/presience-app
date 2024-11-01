import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/domain/entities/schedule_week.dart';
import 'package:presience_app/presentation/pages/ajukan_izin/pengajuan_after.dart';
import 'package:presience_app/presentation/pages/ajukan_izin/pengajuan_before.dart';
import 'package:presience_app/presentation/pages/ajukan_izin/pengajuan_during.dart';
import 'package:presience_app/presentation/pages/cameras/camera_presensi.dart';
import 'package:presience_app/presentation/pages/cameras/camera_registration.dart';
import 'package:presience_app/presentation/pages/home/homepage.dart';
import 'package:presience_app/presentation/pages/logins/login.dart';
import 'package:presience_app/presentation/pages/logins/success.dart';
import 'package:presience_app/presentation/pages/presensi/detail.dart';
import 'package:presience_app/presentation/pages/presensi/pengajuan/detail.dart';
import 'package:presience_app/presentation/pages/registrations/change_password.dart';
import 'package:presience_app/presentation/pages/registrations/change_succes.dart';
import 'package:presience_app/presentation/pages/registrations/register_face.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: LoginPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
      routes: <RouteBase>[
        GoRoute(
          path: 'success',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: LoginSuccessPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0); // Right-to-left slide
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: 'first_change_password',
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: FirstChangePasswordPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
          ),
          routes: <RouteBase>[
            GoRoute(
              path: 'success',
              pageBuilder: (context, state) {
                final Map<String, dynamic> extraData =
                    state.extra as Map<String, dynamic>? ?? {};

                return CustomTransitionPage(
                  key: state.pageKey,
                  child: FirstChangePasswordSuccessPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0); // Right-to-left slide
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: 'register_face',
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: RegisterFacePage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/camera',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: CameraRegistrationPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
      routes: [
        GoRoute(
          path: 'presensi',
          builder: (BuildContext context, GoRouterState state) {
            // Pastikan extra tidak null, dan lakukan cast dengan aman
            final Map<String, dynamic> extraData =
                state.extra as Map<String, dynamic>? ?? {};

            return CameraPresensiPage(
              openedAt: extraData['openedAt'] as String? ?? '00:00:00',
              scheduleWeekId: extraData['scheduleWeekId'] as int? ?? 0,
            );
          },
        ),
      ],
    ),
    GoRoute(
        path: '/homepage',
        pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: NavigationHomePage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
            ),
        routes: [
          GoRoute(
              path: 'presensi',
              pageBuilder: (context, state) => CustomTransitionPage(
                    key: state.pageKey,
                    child: NavigationHomePage(
                        selectedPageIndex: 1, selectedTab: 0),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child;
                    },
                  ),
              routes: [
                GoRoute(
                  path: 'perizinan',
                  builder: (BuildContext context, GoRouterState state) {
                    return NavigationHomePage(
                        selectedPageIndex: 1, selectedTab: 1);
                  },
                ),
              ]),
          GoRoute(
            path: 'profil',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: NavigationHomePage(selectedPageIndex: 2),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
            ),
          ),
        ]),
    GoRoute(
      path: '/pengajuan_izin',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: FormPengajuanBeforeClassPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0); // Right-to-left slide
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
      },
      routes: [
        GoRoute(
          path: 'during',
          pageBuilder: (context, state) {
            final Map<String, dynamic> extraData =
                state.extra as Map<String, dynamic>? ?? {};

            return CustomTransitionPage(
              key: state.pageKey,
              child: FormPengajuanDuringClassPage(
                scheduleWeek: extraData['scheduleWeek'] as ScheduleWeek,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0); // Right-to-left slide
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: 'after',
          pageBuilder: (context, state) {
            final Map<String, dynamic> extraData =
                state.extra as Map<String, dynamic>? ?? {};

            return CustomTransitionPage(
              key: state.pageKey,
              child: FormPengajuanAfterClassPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0); // Right-to-left slide
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: '/presensi',
      redirect: (BuildContext context, GoRouterState state) {
        return '/presensi/detail';
      },
      routes: [
        GoRoute(
          path: 'detail',
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child:
                DetailPresensiPage(scheduleWeek: state.extra as ScheduleWeek),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0); // Right-to-left slide
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/pengajuan',
      redirect: (BuildContext context, GoRouterState state) {
        return '/pengajuan/detail';
      },
      routes: [
        GoRoute(
          path: 'detail',
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const DetailPengajuanPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0); // Right-to-left slide
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        ),
      ],
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
