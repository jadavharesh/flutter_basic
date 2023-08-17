import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/ColorCode.dart';
import '../utility/Utils.dart';
import 'CustomText.dart';

class CustomCancelButton extends StatefulWidget {
  const CustomCancelButton({Key? key,required this.onClick, required this.text, this.color});
  final Function onClick;
  final String text;
  final String? color;

  @override
  State<CustomCancelButton> createState() => _CustomCancelButtonState();
}

class _CustomCancelButtonState extends State<CustomCancelButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.onClick();
      },
      child:Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.only(top: 5.h,bottom: 5.h,left: kIsWeb ? 7.w : 10.w,right: kIsWeb ? 7.w : 10.w),
            decoration: BoxDecoration(
                color: Utils.getColor(ColorCode.grey_white),
                borderRadius: BorderRadius.circular(5)
            ),
            child: Row(
              children: [
                CustomText(text: widget.text, colorCode: ColorCode.black, fontSize: 14, fontFamily: 'Gilroy_semi_bold'),
                SizedBox(width: 10.w,),
                Icon(Icons.cancel ,size: 25,color: Utils.getColor(ColorCode.black).withOpacity(0.5),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
