import 'package:flutter/material.dart';

void main() => runApp(const SaralJyotishApp());

const ink = Color(0xFF18283D);
const navy = Color(0xFF142438);
const saffron = Color(0xFFE9A23B);
const paper = Color(0xFFF6F4EF);
const muted = Color(0xFF7B8794);
const jade = Color(0xFF3C8C78);

class SaralJyotishApp extends StatelessWidget {
  const SaralJyotishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saral Jyotish',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: paper,
        colorScheme: ColorScheme.fromSeed(seedColor: ink, primary: ink, surface: paper),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(backgroundColor: paper, foregroundColor: ink, elevation: 0),
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int selected = 0;
  final pages = const [HomePage(), KundliPage(), PanchangPage(), LearnPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: selected, children: pages),
      bottomNavigationBar: NavigationBar(
        height: 72,
        backgroundColor: Colors.white,
        indicatorColor: saffron.withValues(alpha: .2),
        selectedIndex: selected,
        onDestinationSelected: (i) => setState(() => selected = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.grid_view_rounded), selectedIcon: Icon(Icons.grid_view_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.auto_awesome), selectedIcon: Icon(Icons.auto_awesome), label: 'Kundli'),
          NavigationDestination(icon: Icon(Icons.wb_sunny_outlined), selectedIcon: Icon(Icons.wb_sunny), label: 'Panchang'),
          NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book), label: 'Learn'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 26),
        children: [
          Row(children: [
            Container(width: 46, height: 46, decoration: BoxDecoration(color: ink, borderRadius: BorderRadius.circular(16)), child: const Icon(Icons.brightness_7_rounded, color: saffron, size: 28)),
            const SizedBox(width: 12),
            const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('SARAL JYOTISH', style: TextStyle(fontSize: 11, letterSpacing: 2.1, fontWeight: FontWeight.w800, color: muted)),
              SizedBox(height: 2),
              Text('Understand your stars', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: ink)),
            ])),
            IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage())), icon: const CircleAvatar(backgroundColor: Color(0xFFE5E8E9), child: Icon(Icons.person_outline, color: ink))),
          ]),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: navy,
              borderRadius: BorderRadius.circular(28),
              gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF203B54), Color(0xFF101F31)]),
            ),
            child: Stack(children: [
              Positioned(right: -10, top: -18, child: Icon(Icons.blur_circular, size: 150, color: Colors.white.withValues(alpha: .045))),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6), decoration: BoxDecoration(color: Colors.white.withValues(alpha: .1), borderRadius: BorderRadius.circular(30)), child: const Text('YOUR PERSONAL GUIDE', style: TextStyle(color: saffron, fontSize: 10, letterSpacing: 1.4, fontWeight: FontWeight.w800))),
                const SizedBox(height: 18),
                const Text('The sky has a story.\nLet’s read yours.', style: TextStyle(color: Colors.white, fontSize: 27, height: 1.18, fontWeight: FontWeight.w800)),
                const SizedBox(height: 10),
                Text('Explore your birth chart, planetary patterns and the wisdom of Jyotish.', style: TextStyle(color: Colors.white.withValues(alpha: .7), fontSize: 13, height: 1.5)),
                const SizedBox(height: 20),
                FilledButton.icon(
                  style: FilledButton.styleFrom(backgroundColor: saffron, foregroundColor: navy, padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 13)),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BirthDetailsPage())),
                  icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                  label: const Text('Create your Kundli', style: TextStyle(fontWeight: FontWeight.w800)),
                ),
              ]),
            ]),
          ),
          const SizedBox(height: 26),
          const SectionHeading(title: 'Your astrology toolkit', action: 'EXPLORE'),
          const SizedBox(height: 14),
          Row(children: [
            Expanded(child: ToolCard(icon: Icons.auto_awesome, title: 'Birth chart', subtitle: 'Your cosmic map', color: const Color(0xFFE8B35C), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const KundliPage())))),
            const SizedBox(width: 12),
            Expanded(child: ToolCard(icon: Icons.wb_sunny_outlined, title: 'Daily Panchang', subtitle: 'Tithi & timings', color: const Color(0xFF79B5A2), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PanchangPage())))),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: ToolCard(icon: Icons.public, title: 'Planetary transit', subtitle: 'What is changing', color: const Color(0xFF8EA9D4), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TopicPage(title: 'Planetary Transits', subtitle: 'Understand how planetary movements are interpreted in Jyotish.', icon: Icons.public))))),
            const SizedBox(width: 12),
            Expanded(child: ToolCard(icon: Icons.menu_book_rounded, title: 'Learn Jyotish', subtitle: 'Start with basics', color: const Color(0xFFD69B9B), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LearnPage())))),
          ]),
          const SizedBox(height: 26),
          const SectionHeading(title: 'Learn the foundations', action: 'VIEW ALL'),
          const SizedBox(height: 12),
          const LessonTile(number: '01', title: 'The 12 Rashis', subtitle: 'Signs of the zodiac', duration: '6 min', color: Color(0xFFE5B15D)),
          const LessonTile(number: '02', title: 'The 9 Grahas', subtitle: 'Planets and their meanings', duration: '8 min', color: Color(0xFF7EB4A2)),
          const LessonTile(number: '03', title: 'The 12 Bhavas', subtitle: 'Houses of the birth chart', duration: '10 min', color: Color(0xFF8CA8D2)),
        ],
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  final String title;
  final String action;
  const SectionHeading({super.key, required this.title, required this.action});
  @override
  Widget build(BuildContext context) => Row(children: [
    Expanded(child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: ink))),
    Text(action, style: const TextStyle(fontSize: 10, letterSpacing: 1.2, fontWeight: FontWeight.w800, color: muted)),
    const SizedBox(width: 3), const Icon(Icons.arrow_forward, size: 14, color: muted),
  ]);
}

