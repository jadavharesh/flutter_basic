import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utility/ColorCode.dart';
import '../utility/Utils.dart';
import 'CustomText.dart';

class CustomDownloadButton extends StatefulWidget {
  const CustomDownloadButton({Key? key,required this.onClick, required this.text, this.color});
  final Function onClick;
  final String text;
  final String? color;

  @override
  State<CustomDownloadButton> createState() => _CustomDownloadButtonState();
}

class _CustomDownloadButtonState extends State<CustomDownloadButton> {
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
            CustomText(text: 'lbl_download'.tr, colorCode: ColorCode.white, fontSize: 14, fontFamily: 'Gilroy_semi_bold'),
            SizedBox(width: 7.w,),
            Icon(Icons.download_for_offline ,size: 25,color: Utils.getColor(ColorCode.white),),
          ],
        ),
      ),
    );
  }
}
