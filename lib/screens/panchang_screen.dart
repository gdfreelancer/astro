import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/ui_components.dart';

class PanchangScreen extends StatelessWidget {
  const PanchangScreen({super.key});
  @override Widget build(BuildContext context) => SafeArea(child: ListView(padding: const EdgeInsets.all(20), children: [
    const PageHeader(eyebrow: 'THE RHYTHM OF THE DAY', title: 'Daily Panchang', subtitle: 'A traditional snapshot of today’s sky.'),
    const SizedBox(height: 20), Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: ink, borderRadius: BorderRadius.circular(24)), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('DAILY ALMANAC · SAMPLE', style: TextStyle(color: saffron, fontSize: 10, letterSpacing: 1.4, fontWeight: FontWeight.w800)),
      SizedBox(height: 12), Text('A day to act\nwith intention.', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800, height: 1.2)),
      SizedBox(height: 10), Text('Sample interface content. Live Panchang data is not connected.', style: TextStyle(color: Color(0xFFCCD4DD), fontSize: 12, height: 1.5)),
    ])),
    const SizedBox(height: 22), const SectionHeading('Today at a glance'),
    const SizedBox(height: 12), const _Metric('TITHI','Dashami',Icons.brightness_2_outlined), const _Metric('NAKSHATRA','Shravana',Icons.star_outline), const _Metric('YOGA','Siddha',Icons.self_improvement), const _Metric('KARANA','Taitila',Icons.hourglass_bottom),
    const SizedBox(height: 20), const SectionHeading('Auspicious timings'),
    const SizedBox(height: 12), const TopicRow(icon: Icons.nights_stay_outlined,title:'Brahma Muhurta',subtitle:'04:52 – 05:40 AM · Sample'),
    const TopicRow(icon: Icons.wb_sunny_outlined,title:'Abhijit Muhurta',subtitle:'11:44 AM – 12:30 PM · Sample'),
    const TopicRow(icon: Icons.warning_amber_rounded,title:'Rahu Kaal',subtitle:'03:18 – 04:45 PM · Sample'),
  ]));
}
class _Metric extends StatelessWidget {
  final String label,value; final IconData icon;
  const _Metric(this.label,this.value,this.icon);
  @override Widget build(BuildContext context) => Container(margin: const EdgeInsets.only(bottom: 9), padding: const EdgeInsets.all(15), decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(16)), child: Row(children: [Icon(icon,color:saffron), const SizedBox(width:12), Expanded(child:Text(label,style:const TextStyle(color:muted,fontSize:10,letterSpacing:1.1,fontWeight:FontWeight.w800))), Text(value,style:const TextStyle(color:ink,fontWeight:FontWeight.w800))]));
}