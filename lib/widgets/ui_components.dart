import 'package:flutter/material.dart';
import '../app.dart';

class PageHeader extends StatelessWidget {
  final String eyebrow, title, subtitle;
  const PageHeader({super.key, required this.eyebrow, required this.title, required this.subtitle});
  @override Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(eyebrow, style: const TextStyle(color: muted, fontSize: 10, letterSpacing: 1.6, fontWeight: FontWeight.w800)),
    const SizedBox(height: 8), Text(title, style: const TextStyle(color: ink, fontSize: 29, fontWeight: FontWeight.w900)),
    const SizedBox(height: 6), Text(subtitle, style: const TextStyle(color: muted, fontSize: 13, height: 1.45)),
  ]);
}
class SectionHeading extends StatelessWidget {
  final String title;
  const SectionHeading(this.title, {super.key});
  @override Widget build(BuildContext context) => Text(title, style: const TextStyle(color: ink, fontSize: 18, fontWeight: FontWeight.w800));
}
class LessonTile extends StatelessWidget {
  final String number, title, subtitle;
  const LessonTile({super.key, required this.number, required this.title, required this.subtitle});
  @override Widget build(BuildContext context) => Container(margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
    child: Row(children: [
      Container(width: 42, height: 42, alignment: Alignment.center, decoration: BoxDecoration(color: saffron.withValues(alpha: .2), borderRadius: BorderRadius.circular(13)), child: Text(number, style: const TextStyle(color: ink, fontWeight: FontWeight.w900))),
      const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(color: ink, fontWeight: FontWeight.w800)), const SizedBox(height: 3),
        Text(subtitle, style: const TextStyle(color: muted, fontSize: 12)),
      ])), const Icon(Icons.chevron_right, color: muted),
    ]));
}
class FeatureCard extends StatelessWidget {
  final IconData icon; final String title, subtitle; final VoidCallback onTap;
  const FeatureCard({super.key, required this.icon, required this.title, required this.subtitle, required this.onTap});
  @override Widget build(BuildContext context) => Expanded(child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(20), child: Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Icon(icon, color: const Color(0xFFB98142), size: 27), const SizedBox(height: 13),
    Text(title, style: const TextStyle(color: ink, fontWeight: FontWeight.w800)), const SizedBox(height: 4),
    Text(subtitle, style: const TextStyle(color: muted, fontSize: 11)),
  ]))));
}
class TopicRow extends StatelessWidget {
  final IconData icon; final String title, subtitle;
  const TopicRow({super.key, required this.icon, required this.title, required this.subtitle});
  @override Widget build(BuildContext context) => Container(margin: const EdgeInsets.only(bottom: 9), padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(17)), child: Row(children: [
    Icon(icon, color: const Color(0xFFB98142), size: 24), const SizedBox(width: 12),
    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(color: ink, fontWeight: FontWeight.w800)), const SizedBox(height: 3), Text(subtitle, style: const TextStyle(color: muted, fontSize: 11))])),
    const Icon(Icons.chevron_right, color: muted),
  ]));
}