import 'package:flutter/material.dart';
import 'package:flutter_go_router/screens/10_transition_screen_1.dart';
import 'package:flutter_go_router/screens/10_transition_screen_2.dart';
import 'package:flutter_go_router/screens/1_basic_screen.dart';
import 'package:flutter_go_router/screens/2_named_screen.dart';
import 'package:flutter_go_router/screens/3_push_screen.dart';
import 'package:flutter_go_router/screens/4_pop_base_screen.dart';
import 'package:flutter_go_router/screens/5_pop_return_screen.dart';
import 'package:flutter_go_router/screens/6_path_param_screen.dart';
import 'package:flutter_go_router/screens/7_query_parameter_screen.dart';
import 'package:flutter_go_router/screens/8_nested_child_screen.dart';
import 'package:flutter_go_router/screens/8_nested_screen.dart';
import 'package:flutter_go_router/screens/9_login_screen.dart';
import 'package:flutter_go_router/screens/9_private_screen.dart';
import 'package:flutter_go_router/screens/root_screen.dart';
import 'package:go_router/go_router.dart';

// 로그인 여부
bool authState = false;

final router = GoRouter(
  redirect: (context, state) {
    // return string (path) -> 해당 라우트로 이동한다.
    // return null -> 이동하려던 라우트로 이동한다.
    if (state.location == '/login/private' && !authState) {
      return '/login';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const RootScreen();
      },
      routes: [
        GoRoute(
          path: 'basic',
          builder: (context, state) {
            return const BasicScreen();
          },
        ),
        GoRoute(
          path: 'named',
          name: 'named_screen',
          builder: (context, state) {
            return const NamedScreen();
          },
        ),
        GoRoute(
          path: 'push',
          builder: (context, state) {
            return const PushScreen();
          },
        ),
        GoRoute(
          path: 'pop',
          builder: (context, state) {
            return const PopBaseScreen();
          },
          routes: [
            GoRoute(
              path: 'return',
              builder: (context, state) {
                return const PopReturnScreen();
              },
            )
          ],
        ),
        GoRoute(
          path: 'path_param/:id',
          builder: (context, state) {
            return const PathParamScreen();
          },
          routes: [
            GoRoute(
              path: ':name',
              builder: (context, state) {
                return const PathParamScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'query_param',
          builder: (context, state) {
            return const QueryParameterScreen();
          },
        ),
        ShellRoute(
          builder: (context, state, child) {
            return NestedScreen(child: child);
          },
          routes: [
            GoRoute(
              path: 'nested/a',
              builder: (context, state) => const NestedChildScreen(
                routeName: '/nested/a',
              ),
            ),
            GoRoute(
              path: 'nested/b',
              builder: (context, state) => const NestedChildScreen(
                routeName: '/nested/b',
              ),
            ),
            GoRoute(
              path: 'nested/c',
              builder: (context, state) => const NestedChildScreen(
                routeName: '/nested/c',
              ),
            )
          ],
        ),
        GoRoute(
          path: 'login',
          builder: (context, state) {
            return const LoginScreen();
          },
          routes: [
            GoRoute(
              path: 'private',
              builder: (context, state) {
                return const PrivateScreen();
              },
            )
          ],
        ),
        GoRoute(
          path: 'login2',
          builder: (context, state) {
            return const LoginScreen();
          },
          routes: [
            GoRoute(
              path: 'private',
              builder: (context, state) {
                return const PrivateScreen();
              },
              redirect: (context, state) {
                if (!authState) {
                  return '/login2';
                }
                return null;
              },
            )
          ],
        ),
        GoRoute(
          path: 'transition',
          builder: (context, state) => const TransitionScreenOne(),
          routes: [
            GoRoute(
              path: 'detail',
              pageBuilder: (context, state) => CustomTransitionPage(
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: const TransitionScreenTwo(),
              ),
            )
          ],
        )
      ],
    ),
  ],
);
