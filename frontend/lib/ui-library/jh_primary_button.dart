import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class JHPrimaryButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final double? width;
  final bool disabled;
  final bool loading;

  const JHPrimaryButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.width,
    this.disabled = false,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: const TextTheme(
          labelLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      child: SizedBox(
        width: width,
        height: 56,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: disabled || loading ? Colors.grey : Colors.deepPurple,
            borderRadius: BorderRadius.circular(100),
          ),
          child: TextButton(
            onPressed: disabled || loading
                ? null
                : (onPressed == null
                    ? null
                    : () {
                        onPressed!();
                        FocusManager.instance.primaryFocus?.unfocus();
                      }),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              foregroundColor: disabled || loading ? Colors.grey : Colors.white,
            ),
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                child: loading
                    ? const CircularProgressIndicator(
                        color: Colors.black,
                      )
                    : child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
