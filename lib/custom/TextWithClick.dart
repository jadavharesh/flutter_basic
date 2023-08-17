import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/ColorCode.dart';
import '../utility/Utils.dart';


class TextwithClick extends StatefulWidget {
  TextwithClick({Key? key, required this.onClick, required this.text});
  final Function onClick;
  final String text;

  @override
  State<TextwithClick> createState() => _TextwithClickState();
}

class _TextwithClickState extends State<TextwithClick> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child:Text(widget.text,style:TextStyle(color:Utils.getColor(ColorCode.blue),fontFamily: 'gilroy_semi_bold',decoration: TextDecoration.none,fontSize: 15.sp)),
        onTap: ()
        {
          widget.onClick();
        },
      ),
    );
  }
}
