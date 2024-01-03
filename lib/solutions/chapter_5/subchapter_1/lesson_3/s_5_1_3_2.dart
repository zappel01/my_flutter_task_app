import 'package:flutter/material.dart';

class S5132 extends StatelessWidget {
  const S5132({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 200,
        height: 30,
        child: ExpandableText(
          initialText: 'Hier ist ein langer Text, der über die Box hinausgeht.',
        ),
      ),
    );
  }
}

class ExpandableText extends StatefulWidget {
  final String initialText;

  const ExpandableText({super.key, required this.initialText});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: SizedBox(
        width: 200,
        height: 30,
        child: isExpanded
            ? Text(
                widget.initialText,
                overflow: TextOverflow.visible,
              )
            : Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.initialText,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
