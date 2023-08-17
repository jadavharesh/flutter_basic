

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/ColorCode.dart';
import '../utility/Utils.dart';

class CustomStatusItem extends StatefulWidget {
  const CustomStatusItem({Key? key, required this.title, required this.selected, required this.onclick}) : super(key: key);

  final String title;
  final bool selected;
  final Function onclick;
  @override
  State<CustomStatusItem> createState() => _CustomStatusItemState();
}

class _CustomStatusItemState extends State<CustomStatusItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 10.h,bottom: 10.h,left: 7.w,right: 7.w),
          decoration: BoxDecoration(
              color: Utils.getColor(widget.selected ? ColorCode.green : ColorCode.black).withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(5))
          ),
          child: Stack(
            children: [
              Center(child: Text(widget.title,style: TextStyle(color:Utils.getColor(widget.selected ? ColorCode.green : ColorCode.black),fontFamily: 'Gilroy_semi_bold',decoration: TextDecoration.none,fontSize: 15.sp))),
              Visibility(
                visible: widget.selected,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.check,size: 20,color: Utils.getColor(ColorCode.green),),
                ),
              )
            ],
          )
      ),
      onTap: (){
        widget.onclick();
      },
    );
  }
}
