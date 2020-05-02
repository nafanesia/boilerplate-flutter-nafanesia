import 'package:boilerplate_flutter_nafanesia/constants/my_colors.dart';
import 'package:boilerplate_flutter_nafanesia/constants/my_sizes.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final Function onChange;

  TextFieldWidget({@required this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      style: TextStyle(
        fontSize: MySize.fontMedium,
      ),
      decoration: InputDecoration(
        fillColor: MyColors.white,
        filled: true,
        contentPadding: EdgeInsets.all(MySize.paddingWidthMedium),
        border: InputBorder.none,
      ),
    );
  }
}
