import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utility/ColorCode.dart';
import '../utility/Utils.dart';


class CustomHeader extends StatefulWidget {
  CustomHeader({Key? key, required this.onClickDrawer, required this.text});
  final Function onClickDrawer;
  final String text;

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child:Text(widget.text,style:TextStyle(color:Utils.getColor(ColorCode.blue),decoration: TextDecoration.none,fontSize: 15.sp)),
        onTap: ()
        {
          widget.onClickDrawer();
        },
      ),
    );
  }
}
