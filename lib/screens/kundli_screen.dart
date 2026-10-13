import 'package:flutter/material.dart';
import '../app.dart';
import '../widgets/ui_components.dart';
import 'birth_details_screen.dart';

class KundliScreen extends StatefulWidget {
  const KundliScreen({super.key});
  @override State<KundliScreen> createState() => _KundliScreenState();
}
class _KundliScreenState extends State<KundliScreen> {
  String style = 'North Indian';
  @override Widget build(BuildContext context) => SafeArea(child: ListView(padding: const EdgeInsets.all(20), children: [
    const PageHeader(eyebrow: 'YOUR COSMIC BLUEPRINT', title: 'Birth chart', subtitle: 'Explore the map of the sky at your birth.'),
    const SizedBox(height: 20), Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Chart style', style: TextStyle(color: ink, fontSize: 16, fontWeight: FontWeight.w800)), const SizedBox(height: 4),
      const Text('Choose your preferred traditional layout.', style: TextStyle(color: muted, fontSize: 12)), const SizedBox(height: 12),
      Wrap(spacing: 6, children: ['North Indian','South Indian','East Indian'].map((v) => ChoiceChip(label: Text(v), selected: style == v, onSelected: (_) => setState(() => style = v)).toList()),
      const SizedBox(height: 16), AspectRatio(aspectRatio: 1, child: CustomPaint(painter: _ChartPainter(style), child: const Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.brightness_7, color: saffron, size: 30), SizedBox(height: 5), Text('JANMA KUNDLI', style: TextStyle(color: ink, fontWeight: FontWeight.w900, letterSpacing: 1.1)), Text('Illustrative preview', style: TextStyle(color: muted, fontSize: 10))])))),
      const SizedBox(height: 12), const Text('Chart placements are sample-only until birth calculations are connected.', style: TextStyle(color: muted, fontSize: 11)),
    ])),
    const SizedBox(height: 16), FilledButton.icon(style: FilledButton.styleFrom(backgroundColor: ink, padding: const EdgeInsets.all(16)), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BirthDetailsScreen())), icon: const Icon(Icons.edit_calendar), label: const Text('Add birth details')),
    const SizedBox(height: 22), const SectionHeading('Explore your chart'),
    const SizedBox(height: 12), const TopicRow(icon: Icons.brightness_7, title: 'Grahas', subtitle: 'Planet positions and meanings'),
    const TopicRow(icon: Icons.grid_4x4, title: 'Bhavas', subtitle: 'Life areas represented by houses'),
    const TopicRow(icon: Icons.change_circle_outlined, title: 'Dashas', subtitle: 'Planetary periods and cycles'),
    const TopicRow(icon: Icons.layers_outlined, title: 'Divisional charts', subtitle: 'D1, D9, D10 and more'),
  ]));
}
class _ChartPainter extends CustomPainter {
  final String style; _ChartPainter(this.style);
  @override void paint(Canvas canvas, Size size) {
    final line = Paint()..color = const Color(0xFFB98142)..style = PaintingStyle.stroke..strokeWidth = 1.4;
    final rect = Offset.zero & size;
    canvas.drawRRect(RRect.fromRectAndRadius(rect.deflate(2), const Radius.circular(8)), Paint()..color = const Color(0xFFFFFBF3));
    canvas.drawRRect(RRect.fromRectAndRadius(rect.deflate(2), const Radius.circular(8)), line);
    final p = Path();
    if (style == 'North Indian') { p.moveTo(size.width/2, 2); p.lineTo(size.width-2, size.height/2); p.lineTo(size.width/2, size.height-2); p.lineTo(2, size.height/2); p.close(); p.moveTo(2,2); p.lineTo(size.width-2,size.height-2); p.moveTo(size.width-2,2); p.lineTo(2,size.height-2); }
    else { final w=size.width/4, h=size.height/4; for (int i=1;i<4;i++) { p.moveTo(w*i,2); p.lineTo(w*i,size.height-2); p.moveTo(2,h*i); p.lineTo(size.width-2,h*i); } if (style=='East Indian') { p.moveTo(2,2); p.lineTo(size.width-2,size.height-2); p.moveTo(size.width-2,2); p.lineTo(2,size.height-2); } }
    canvas.drawPath(p,line);
    final t=TextPainter(textDirection: TextDirection.ltr);
    for (int i=0;i<12;i++) { t.text=TextSpan(text:'${i+1}',style:const TextStyle(color:Color(0xFFB98142),fontSize:10,fontWeight:FontWeight.w700)); t.layout(); t.paint(canvas,Offset((i%4)*size.width/4+size.width/8-t.width/2,(i~/4)*size.height/4+size.height/8-t.height/2)); }
  }
  @override bool shouldRepaint(covariant _ChartPainter oldDelegate) => oldDelegate.style != style;
}