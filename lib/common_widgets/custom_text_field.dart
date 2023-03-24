import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required TextEditingController controller,
      required this.size,
      this.hintText,
      this.enabled = true,
      this.validator})
      : _nameController = controller,
        super(key: key);

  final TextEditingController _nameController;
  final Size size;
  final String? hintText;
  final enabled;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _nameController,
      validator: (v) {
        if (v!.isEmpty) {
          return "This field is required.";
        }

        return null;
      },
      enabled: enabled,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.all(size.width * 0.04),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.width * 0.02),
            borderSide: BorderSide(width: 1.5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.width * 0.02),
            borderSide: BorderSide(width: 1.5)),
        disabledBorder: InputBorder.none,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.width * 0.02),
            borderSide: BorderSide(width: 1.5)),
      ),
    );
  }
}