class ToolCard extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final Color color;
  final VoidCallback onTap;
  const ToolCard({super.key, required this.icon, required this.title, required this.subtitle, required this.color, required this.onTap});
  @override
  Widget build(BuildContext context) => Material(
    color: Colors.white,
    borderRadius: BorderRadius.circular(22),
    child: InkWell(
      borderRadius: BorderRadius.circular(22), onTap: onTap,
      child: Padding(padding: const EdgeInsets.all(15), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(width: 42, height: 42, decoration: BoxDecoration(color: color.withValues(alpha: .22), borderRadius: BorderRadius.circular(14)), child: Icon(icon, color: ink, size: 22)),
        const SizedBox(height: 15),
        Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: ink)),
        const SizedBox(height: 4),
        Text(subtitle, style: const TextStyle(fontSize: 11, color: muted)),
      ])),
    ),
  );
}

class LessonTile extends StatelessWidget {
  final String number, title, subtitle, duration;
  final Color color;
  const LessonTile({super.key, required this.number, required this.title, required this.subtitle, required this.duration, required this.color});
  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(13),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
    child: Row(children: [
      Container(width: 44, height: 44, alignment: Alignment.center, decoration: BoxDecoration(color: color.withValues(alpha: .22), borderRadius: BorderRadius.circular(14)), child: Text(number, style: const TextStyle(fontWeight: FontWeight.w900, color: ink))),
      const SizedBox(width: 12),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w800, color: ink)),
        const SizedBox(height: 3), Text(subtitle, style: const TextStyle(fontSize: 12, color: muted)),
      ])),
      Text(duration, style: const TextStyle(fontSize: 11, color: muted)),
      const SizedBox(width: 6), const Icon(Icons.chevron_right, color: muted, size: 18),
    ]),
  );
}

