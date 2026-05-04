

import 'package:evently/core/appColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/hidenText_Provider.dart';


class Textfieldlogin extends StatelessWidget {
   Textfieldlogin({super.key,required this.obscureText,this.validator,required this.hintText, required this.prefixIcon,this.suffixIcon, this.controller});
  final String hintText;
  final String prefixIcon ;
  final String? suffixIcon ;
  final TextEditingController? controller ;
  final bool obscureText ;

  final String? Function(String?)? validator ;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HidenTextProvider(),
        builder:(context, child) {
          var hideProvider = context.watch<HidenTextProvider>();
          return  TextFormField(
            validator: validator,
            controller: controller,
            obscureText:suffixIcon==null?obscureText:hideProvider.hide,
            decoration: InputDecoration(
              prefixIcon: ImageIcon(AssetImage(prefixIcon),size: 24, color: AppColor.sectext,),
              suffixIcon: suffixIcon==null?null:InkWell(
                  onTap: (){
                    hideProvider.changeHideText();
                  },
                  child: ImageIcon(AssetImage(suffixIcon!),size: 24, color: AppColor.sectext,)),
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
        
      
    );
  }
}
