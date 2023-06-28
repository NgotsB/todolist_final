import 'package:flutter/material.dart';
import 'dialog_footer.dart';
import 'dialog_header.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? confirmButtonText;

  const ConfirmationDialog({
    required this.title,
    required this.message,
    this.confirmButtonText,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DialogHeader(title: title),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(
                    color: Color.fromARGB(255, 209, 213, 218)
                )),
              ),
              child: Text(message,
                textAlign: TextAlign.center,
              ),
            ),
            DialogFooter(
              confirmButtonText: confirmButtonText,
            )
          ]),
    );
  }
}
