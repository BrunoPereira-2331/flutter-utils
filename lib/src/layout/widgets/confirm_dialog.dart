import 'package:flutter/material.dart';

class ConfirmDialog extends StatefulWidget {
  final String titleMessage;
  final String? contentMessage;
  final String rightButtonMessage;
  final String? leftButtonMessage;
  final IconData? titleIcon;
  final VoidCallback rightButtonCallback;
  final VoidCallback? leftButtonCallback;

  final Color? backgroundColor;
  final Color? shadowColor;
  final Color? surfaceTintColor;

  const ConfirmDialog({
    Key? key,
    required this.titleMessage,
    this.contentMessage,
    required this.rightButtonMessage,
    this.leftButtonMessage,
    this.titleIcon,
    required this.rightButtonCallback,
    this.leftButtonCallback,
    this.backgroundColor,
    this.shadowColor,
    this.surfaceTintColor,
  }) : super(key: key);

  @override
  _ConfirmDialogState createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: widget.backgroundColor ?? Colors.white,
      shadowColor: widget.shadowColor ?? Colors.white,
      surfaceTintColor: widget.surfaceTintColor ?? Colors.white,
      title: Row(children: [
        widget.titleIcon != null ? Icon(widget.titleIcon) : Container(),
        const SizedBox(width: 10),
        Text(
          widget.titleMessage,
          style: const TextStyle(color: Colors.black),
        ),
      ]),
      content: widget.contentMessage != null ? Text(
        widget.contentMessage!,
        style: const TextStyle(color: Colors.black),
      ) : null,
      actions: [
        widget.leftButtonMessage != null
            ? TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: Text(
                  widget.leftButtonMessage!,
                  style: const TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  if (widget.leftButtonCallback != null) {
                    widget.leftButtonCallback!();
                  }
                },
              )
            : Container(),
        TextButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
          child: Text(
            widget.rightButtonMessage,
            style: const TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            widget.rightButtonCallback();
          },
        ),
      ],
    );
  }
}
