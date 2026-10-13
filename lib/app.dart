import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/kundli_screen.dart';
import 'screens/panchang_screen.dart';
import 'screens/learn_screen.dart';


class SaralJyotishApp extends StatelessWidget {
  const SaralJyotishApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Saral Jyotish', debugShowCheckedModeBanner: false,
    theme: AppTheme.light,
    home: const MainShell(),
  );
}
class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override State<MainShell> createState() => _MainShellState();
}
class _MainShellState extends State<MainShell> {
  int index = 0;
  final pages = const [HomeScreen(), KundliScreen(), PanchangScreen(), LearnScreen()];
  @override
  Widget build(BuildContext context) => Scaffold(
    body: IndexedStack(index: index, children: pages),
    bottomNavigationBar: NavigationBar(selectedIndex: index, onDestinationSelected: (v) => setState(() => index = v), destinations: const [
      NavigationDestination(icon: Icon(Icons.grid_view_rounded), label: 'Home'),
      NavigationDestination(icon: Icon(Icons.auto_awesome), label: 'Kundli'),
      NavigationDestination(icon: Icon(Icons.wb_sunny_outlined), label: 'Panchang'),
      NavigationDestination(icon: Icon(Icons.menu_book_outlined), label: 'Learn'),
    ]),
  );
}