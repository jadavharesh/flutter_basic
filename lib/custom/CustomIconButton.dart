
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/Utils.dart';


class CustomIconButton extends StatefulWidget {
  const CustomIconButton({Key? key, required this.onClick, this.icons, required this.color, this.size}) : super(key: key);
  final Function onClick;
  final IconData? icons;
  final String color;
  final int? size;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child:Padding(
          padding: EdgeInsets.all(2.h),
          child: Icon(widget.icons,size: widget.size!=null ? 20.h : 25.h,color: Utils.getColor(widget.color)),
        ),
        onTap: ()
        {
          widget.onClick();
        },
      ),
    );
  }
}
