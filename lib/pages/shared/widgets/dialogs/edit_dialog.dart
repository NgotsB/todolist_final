import 'package:flutter/material.dart';
import '../forms/form_input.dart';
import 'dialog_footer.dart';
import 'dialog_header.dart';

class EditDialog extends StatelessWidget {

  final String title;
  final String label;
  final TextEditingController controller;
  final bool isLoading;

  const EditDialog({
    required this.title,
    required this.label,
    required this.controller,
    required this.isLoading,
    Key? key}) : super(key: key);

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
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: Color.fromARGB(255, 209, 213, 218)
                    )
                ),
              ),
              child: Column(
                children: [
                  FormInput(
                    controller: controller,
                    inputType: TextInputType.text,
                    labelText: label,
                    prefixIcon: null,
                    enabled: !isLoading,
                    autoFocus: true,
                    marginBottom: 15,
                    radius: 10,
                    validator: (value) => value == "" ? "Invalid $label" : null,
                  ),
                ],
              )
          ),
          const DialogFooter(
            confirmButtonText: "Edit",
          )
        ],
      ),
    );
  }
}
