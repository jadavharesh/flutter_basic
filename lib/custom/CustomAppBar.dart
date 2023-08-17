import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utility/ColorCode.dart';
import '../utility/Utils.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key,required this.onClick, required this.text, required this.bgColor});
  final Function onClick;
  final String text;
  final String bgColor;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return /*Container(
      padding: EdgeInsets.only(top: 15.h,bottom: 15.h),
      color: Utils.getColor(widget.bgColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [


          Padding(
          padding: EdgeInsets.only(left: 7),
          child:InkWell(
          onTap: ()
              {
                widget.onClick();
              },
          child:Icon(Icons.arrow_back_outlined,color: Colors.white,)
          ),),



            Center(
         child: Text(widget.text,style: TextStyle(color: Utils.getColor(ColorCode.white),fontSize: 16.sp),),
          )

          ],
      ),
    );*/
      AppBar(
        titleSpacing: -100,
        centerTitle: true, // <-- and this
        title: Center(child:Text(widget.text)),
        backgroundColor: Utils.getColor(widget.bgColor),
      leading: IconButton(
        icon: new Icon(Icons.arrow_back_rounded),
        onPressed: (){
          widget.onClick();
        }
      ),
    );
  }
}
