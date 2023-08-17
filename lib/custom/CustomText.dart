
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utility/Utils.dart';


class CustomText extends StatefulWidget {
  CustomText({Key? key,required this.text, required this.colorCode, required this.fontSize, this.opacity,this.fontWeightType, this.fontFamily});
  final String colorCode;
  final String text;
  final String? fontFamily;
  final int fontSize;
  final double? opacity;
  final FontWeight? fontWeightType;

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Text(widget.text,style:TextStyle(color:Utils.getColor(widget.colorCode).withOpacity(widget.opacity ?? 1),decoration: TextDecoration.none,fontSize: widget.fontSize.sp,fontFamily: widget.fontFamily ?? 'Gilroy_medium',fontWeight: widget.fontWeightType ?? FontWeight.normal)),
    );
  }
}
