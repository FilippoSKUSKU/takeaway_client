import 'package:flutter/material.dart';
import 'package:takeaway_client/ui/screens/base_user/user_restaurant_list_page.dart';
import 'package:takeaway_client/ui/screens/onboarding/register_screen.dart';

class TakeawayClient extends StatelessWidget {
  const TakeawayClient({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _lightTheme,
      darkTheme: _darkTheme,
      title: 'Takeaway',
      // home: RegisterScreen(),
      home: UserRestaurantListPage(),
    );
  }
}

final _lightTheme = ThemeData.light().copyWith(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(255, 255, 236, 63),
  ),
);
final _darkTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 255, 242, 63),
  ),
);
