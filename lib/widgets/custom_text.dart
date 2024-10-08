import 'package:flutter/widgets.dart';

class CustomText extends StatelessWidget {
  final String? text;
  const CustomText({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 20),
    );
  }
}
