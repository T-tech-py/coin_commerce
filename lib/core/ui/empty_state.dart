import 'package:coin_commerce/core/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/custom_image_widget.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key, required this.image, required this.text});
final String image;
final String text;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    bool isDark = theme.brightness== Brightness.dark;
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageWidget(imagePath: image),
          20.height,
          Text(text,
          style: theme.textTheme.bodyLarge,)
        ],
      ),
    );
  }
}
