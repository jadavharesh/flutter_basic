import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utility/ColorCode.dart';
import '../utility/Utils.dart';

class CustomSettingItem extends StatefulWidget {
  const CustomSettingItem({Key? key, required this.onClick, required this.text, this.icons, this.color}) : super(key: key);
  final Function onClick;
  final String text;
  final IconData? icons;
  final String? color;


  @override
  State<CustomSettingItem> createState() => _CustomSettingItemState();
}

class _CustomSettingItemState extends State<CustomSettingItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      width: MediaQuery.of(context).size.width,
      height: 45.h,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child:Row(
            children: [
              SizedBox(width: 20.w,),
              Icon(widget.icons,size: 25.h,color: widget.color!=null ? Utils.getColor(ColorCode.white) : Utils.getColor(ColorCode.grey)),
              SizedBox(width: 20.w,),
              Text(widget.text,style:TextStyle(color: widget.color!=null ? Utils.getColor(ColorCode.white) : Utils.getColor(ColorCode.black),decoration: TextDecoration.none,fontSize: 16.sp,fontFamily: 'Gilroy_semi_bold')),
            ],
          ),
          onTap: ()
          {
            widget.onClick();
          },
        ),
      ),
    );
  }
}
