import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/ColorCode.dart';
import '../utility/Utils.dart';

class CustomOtpField extends StatefulWidget {
  const CustomOtpField({Key? key, this.onTextChange, required this.textEditingController, this.textInputAction, this.myFocusNode});
  final Function? onTextChange;
  final TextEditingController textEditingController;
  final TextInputAction? textInputAction;
  final FocusNode? myFocusNode;

  @override
  State<CustomOtpField> createState() => _CustomOtpFieldState();
}

class _CustomOtpFieldState extends State<CustomOtpField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 45.h,
      padding: const EdgeInsets.only(left: 5, right: 5,top: 5,bottom: 5),
      decoration: BoxDecoration(
        color: Utils.getColor(ColorCode.grey_white),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: TextField(
        controller: widget.textEditingController,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        maxLines: 1,
        maxLength: 1,
        textAlign: TextAlign.center,
        focusNode: widget.myFocusNode,
        onChanged: (value)
        {
          widget.onTextChange!(value);
        },
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        style: TextStyle(color: Utils.getColor(ColorCode.black),decoration: TextDecoration.none,fontSize: 16.sp,fontFamily: 'Gilroy_bold'),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "0",
          counterText: "",
          hintStyle:TextStyle(color: Utils.getColor(ColorCode.hint_text),decoration: TextDecoration.none,fontSize: 16.sp,fontFamily: 'Gilroy_bold'),
        ),
      ),
    );
  }
}
