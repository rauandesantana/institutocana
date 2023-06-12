import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final BuildContext context;
  final bool? disable;
  final double? smallModeWidth;
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const AppBarButton({
    super.key,
    required this.context,
    this.disable,
    this.smallModeWidth,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final smallMode = width < (smallModeWidth ?? 550);

    final buttonExtended = OutlinedButton.icon(
      onPressed: (disable == true) ? null : onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStatePropertyAll(
          Theme.of(context).colorScheme.primary,
        ),
        side: MaterialStatePropertyAll(
          BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
      icon: Icon(icon, color: Theme.of(context).colorScheme.secondary),
      label: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );

    final buttonSmall = TextButton(
      onPressed: (disable == true) ? null : onPressed,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Icon(icon, color: Theme.of(context).colorScheme.secondary),
          ),
        ],
      ),
    );

    return (smallMode) ? buttonSmall : buttonExtended;
  }
}
