import 'package:flutter/material.dart';

class JHCircleButton extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final double width;

  const JHCircleButton({
    super.key,
    required this.child,
    this.onTap,
    this.width = 56,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: const IconThemeData(size: 21.49),
        textTheme: const TextTheme(
          labelLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      child: SizedBox(
        width: width,
        height: width,
        child: OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            side: const BorderSide(width: 1, color: Colors.grey),
            minimumSize: const Size(0, 0),
          ),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
