import 'package:flutter/material.dart';
import 'package:saloonstore/components/Colors.dart';


class HoverCardWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback ontap; // Fix the parameter name

  const HoverCardWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.ontap,
  }) : super(key: key);

  @override
  _HoverCardWidgetState createState() => _HoverCardWidgetState();
}

class _HoverCardWidgetState extends State<HoverCardWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Card(
        elevation: 10,
        color: isHovered ? AppColors.primaryColor : null,
        child: InkWell(
          onTap: widget.ontap, // Fix the method call
          child: SizedBox(
            width: 300,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(widget.icon, size: 40, color: Colors.blue),
                const SizedBox(height: 8),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
