import 'package:flutter/material.dart';

class AppSelectDateField extends StatelessWidget {
  const AppSelectDateField({
    super.key,
    this.fieldKey,
    this.label,
    this.initialValue,
    this.validator,
  });

  final GlobalKey<FormFieldState<DateTime>>? fieldKey;
  final String? label;
  final DateTime? initialValue;
  final String? Function(DateTime?)? validator;

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      key: fieldKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (state) {
        return OutlinedButton(
          onPressed: () async {
            final selectedDate = await showDatePicker(
              context: context,
              firstDate: DateTime(
                1900,
                1,
                1,
              ),
              lastDate: DateTime(
                3000,
                1,
                1,
              ),
            );

            // 未選択状態は無視するようにしています
            // ここは要件に応じて変更が必要です
            if (selectedDate == null) {
              return;
            }

            state.didChange(selectedDate);
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: state.hasError ? Colors.red : Colors.black,
            side: BorderSide(
              color: state.hasError ? Colors.red : Colors.black,
              width: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                state.value?.toString() ?? "日付を選択",
              ),
            ),
          ),
        );
      },
      initialValue: initialValue,
      validator: validator,
    );
  }
}
