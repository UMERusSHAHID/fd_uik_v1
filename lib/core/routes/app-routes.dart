import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/screens/welcome_page.dart';
import '../../features/home/presentation/pages/home_page.dart';

final appRoutes = GoRouter(
  initialLocation: '/welcome',
  routes: [
    GoRoute(path: '/welcome', builder: (context, state) => const WelcomePage()),
    GoRoute(path: '/home', builder: (context, state) => const HomePage()),
  ],
);