class KundliPage extends StatefulWidget {
  const KundliPage({super.key});
  @override
  State<KundliPage> createState() => _KundliPageState();
}
class _KundliPageState extends State<KundliPage> {
  String style = 'North Indian';
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: ListView(padding: const EdgeInsets.all(20), children: [
      const PageHeader(eyebrow: 'YOUR COSMIC BLUEPRINT', title: 'Birth chart', subtitle: 'Explore the map of the sky at your birth.'),
      const SizedBox(height: 20),
      Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Chart style', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: ink)),
        const SizedBox(height: 4), const Text('Choose the layout you are familiar with.', style: TextStyle(color: muted, fontSize: 12)),
        const SizedBox(height: 14),
        Wrap(spacing: 8, runSpacing: 8, children: ['North Indian', 'South Indian', 'East Indian'].map((s) => ChoiceChip(label: Text(s), selected: style == s, onSelected: (_) => setState(() => style = s), selectedColor: saffron.withValues(alpha: .3), side: BorderSide(color: style == s ? saffron : const Color(0xFFE5E7E9)))).toList()),
        const SizedBox(height: 18),
        AspectRatio(aspectRatio: 1, child: CustomPaint(painter: ChartPainter(style), child: const Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.brightness_7_rounded, color: saffron, size: 28),
          SizedBox(height: 5), Text('JANMA KUNDLI', style: TextStyle(color: ink, fontSize: 11, letterSpacing: 1.2, fontWeight: FontWeight.w900)),
          SizedBox(height: 3), Text('Preview chart', style: TextStyle(color: muted, fontSize: 10)),
        ])))),
        const SizedBox(height: 14),
        const Row(children: [Icon(Icons.info_outline, size: 16, color: muted), SizedBox(width: 7), Expanded(child: Text('Illustrative UI preview. Chart placements will be calculated after birth details are added.', style: TextStyle(color: muted, fontSize: 11, height: 1.4)))]),
      ])),
      const SizedBox(height: 16),
      FilledButton.icon(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BirthDetailsPage())), icon: const Icon(Icons.edit_calendar), label: const Text('Add birth details'), style: FilledButton.styleFrom(backgroundColor: ink, padding: const EdgeInsets.all(16))),
      const SizedBox(height: 20),
      const SectionHeading(title: 'Explore your chart', action: '4 TOPICS'),
      const SizedBox(height: 12),
      const TopicRow(icon: Icons.brightness_7, title: 'Grahas', subtitle: 'Planet positions and meanings'),
      const TopicRow(icon: Icons.grid_4x4, title: 'Bhavas', subtitle: 'Life areas represented by houses'),
      const TopicRow(icon: Icons.change_circle_outlined, title: 'Dashas', subtitle: 'Planetary periods and cycles'),
      const TopicRow(icon: Icons.layers_outlined, title: 'Divisional charts', subtitle: 'D1, D9, D10 and more'),
    ]));
  }
}

class ChartPainter extends CustomPainter {
  final String style;
  ChartPainter(this.style);
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final border = Paint()..color = const Color(0xFFB98142)..style = PaintingStyle.stroke..strokeWidth = 1.4;
    final fill = Paint()..color = const Color(0xFFFFFBF3);
    canvas.drawRRect(RRect.fromRectAndRadius(rect.deflate(2), const Radius.circular(8)), fill);
    canvas.drawRRect(RRect.fromRectAndRadius(rect.deflate(2), const Radius.circular(8)), border);
    final p = Path();
    if (style == 'North Indian') {
      p.moveTo(size.width / 2, 2); p.lineTo(size.width - 2, size.height / 2); p.lineTo(size.width / 2, size.height - 2); p.lineTo(2, size.height / 2); p.close();
      p.moveTo(2, 2); p.lineTo(size.width - 2, size.height - 2);
      p.moveTo(size.width - 2, 2); p.lineTo(2, size.height - 2);
      p.moveTo(size.width / 2, 2); p.lineTo(size.width / 2, size.height * .25); p.moveTo(size.width / 2, size.height * .75); p.lineTo(size.width / 2, size.height - 2);
      p.moveTo(2, size.height / 2); p.lineTo(size.width * .25, size.height / 2); p.moveTo(size.width * .75, size.height / 2); p.lineTo(size.width - 2, size.height / 2);
    } else {
      final cellW = size.width / 4, cellH = size.height / 4;
      for (int i = 1; i < 4; i++) { p.moveTo(cellW * i, 2); p.lineTo(cellW * i, size.height - 2); p.moveTo(2, cellH * i); p.lineTo(size.width - 2, cellH * i); }
      if (style == 'East Indian') {
        p.moveTo(2, 2); p.lineTo(size.width - 2, size.height - 2);
        p.moveTo(size.width - 2, 2); p.lineTo(2, size.height - 2);
      }
    }
    canvas.drawPath(p, border);
    final labels = style == 'South Indian'
      ? ['12','1','2','3','11','','','4','10','','','5','9','8','7','6']
      : style == 'East Indian'
        ? ['1','2','3','4','12','','','5','11','','','6','10','9','8','7']
        : ['1','2','3','4','12','','','5','11','','','6','10','9','8','7'];
    final tp = TextPainter(textDirection: TextDirection.ltr, textAlign: TextAlign.center);
    for (int i = 0; i < 16; i++) {
      final col = i % 4, row = i ~/ 4;
      if (labels[i].isEmpty) continue;
      tp.text = TextSpan(text: labels[i], style: const TextStyle(color: Color(0xFFB98142), fontSize: 10, fontWeight: FontWeight.w700));
      tp.layout();
      tp.paint(canvas, Offset(col * size.width / 4 + size.width / 8 - tp.width / 2, row * size.height / 4 + size.height / 8 - tp.height / 2));
    }
  }
  @override
  bool shouldRepaint(covariant ChartPainter oldDelegate) => oldDelegate.style != style;
}

