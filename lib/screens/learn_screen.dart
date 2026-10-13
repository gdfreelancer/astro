import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/ui_components.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});
  @override Widget build(BuildContext context) => SafeArea(child: ListView(padding: const EdgeInsets.all(20), children: [
    const PageHeader(eyebrow: 'KNOWLEDGE, STEP BY STEP', title: 'Learn Jyotish', subtitle: 'Build a clear foundation, one concept at a time.'),
    const SizedBox(height: 20), Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: const Color(0xFFE5ECE7), borderRadius: BorderRadius.circular(22)), child: const Row(children: [Icon(Icons.menu_book_rounded,size:38,color:Color(0xFF3C8C78)),SizedBox(width:15),Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('Your learning path',style:TextStyle(color:ink,fontSize:17,fontWeight:FontWeight.w800)),SizedBox(height:5),Text('Start with the building blocks of a birth chart.',style:TextStyle(color:muted,fontSize:12,height:1.4))]))])),
    const SizedBox(height: 22), const SectionHeading('Core concepts'), const SizedBox(height: 12),
    const LessonTile(number:'01',title:'Rashis · Zodiac signs',subtitle:'The 12 signs and their qualities'),
    const LessonTile(number:'02',title:'Grahas · Planets',subtitle:'The nine planetary influences'),
    const LessonTile(number:'03',title:'Bhavas · Houses',subtitle:'Twelve areas of life'),
    const LessonTile(number:'04',title:'Nakshatras',subtitle:'The 27 lunar mansions'),
    const LessonTile(number:'05',title:'Dashas',subtitle:'Understanding planetary periods'),
    const LessonTile(number:'06',title:'Yogas',subtitle:'Planetary combinations'),
  ]));
}