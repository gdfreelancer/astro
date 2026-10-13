import 'package:flutter/material.dart';
import '../app.dart';
import '../widgets/ui_components.dart';
import 'kundli_screen.dart';
import 'birth_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override Widget build(BuildContext context) => SafeArea(child: ListView(padding: const EdgeInsets.all(20), children: [
    Row(children: [Container(width: 46, height: 46, decoration: BoxDecoration(color: ink, borderRadius: BorderRadius.circular(15)), child: const Icon(Icons.brightness_7, color: saffron, size: 28)), const SizedBox(width: 12), const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('SARAL JYOTISH', style: TextStyle(color: muted, fontSize: 10, letterSpacing: 2, fontWeight: FontWeight.w800)), Text('Understand your stars', style: TextStyle(color: ink, fontSize: 18, fontWeight: FontWeight.w800))])), IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BirthDetailsScreen())), icon: const Icon(Icons.person_outline))]),
    const SizedBox(height: 24),
    Container(padding: const EdgeInsets.all(22), decoration: BoxDecoration(borderRadius: BorderRadius.circular(26), gradient: const LinearGradient(colors: [Color(0xFF203B54), Color(0xFF101F31)], begin: Alignment.topLeft, end: Alignment.bottomRight)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('YOUR PERSONAL GUIDE', style: TextStyle(color: saffron, fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.w800)),
      const SizedBox(height: 17), const Text('The sky has a story.\nLet’s read yours.', style: TextStyle(color: Colors.white, fontSize: 27, height: 1.2, fontWeight: FontWeight.w800)),
      const SizedBox(height: 10), const Text('Explore your birth chart, planetary patterns and the wisdom of Jyotish.', style: TextStyle(color: Color(0xFFCCD4DD), fontSize: 13, height: 1.5)),
      const SizedBox(height: 18), FilledButton.icon(style: FilledButton.styleFrom(backgroundColor: saffron, foregroundColor: ink), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BirthDetailsScreen())), icon: const Icon(Icons.arrow_forward), label: const Text('Create your Kundli')),
    ])),
    const SizedBox(height: 26), const SectionHeading('Your astrology toolkit'), const SizedBox(height: 12),
    Row(children: [FeatureCard(icon: Icons.auto_awesome, title: 'Birth chart', subtitle: 'Your cosmic map', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const KundliScreen()))), const SizedBox(width: 12), const FeatureCard(icon: Icons.wb_sunny_outlined, title: 'Daily Panchang', subtitle: 'Tithi & timings', onTap: _noop)]),
    const SizedBox(height: 24), const SectionHeading('Learn the foundations'), const SizedBox(height: 12),
    const LessonTile(number: '01', title: 'The 12 Rashis', subtitle: 'Signs of the zodiac'),
    const LessonTile(number: '02', title: 'The 9 Grahas', subtitle: 'Planets and their meanings'),
    const LessonTile(number: '03', title: 'The 12 Bhavas', subtitle: 'Houses of the birth chart'),
  ]));
  static void _noop() {}
}