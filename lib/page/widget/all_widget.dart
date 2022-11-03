import 'package:flutter/material.dart';
import 'package:ftv2/resource/all_color.dart';

 appBar(){
 return AppBar(
    title:const Text( "Law Companion"),
    elevation: 10,
    backgroundColor: appBarColor,
    centerTitle: false,
 );
}

// Bold Text
Widget normalText(String text, double fs, Color color) {
  return Text(
    text,
    style: TextStyle(
        color: color, fontSize: fs),
  );
}


// Bold Text
Widget boldText(String text, double fs,Color color) {
  return Text(
    text,
    style: TextStyle(
        color: color, fontSize: fs, fontWeight: FontWeight.bold),
  );
}

// purple button

Widget purpleButton(String text,Function fun){
   return GestureDetector(
     onTap: (){
       fun();
     },
     child: Card(
       elevation: 2,
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
       color:   appBarColor,
       child: SizedBox(
           height: 50,
           child:  Center(child: Text(text ,style:  const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),))),
     ),
   );
}


gradientColor(){
  return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [background1Color, background2Color]));
}

List<TextSpan> highlightOccurrences(String source, String query) {
  if (query == null || query.isEmpty || !source.toLowerCase().contains(query.toLowerCase())) {
    return [ TextSpan(text: source) ];
  }
  final matches = query.toLowerCase().allMatches(source.toLowerCase());

  int lastMatchEnd = 0;

  final List<TextSpan> children = [];
  for (var i = 0; i < matches.length; i++) {
    final match = matches.elementAt(i);

    if (match.start != lastMatchEnd) {
      children.add(TextSpan(
        text: source.substring(lastMatchEnd, match.start),
      ));
    }

    children.add(TextSpan(
      text: source.substring(match.start, match.end),
      style: TextStyle(fontWeight: FontWeight.bold, color: yellowColor),
    ));

    if (i == matches.length - 1 && match.end != source.length) {
      children.add(TextSpan(
        text: source.substring(match.end, source.length),
      ));
    }

    lastMatchEnd = match.end;
  }
  return children;
}
