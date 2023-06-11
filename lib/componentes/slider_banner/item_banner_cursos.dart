import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ItemBannerCursos extends StatefulWidget {
  final Size size;
  final String urlImage;
  final String title;
  final String objective;
  final String date;
  final String local;
  final VoidCallback onTap;

  const ItemBannerCursos({
    super.key,
    required this.size,
    required this.urlImage,
    required this.title,
    required this.objective,
    required this.date,
    required this.local,
    required this.onTap,
  });

  @override
  State<ItemBannerCursos> createState() => _ItemBannerCursosState();
}

class _ItemBannerCursosState extends State<ItemBannerCursos> {
  bool knowMore = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = (!kIsWeb) ? (Platform.isAndroid || Platform.isIOS) : false;

    final image = ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25),
        bottomLeft: Radius.circular(25),
      ),
      child: Stack(
        children: <Widget>[
          Image.network(
            widget.urlImage,
            fit: BoxFit.cover,
            width: widget.size.width * 0.35,
            height: widget.size.height,
            errorBuilder: (context, error, stack) {
              return Container(
                decoration: BoxDecoration(color: Colors.green.shade100),
                child: Image.asset(
                  "assets/imagens/logo.png",
                  color: Colors.green.shade900,
                  fit: BoxFit.cover,
                  width: widget.size.width * 0.35,
                  height: widget.size.height,
                ),
              );
            },
            loadingBuilder: (context, child, load) {
              if (load != null) {
                final loadExpected = load.expectedTotalBytes;
                final loadValue = load.cumulativeBytesLoaded;
                return SizedBox(
                  width: widget.size.width * 0.35,
                  height: widget.size.height,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: (loadExpected != null)
                          ? (loadValue / loadExpected)
                          : null,
                    ),
                  ),
                );
              } else {
                return child;
              }
            },
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: (isMobile || knowMore)
                ? Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.green.shade900.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(25)),
                    child: const Text(
                      "Saiba mais...",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : const SizedBox(width: 0, height: 0),
          )
        ],
      ),
    );

    final body = Container(
      width: widget.size.width * 0.65,
      height: widget.size.height,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              widget.title,
              maxLines: 1,
              style: TextStyle(
                color: Colors.green.shade900,
                fontFamily: "Kaczun Oldstyle",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Expanded(
            child: RichText(
              maxLines: 6,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: "Objetivo: ",
                style: TextStyle(
                    color: Colors.green.shade900, fontWeight: FontWeight.bold),
                children: <InlineSpan>[
                  TextSpan(
                    text: widget.objective,
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
          RichText(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              text: "Data: ",
              style: TextStyle(
                  color: Colors.green.shade900, fontWeight: FontWeight.bold),
              children: <InlineSpan>[
                TextSpan(
                  text: widget.date,
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          RichText(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              text: "Local: ",
              style: TextStyle(
                  color: Colors.green.shade900, fontWeight: FontWeight.bold),
              children: <InlineSpan>[
                TextSpan(
                  text: widget.local,
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => setState(() => knowMore = true),
        onExit: (event) => setState(() => knowMore = false),
        child: Container(
          height: widget.size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            borderRadius: const BorderRadius.all(Radius.circular(25)),
          ),
          child: Row(
            children: <Widget>[image, body],
          ),
        ),
      ),
    );
  }
}
