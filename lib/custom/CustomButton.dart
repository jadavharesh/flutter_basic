import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/ColorCode.dart';
import '../utility/Utils.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({Key? key,required this.onClick, required this.text,this.width, this.color});
  final Function onClick;
  final String text;
  final String? color;
  final double? width;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color:Utils.getColor(widget.color ?? ColorCode.blue)
      ),
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: 45.h,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child:Center(child: Text(widget.text,style:TextStyle(color: Utils.getColor(ColorCode.white),fontFamily: 'Gilroy_semi_bold',decoration: TextDecoration.none,fontSize: 17.sp))),
          onTap: ()
          {
            widget.onClick();
          },
        ),
      ),
    );
  }
}
