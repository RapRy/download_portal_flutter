import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.isPassword,
      required this.currentInput,
      required this.label,
      required this.nextInput,
      required this.disable,
      required this.keyboardType,
      required this.submitForm,
      this.maxLine = 1,
      this.minLine = 1});
  final TextEditingController controller;
  final String label;
  final FocusNode? nextInput;
  final TextInputType keyboardType;
  final bool isPassword;
  final FocusNode currentInput;
  final bool disable;
  final VoidCallback? submitForm;
  final int maxLine;
  final int minLine;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordVisible = true;

  String? handleTextFieldValidate(String? value) {
    if (value!.isEmpty) {
      return "This field is required";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          widget.label,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          maxLines: widget.maxLine,
          minLines: widget.minLine,
          enabled: !widget.disable,
          obscureText: widget.isPassword ? _isPasswordVisible : false,
          validator: (value) => handleTextFieldValidate(value),
          textInputAction: widget.nextInput != null
              ? TextInputAction.next
              : TextInputAction.send,
          focusNode: widget.currentInput,
          onFieldSubmitted: (_) => {
            widget.nextInput != null
                ? FocusScope.of(context).requestFocus(widget.nextInput)
                : widget.submitForm!()
          },
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromRGBO(242, 242, 242, 1),
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(0, 223, 207, 1), width: 1),
                  borderRadius: BorderRadius.circular(5)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(146, 220, 126, 1), width: 1),
                  borderRadius: BorderRadius.circular(5)),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        setState(
                          () => _isPasswordVisible = !_isPasswordVisible,
                        );
                      },
                    )
                  : null),
        ),
      ]),
    );
  }
}
