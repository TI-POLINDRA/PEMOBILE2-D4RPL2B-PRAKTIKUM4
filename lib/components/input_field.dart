import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomEmailInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final EdgeInsets padding;

  const CustomEmailInput({
    super.key,
    required this.controller,
    required this.hintText,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: padding,
      ),
    );
  }
}

class CustomPasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final EdgeInsets padding;

  const CustomPasswordInput(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.padding});

  @override
  State<CustomPasswordInput> createState() => _CustomPasswordInputState();
}

class _CustomPasswordInputState extends State<CustomPasswordInput> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _isObscure,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: widget.padding,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
            color: Colors.grey,
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
        ),
      ),
    );
  }
}
