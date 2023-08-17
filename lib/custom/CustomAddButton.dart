import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/ColorCode.dart';
import '../utility/Utils.dart';
import 'CustomText.dart';

class CustomAddButton extends StatefulWidget {
  const CustomAddButton({Key? key,required this.onClick, required this.text, this.color});
  final Function onClick;
  final String text;
  final String? color;

  @override
  State<CustomAddButton> createState() => _CustomAddButtonState();
}

class _CustomAddButtonState extends State<CustomAddButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.onClick();
      },
      child:Container(
        padding: EdgeInsets.only(top: 5.h,bottom: 5.h,left: kIsWeb ? 7.w : 10.w,right: kIsWeb ? 7.w : 10.w),
        decoration: BoxDecoration(
            color: Utils.getColor(ColorCode.blue),
            borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          children: [
            Icon(Icons.add_circle_rounded ,size: 25,color: Utils.getColor(ColorCode.white),),
            SizedBox(width: 5.w,),
            CustomText(text: widget.text, colorCode: ColorCode.white, fontSize: 14, fontFamily: 'Gilroy_semi_bold'),
          ],
        ),
      ),
    );
  }
}