class PanchangPage extends StatelessWidget {
  const PanchangPage({super.key});
  @override
  Widget build(BuildContext context) => SafeArea(child: ListView(padding: const EdgeInsets.all(20), children: [
    const PageHeader(eyebrow: 'THE RHYTHM OF THE DAY', title: 'Daily Panchang', subtitle: 'A traditional snapshot of today’s sky.'),
    const SizedBox(height: 20),
    Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(24)), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('TUESDAY  ·  13 OCTOBER', style: TextStyle(color: saffron, letterSpacing: 1.4, fontSize: 10, fontWeight: FontWeight.w800)),
      SizedBox(height: 12), Text('A day to act\nwith intention.', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800, height: 1.2)),
      SizedBox(height: 10), Text('Sample content for interface preview. Live Panchang data is not connected yet.', style: TextStyle(color: Color(0xFFCCD4DD), fontSize: 12, height: 1.45)),
    ])),
    const SizedBox(height: 20),
    const SectionHeading(title: 'Today at a glance', action: 'PANCHANG'),
    const SizedBox(height: 12),
    const Wrap(spacing: 10, runSpacing: 10, children: [
      MetricCard(label: 'TITHI', value: 'Dashami', icon: Icons.brightness_2_outlined),
      MetricCard(label: 'NAKSHATRA', value: 'Shravana', icon: Icons.star_outline_rounded),
      MetricCard(label: 'YOGA', value: 'Siddha', icon: Icons.self_improvement),
      MetricCard(label: 'KARANA', value: 'Taitila', icon: Icons.hourglass_bottom),
    ]),
    const SizedBox(height: 22),
    const SectionHeading(title: 'Auspicious timings', action: 'SAMPLE'),
    const SizedBox(height: 12),
    const TimingRow(title: 'Brahma Muhurta', time: '04:52 – 05:40 AM', icon: Icons.nights_stay_outlined, color: jade),
    const TimingRow(title: 'Abhijit Muhurta', time: '11:44 AM – 12:30 PM', icon: Icons.wb_sunny_outlined, color: saffron),
    const TimingRow(title: 'Rahu Kaal', time: '03:18 – 04:45 PM', icon: Icons.warning_amber_rounded, color: Color(0xFFC56E63)),
  ]));
}

class MetricCard extends StatelessWidget {
  final String label, value;
  final IconData icon;
  const MetricCard({super.key, required this.label, required this.value, required this.icon});
  @override
  Widget build(BuildContext context) => SizedBox(width: (MediaQuery.sizeOf(context).width - 50) / 2, child: Container(padding: const EdgeInsets.all(15), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Icon(icon, color: saffron, size: 20), const SizedBox(height: 12),
    Text(label, style: const TextStyle(fontSize: 9, letterSpacing: 1.2, color: muted, fontWeight: FontWeight.w800)),
    const SizedBox(height: 4), Text(value, style: const TextStyle(fontSize: 16, color: ink, fontWeight: FontWeight.w800)),
  ])));
}

