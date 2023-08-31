import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:task_flow_mobile/views/screens/signup.dart';

import '../views/screens/home.dart';
import '../views/screens/login.dart';

final route = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(
          child: SignupScreen(),
        ),
    SigninScreen.routeName: (_) => const MaterialPage(
          child: SigninScreen(),
        ),
    HomeScreen.routeName: (_) => const MaterialPage(
          child: HomeScreen(),
        )
  },
);
