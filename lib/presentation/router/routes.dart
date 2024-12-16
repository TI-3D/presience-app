import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/data/datasources/local_datasources/auth_local_datasources.dart';
import 'package:presience_app/domain/entities/permit_detail.dart';
import 'package:presience_app/domain/entities/schedule_week.dart';
import 'package:presience_app/presentation/pages/ajukan_izin/pengajuan_after.dart';
import 'package:presience_app/presentation/pages/ajukan_izin/pengajuan_before.dart';
import 'package:presience_app/presentation/pages/ajukan_izin/pengajuan_during.dart';
import 'package:presience_app/presentation/pages/cameras/camera_presensi.dart';
import 'package:presience_app/presentation/pages/cameras/camera_re_registration.dart';
import 'package:presience_app/presentation/pages/cameras/camera_registration.dart';
import 'package:presience_app/presentation/pages/home/homepage.dart';
import 'package:presience_app/presentation/pages/logins/forget_password.dart';
import 'package:presience_app/presentation/pages/logins/login.dart';
import 'package:presience_app/presentation/pages/logins/success.dart';
import 'package:presience_app/presentation/pages/presensi/detail.dart';
import 'package:presience_app/presentation/pages/presensi/pengajuan/detail.dart';
import 'package:presience_app/presentation/pages/re_registration/confirm_password.dart';
import 'package:presience_app/presentation/pages/registrations/change_password.dart';
import 'package:presience_app/presentation/pages/registrations/change_succes.dart';
import 'package:presience_app/presentation/pages/registrations/register_face.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const LoginPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
      routes: <RouteBase>[
        GoRoute(
          path: 'forget_password',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const ForgetPasswordPage(),
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
          path: 'success',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const LoginSuccessPage(),
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
            child: const FirstChangePasswordPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
          ),
          routes: <RouteBase>[
            GoRoute(
              path: 'success',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: const FirstChangePasswordSuccessPage(),
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
            child: const RegisterFacePage(),
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
        child: const CameraRegistrationPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
      routes: [
        GoRoute(
          path: 'presensi',
          pageBuilder: (context, state) {
            final Map<String, dynamic> extraData =
                state.extra as Map<String, dynamic>? ?? {};
            return CustomTransitionPage(
              key: state.pageKey,
              child: CameraPresensiPage(
                openedAt: extraData['openedAt'] as String? ?? '00:00:00',
                scheduleWeekId: extraData['scheduleWeekId'] as int? ?? 0,
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
        final Map<String, dynamic> extraData =
            state.extra as Map<String, dynamic>? ?? {};
        return CustomTransitionPage(
          key: state.pageKey,
          child: FormPengajuanBeforeClassPage(
            startDate: extraData['startDate'] as String,
            endDate: extraData['endDate'] as String,
          ),
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
              child: FormPengajuanAfterClassPage(
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
            child:
                DetailPengajuanPage(permitDetail: state.extra as PermitDetail),
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
        path: '/re_register_face',
        redirect: (BuildContext context, GoRouterState state) {
          return;
        },
        routes: [
          GoRoute(
            path: 'confirm_password',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const ReRegisterFacePage(),
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
            ),
          ),
          GoRoute(
            path: 'camera',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const CameraReRegistrationPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
            ),
          )
        ]),
  ],
  redirect: (BuildContext context, GoRouterState state) async {
    // Fetch login status using the AuthLocalDataSource
    final authData = await AuthLocalDataSource().getAuthData();
    final isLoggedIn = authData != null;

    // Check if trying to access the root path
    if (state.uri.toString() == '/') {
      if (!isLoggedIn) {
        return '/login'; // Redirect to login if not logged in
      }

      if (!authData.user!.isVerified!) {
        return '/login/success';
      }

      // User is logged in; check token expiration
      if (authData.expiration != null &&
          authData.expiration!.isAfter(DateTime.now())) {
        return '/homepage'; // Redirect to homepage if token is valid
      } else {
        return '/login'; // Redirect to login if token is expired
      }
    }

    if (authData != null && !authData.expiration!.isAfter(DateTime.now())) {
      return '/login'; // Redirect to login if token is expired
    }

    // No redirect for other routes
    return null;
  },
);

GoRouter getRoute() => _router;
