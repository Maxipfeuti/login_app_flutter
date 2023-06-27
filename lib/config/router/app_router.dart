import 'package:go_router/go_router.dart';
import 'package:ultimo_login_app/pages/user_page.dart';
import '../../pages/login_page.dart';
import '../../pages/registro_page.dart';




final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),

    GoRoute(
      path: '/pages/registro_page.dart',
      builder: (context, state) => const RegistroPage(),
    ),

     GoRoute(
      path: '/pages/user_page.dart',
      builder: (context, state) => const UserPage(),
    ),

  ]
);