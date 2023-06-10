import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final BuildContext context;
  final bool? disable;
  final bool? smallMode;
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const AppBarButton({
    super.key,
    required this.context,
    this.disable,
    this.smallMode,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

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

    final buttonSmall = Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5,0,5,7),
          child: IconButton(
            onPressed: (disable == true) ? null : onPressed,
            icon: Icon(icon, color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        Positioned(
          bottom: 5,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );



    return (smallMode == true) ? buttonSmall : buttonExtended;
  }
}