class TimingRow extends StatelessWidget {
  final String title, time;
  final IconData icon;
  final Color color;
  const TimingRow({super.key, required this.title, required this.time, required this.icon, required this.color});
  @override
  Widget build(BuildContext context) => Container(margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(15), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: Row(children: [
    Container(width: 40, height: 40, decoration: BoxDecoration(color: color.withValues(alpha: .15), borderRadius: BorderRadius.circular(13)), child: Icon(icon, color: color)),
    const SizedBox(width: 12), Expanded(child: Text(title, style: const TextStyle(color: ink, fontWeight: FontWeight.w700))),
    Text(time, style: const TextStyle(fontSize: 11, color: muted, fontWeight: FontWeight.w600)),
  ]));
}

class LearnPage extends StatelessWidget {
  const LearnPage({super.key});
  @override
  Widget build(BuildContext context) => SafeArea(child: ListView(padding: const EdgeInsets.all(20), children: [
    const PageHeader(eyebrow: 'KNOWLEDGE, STEP BY STEP', title: 'Learn Jyotish', subtitle: 'Build a clear foundation, one concept at a time.'),
    const SizedBox(height: 20),
    Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: const Color(0xFFE5ECE7), borderRadius: BorderRadius.circular(22)), child: const Row(children: [
      Icon(Icons.menu_book_rounded, size: 38, color: jade), SizedBox(width: 15), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Your learning path', style: TextStyle(color: ink, fontSize: 17, fontWeight: FontWeight.w800)),
        SizedBox(height: 5), Text('Start with the building blocks of a birth chart.', style: TextStyle(color: muted, fontSize: 12, height: 1.4)),
      ])),
    ])),
    const SizedBox(height: 22),
    const SectionHeading(title: 'Core concepts', action: '12 LESSONS'),
    const SizedBox(height: 12),
    const LessonTile(number: '01', title: 'Rashis · Zodiac signs', subtitle: 'The 12 signs and their qualities', duration: '6 min', color: Color(0xFFE5B15D)),
    const LessonTile(number: '02', title: 'Grahas · Planets', subtitle: 'The nine planetary influences', duration: '8 min', color: Color(0xFF7EB4A2)),
    const LessonTile(number: '03', title: 'Bhavas · Houses', subtitle: 'Twelve areas of life', duration: '10 min', color: Color(0xFF8CA8D2)),
    const LessonTile(number: '04', title: 'Nakshatras', subtitle: 'The 27 lunar mansions', duration: '9 min', color: Color(0xFFD69B9B)),
    const LessonTile(number: '05', title: 'Dashas', subtitle: 'Understanding planetary periods', duration: '12 min', color: Color(0xFFB7A0D8)),
    const LessonTile(number: '06', title: 'Yogas', subtitle: 'Planetary combinations', duration: '11 min', color: Color(0xFF94B7C9)),
  ]));
}

class PageHeader extends StatelessWidget {
  final String eyebrow, title, subtitle;
  const PageHeader({super.key, required this.eyebrow, required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(eyebrow, style: const TextStyle(color: muted, fontSize: 10, letterSpacing: 1.7, fontWeight: FontWeight.w800)),
    const SizedBox(height: 8), Text(title, style: const TextStyle(color: ink, fontSize: 29, fontWeight: FontWeight.w900, letterSpacing: -.6)),
    const SizedBox(height: 6), Text(subtitle, style: const TextStyle(color: muted, fontSize: 13, height: 1.45)),
  ]);
}

class TopicRow extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  const TopicRow({super.key, required this.icon, required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) => Container(margin: const EdgeInsets.only(bottom: 9), padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(17)), child: Row(children: [
    Container(width: 42, height: 42, decoration: BoxDecoration(color: const Color(0xFFE8ECEF), borderRadius: BorderRadius.circular(13)), child: Icon(icon, color: ink)),
    const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: const TextStyle(color: ink, fontWeight: FontWeight.w800)),
      const SizedBox(height: 3), Text(subtitle, style: const TextStyle(color: muted, fontSize: 11)),
    ])), const Icon(Icons.chevron_right, color: muted),
  ]));
}

