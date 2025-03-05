import 'package:flutter/material.dart';
import '../models/icon_model.dart';

class InteractiveIcon extends StatelessWidget {
  final IconModel iconModel;
  final VoidCallback onTap;

  const InteractiveIcon({
    Key? key,
    required this.iconModel,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(iconModel.icon, color: Colors.grey, size: 20),
          SizedBox(width: 5),
          Text(iconModel.count.toString(), style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
