
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/ColorCode.dart';
import '../utility/Utils.dart';

class CustomDashboardItem extends StatefulWidget {
  const CustomDashboardItem({Key? key, required this.icon, required this.count, required this.title, required this.color, required this.position, required this.onclick}) : super(key: key);
  final IconData icon;
  final String count;
  final String title;
  final String color;
  final int position;
  final Function onclick;

  @override
  State<CustomDashboardItem> createState() => _CustomDashboardItemState();
}

class _CustomDashboardItemState extends State<CustomDashboardItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(left: 14.w,top: widget.position==1 || widget.position==2 ? 10.h : 20.h,right: 2.w,bottom: 10.h),
        decoration: BoxDecoration(
          color: Utils.getColor(ColorCode.white),
          border: Border(
              right:BorderSide(width: 1.5.w,color: widget.position % 2 == 0 ? Utils.getColor(ColorCode.white) : Utils.getColor(ColorCode.grey_white)),
              top:BorderSide(width: 1.5.w,color: widget.position==1 || widget.position==2 ? Utils.getColor(ColorCode.white) : Utils.getColor(ColorCode.grey_white)),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,style: TextStyle(color:Utils.getColor(ColorCode.black),decoration: TextDecoration.none,fontSize: 13.sp,fontFamily: 'Gilroy_semi_bold')),
                  SizedBox(height: 5.h,),
                  Container(
                      padding:const EdgeInsets.only(top: 5,bottom: 5,left: 7,right: 7),
                      decoration: BoxDecoration(
                          color: Utils.getColor(widget.color).withOpacity(0.1),
                          borderRadius: const BorderRadius.all(Radius.circular(5))
                      ),
                      child: Text(widget.count, style: TextStyle(color: Utils.getColor(widget.color), fontWeight: FontWeight.normal,decoration: TextDecoration.none,fontSize: 12.sp,fontFamily: 'Gilroy_bold'))
                  ),
                ],
              ),
            ),
            SizedBox(width: 2.w,),
            Container(
                padding:const EdgeInsets.all(3),
                margin: const EdgeInsets.only(top: 2),
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Utils.getColor(ColorCode.blue).withOpacity(0.05),
                  shape: BoxShape.circle,
                ),
                child: Icon(widget.icon,color: Utils.getColor(widget.color),)
            ),
            SizedBox(width: 10.w,),
          ],
        ),
      ),
      onTap: (){
        widget.onclick();
      },
    );
  }
}
