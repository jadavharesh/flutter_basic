import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/ColorCode.dart';
import '../utility/Utils.dart';

class CustomAutoComplete extends StatefulWidget {
  const CustomAutoComplete({Key? key, this.height, this.width, this.child}) : super(key: key);
  final double? height;
  final double? width;
  final Widget? child;

  @override
  State<CustomAutoComplete> createState() => _CustomAutoCompleteState();
}

class _CustomAutoCompleteState extends State<CustomAutoComplete> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? 50.h,
      padding: const EdgeInsets.only(left: 20, right: 5),
      decoration: BoxDecoration(
        color: Utils.getColor(ColorCode.grey_white),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: widget.child
    );
  }
}
