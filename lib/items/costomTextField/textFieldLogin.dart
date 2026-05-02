
import 'package:evently/core/appColors.dart';
import 'package:flutter/material.dart';


class Textfieldlogin extends StatelessWidget {
   Textfieldlogin({super.key,required this.hintText, required this.prefixIcon,this.suffixIcon, this.controller});
  final String hintText;
  final String prefixIcon ;
  final String? suffixIcon ;
  final TextEditingController? controller ;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: ImageIcon(AssetImage(prefixIcon),size: 24, color: AppColor.sectext,),
        suffixIcon: suffixIcon==null?null:ImageIcon(AssetImage(suffixIcon!),size: 24, color: AppColor.sectext,),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        fillColor:Theme.of(context).colorScheme.surface ,
        filled:true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
