import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utility/ColorCode.dart';
import '../utility/Utils.dart';
import 'CustomText.dart';


class CustomRadio extends StatefulWidget {
  CustomRadio({Key? key, required this.onChange, required this.text, required this.value, required this.groupvalue});
  final Function onChange;
  final String text;
  final int value;
  final int groupvalue;

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Radio(value:widget.value, groupValue: widget.groupvalue, onChanged: (value) { widget.onChange(value); }, activeColor: Utils.getColor(ColorCode.blue)),
        InkWell(child: CustomText(text: widget.text, colorCode: ColorCode.black, fontSize: 14, fontFamily: 'Gilroy_semi_bold',),
        onTap: (){
           widget.onChange(widget.value);
        },),
      ],
    );
  }
}
