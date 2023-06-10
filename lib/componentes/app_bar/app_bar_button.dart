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
          BorderSide(color: Colors.green.shade900),
        ),
      ),
      icon: Icon(icon, color: Colors.green.shade900),
      label: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.green.shade900,
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
            icon: Icon(icon, color: Colors.green.shade900),
          ),
        ),
        Positioned(
          bottom: 5,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade900,
            ),
          ),
        ),
      ],
    );



    return (smallMode == true) ? buttonSmall : buttonExtended;
  }
}
