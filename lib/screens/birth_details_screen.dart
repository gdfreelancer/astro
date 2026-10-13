import 'package:flutter/material.dart';
import '../app.dart';

class BirthDetailsScreen extends StatefulWidget {
  const BirthDetailsScreen({super.key});
  @override State<BirthDetailsScreen> createState() => _BirthDetailsScreenState();
}
class _BirthDetailsScreenState extends State<BirthDetailsScreen> {
  final name=TextEditingController(), date=TextEditingController(), time=TextEditingController(), place=TextEditingController();
  @override void dispose(){name.dispose();date.dispose();time.dispose();place.dispose();super.dispose();}
  @override Widget build(BuildContext context) => Scaffold(appBar:AppBar(title:const Text('Birth details')),body:ListView(padding:const EdgeInsets.all(20),children:[
    const Text('Every chart begins with a moment.',style:TextStyle(color:ink,fontSize:25,fontWeight:FontWeight.w900,height:1.2)),
    const SizedBox(height:8),const Text('Add birth information to prepare a personalised Kundli. UI-only preview for now.',style:TextStyle(color:muted,fontSize:13,height:1.5)),
    const SizedBox(height:24),_field('YOUR NAME','Enter full name',name,Icons.person_outline),
    _field('DATE OF BIRTH','DD/MM/YYYY',date,Icons.calendar_month_outlined,readOnly:true,onTap:()async{final d=await showDatePicker(context:context,firstDate:DateTime(1900),lastDate:DateTime.now(),initialDate:DateTime(2000));if(d!=null)date.text='${d.day}/${d.month}/${d.year}';}),
    _field('TIME OF BIRTH','Select time',time,Icons.access_time,readOnly:true,onTap:()async{final t=await showTimePicker(context:context,initialTime:TimeOfDay.now());if(t!=null)time.text=t.format(context);}),
    _field('BIRTH PLACE','City, state or country',place,Icons.location_on_outlined),
    const SizedBox(height:12),FilledButton(style:FilledButton.styleFrom(backgroundColor:ink,padding:const EdgeInsets.all(17)),onPressed:()=>ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('UI preview only — calculations are not connected yet.'))),child:const Text('Preview my Kundli')),
  ]));
  Widget _field(String label,String hint,TextEditingController c,IconData icon,{bool readOnly=false,VoidCallback? onTap}) => Padding(padding:const EdgeInsets.only(bottom:16),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Padding(padding:const EdgeInsets.only(bottom:8),child:Text(label,style:const TextStyle(color:muted,fontSize:10,letterSpacing:1.3,fontWeight:FontWeight.w800))),TextField(controller:c,readOnly:readOnly,onTap:onTap,decoration:InputDecoration(hintText:hint,prefixIcon:Icon(icon,color:muted,size:20),filled:true,fillColor:Colors.white,border:OutlineInputBorder(borderRadius:BorderRadius.circular(15),borderSide:BorderSide.none),enabledBorder:OutlineInputBorder(borderRadius:BorderRadius.circular(15),borderSide:const BorderSide(color:Color(0xFFE8E8E4)))))]));
}