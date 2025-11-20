import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';  // Importa pantallas nuevas
import 'screens/login_screen.dart';
import 'screens/games_screen.dart';
import 'screens/consoles_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/news_screen.dart';
import 'screens/settings_screen.dart';
import 'providers/auth_provider.dart';
import 'providers/product_provider.dart';
import 'providers/cart_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Good Games',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.black,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        hoverColor: Colors.black12,
        focusColor: Colors.black12,
        highlightColor: Colors.black12,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white)),
        outlinedButtonTheme: OutlinedButtonThemeData(style: OutlinedButton.styleFrom(foregroundColor: Colors.black)),
        textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(Colors.black),
          trackColor: MaterialStateProperty.all(Colors.black.withOpacity(0.3)),
        ),
        checkboxTheme: CheckboxThemeData(fillColor: MaterialStateProperty.all(Colors.black)),
        useMaterial3: true,
      ),
      home: Consumer<AuthProvider>(builder: (context, auth, _) => auth.isLoggedIn ? const HomeScreen() : const LoginScreen()),
      // Agrega rutas para navegación
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/games': (context) => const GamesScreen(),
        '/consoles': (context) => const ConsolesScreen(),
        '/cart': (context) => const CartScreen(),
        '/news': (context) => const NewsScreen(),
        '/settings': (context) => const SettingsScreen(),
        // '/details': (context) => const GameDetailScreen(),
      },
    );
  }
}