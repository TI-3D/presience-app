import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/form/label.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool? isOptional;
  final String? errorMessage;
  final bool? isMultiline;
  final bool? readonly;
  final bool? readonlyFilled;
  final Widget? suffix;
  // final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final GestureTapCallback? onTap;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.isOptional,
    this.errorMessage,
    this.isMultiline = false,
    // required this.onChanged,
    this.controller,
    this.readonly = false,
    this.readonlyFilled = false,
    this.suffix,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (isMultiline == false) ? 106 : 154,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldLabel(label: label, isOptional: isOptional),
          const SizedBox(
            height: 8,
          ),
          TextField(
            keyboardType: (isMultiline == false)
                ? TextInputType.text
                : TextInputType.multiline,
            maxLines: (isMultiline == false) ? 1 : 3,
            controller: controller,
            decoration: InputDecoration(
                // Focused
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: blackTheme),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: blackTheme),
                    borderRadius: BorderRadius.all(Radius.circular(8))),

                // Enabled
                hintText: hint,
                hintStyle: mediumBodyText.copyWith(
                    color: readonlyFilled! ? blackTheme : neutralTheme[200]),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 13.5),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: errorMessage != null
                            ? redTheme
                            : neutralTheme[200]!),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: blackTheme),
                    borderRadius: BorderRadius.all(Radius.circular(8))),

                // Error
                errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: redTheme),
                    borderRadius: BorderRadius.all(Radius.circular(8))),

                // Suffix Icon
                suffixIcon: suffix),
            readOnly: readonly!,
            style: mediumBodyText,
            onTap: onTap,
          ),
          if (errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                errorMessage!,
                style: mediumBodyTextS.copyWith(color: redTheme),
              ),
            ),
        ],
      ),
    );
  }
}

class CustomPasswordField extends StatefulWidget {
  final String label;
  final String hint;
  final bool? isOptional;
  final String? errorMessage;
  // final ValueChanged<String> onChanged;
  final TextEditingController? controller;

  const CustomPasswordField({
    super.key,
    required this.label,
    required this.hint,
    this.isOptional,
    this.errorMessage,
    // required this.onChanged,
    this.controller,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 106,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldLabel(label: widget.label, isOptional: widget.isOptional),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: widget.controller,
            obscureText: _isObscured,
            decoration: InputDecoration(
              // Focused
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: blackTheme),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: blackTheme),
                  borderRadius: BorderRadius.all(Radius.circular(8))),

              // Enabled
              hintText: widget.hint,
              hintStyle: mediumBodyText.copyWith(color: neutralTheme[200]),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 13.5),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color: widget.errorMessage != null
                          ? redTheme
                          : neutralTheme[200]!),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: blackTheme),
                  borderRadius: BorderRadius.all(Radius.circular(8))),

              // Error
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: redTheme),
                  borderRadius: BorderRadius.all(Radius.circular(8))),

              // Password
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscured ? TablerIcons.eye : TablerIcons.eye_off,
                  color: blackTheme,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured; // Toggle password visibility
                  });
                },
              ),
            ),
            style: mediumBodyText,
          ),
          if (widget.errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                widget.errorMessage!,
                style: mediumBodyTextS.copyWith(color: redTheme),
              ),
            ),
        ],
      ),
    );
  }
}