class BirthDetailsPage extends StatefulWidget {
  const BirthDetailsPage({super.key});
  @override
  State<BirthDetailsPage> createState() => _BirthDetailsPageState();
}
class _BirthDetailsPageState extends State<BirthDetailsPage> {
  final name = TextEditingController();
  final date = TextEditingController(text: '21 September 1999');
  final time = TextEditingController(text: '02:30 AM');
  final place = TextEditingController(text: 'Junagadh, Gujarat');
  @override
  void dispose() { name.dispose(); date.dispose(); time.dispose(); place.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Birth details', style: TextStyle(fontWeight: FontWeight.w800))),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      const Text('Every chart begins with a moment.', style: TextStyle(color: ink, fontSize: 25, fontWeight: FontWeight.w900, height: 1.2)),
      const SizedBox(height: 8), const Text('Add your birth information to prepare a personalised Kundli. This screen is UI-only for now.', style: TextStyle(color: muted, fontSize: 13, height: 1.5)),
      const SizedBox(height: 24),
      const FormLabel('YOUR NAME'), TextField(controller: name, decoration: fieldDecoration('Enter full name', Icons.person_outline)),
      const SizedBox(height: 17), const FormLabel('DATE OF BIRTH'), TextField(controller: date, decoration: fieldDecoration('Select date', Icons.calendar_month_outlined)),
      const SizedBox(height: 17), const FormLabel('TIME OF BIRTH'), TextField(controller: time, decoration: fieldDecoration('Select time', Icons.access_time_rounded)),
      const SizedBox(height: 17), const FormLabel('BIRTH PLACE'), TextField(controller: place, decoration: fieldDecoration('City, state or country', Icons.location_on_outlined)),
      const SizedBox(height: 25),
      FilledButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('UI preview only — calculations are not connected yet.'))), style: FilledButton.styleFrom(backgroundColor: ink, padding: const EdgeInsets.all(17)), child: const Text('Preview my Kundli', style: TextStyle(fontWeight: FontWeight.w800))),
    ]),
  );
}

class FormLabel extends StatelessWidget {
  final String text;
  const FormLabel(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.only(bottom: 8), child: Text(text, style: const TextStyle(color: muted, fontSize: 10, letterSpacing: 1.3, fontWeight: FontWeight.w800)));
}
InputDecoration fieldDecoration(String hint, IconData icon) => InputDecoration(
  hintText: hint, prefixIcon: Icon(icon, color: muted, size: 20), filled: true, fillColor: Colors.white,
  hintStyle: const TextStyle(color: Color(0xFFADB4BA), fontSize: 13),
  contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Color(0xFFE8E8E4))),
  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: saffron, width: 1.5)),
);

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Your profile')), body: ListView(padding: const EdgeInsets.all(20), children: [
    const CircleAvatar(radius: 38, backgroundColor: Color(0xFFE5E8E9), child: Icon(Icons.person_outline, size: 38, color: ink)),
    const SizedBox(height: 12), const Center(child: Text('Your Jyotish space', style: TextStyle(color: ink, fontSize: 21, fontWeight: FontWeight.w900))),
    const SizedBox(height: 5), const Center(child: Text('Personal preferences and saved details', style: TextStyle(color: muted, fontSize: 12))),
    const SizedBox(height: 24), const TopicRow(icon: Icons.person_outline, title: 'Birth profile', subtitle: 'Add or update birth details'),
    const TopicRow(icon: Icons.dashboard_customize_outlined, title: 'Kundli chart style', subtitle: 'North, South or East Indian'),
    const TopicRow(icon: Icons.notifications_none, title: 'Reminders', subtitle: 'Daily Panchang notifications'),
    const TopicRow(icon: Icons.info_outline, title: 'About Saral Jyotish', subtitle: 'Learn about this app'),
  ]));
}

class TopicPage extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  const TopicPage({super.key, required this.title, required this.subtitle, required this.icon});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text(title)), body: Padding(padding: const EdgeInsets.all(24), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Container(width: 70, height: 70, decoration: BoxDecoration(color: saffron.withValues(alpha: .2), borderRadius: BorderRadius.circular(22)), child: Icon(icon, color: ink, size: 34)),
    const SizedBox(height: 20), Text(title, style: const TextStyle(color: ink, fontSize: 28, fontWeight: FontWeight.w900)),
    const SizedBox(height: 8), Text(subtitle, style: const TextStyle(color: muted, fontSize: 14, height: 1.5)),
    const SizedBox(height: 20), const Text('This section is a visual placeholder. Content and astrology calculations will be connected in a later phase.', style: TextStyle(color: muted, fontSize: 13, height: 1.5)),
  ])));
}
