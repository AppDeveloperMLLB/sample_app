import 'package:flutter/material.dart';

class AppDropdownMenuField<T> extends StatelessWidget {
  const AppDropdownMenuField({
    super.key,
    required this.menuList,
    this.initialSelection,
    required this.fieldKey,
    required this.label,
    this.hint,
    required this.getDisplayLabel,
    this.validator,
  });
  final List<T> menuList;
  final T? initialSelection;
  final GlobalKey<FormFieldState<T>> fieldKey;
  final String label;
  final String? hint;
  final String? Function(T?)? validator;
  // 項目の表示名を取得するメソッドを使用する側から指定できるようにしています
  // これで柔軟に表示名を変更できます
  final String Function(T) getDisplayLabel;

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      key: fieldKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: initialSelection,
      builder: (state) {
        return DropdownMenu<T>(
          initialSelection: initialSelection,
          width: double.infinity,
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: state.hasError ? Colors.red : Colors.black,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 1,
              ),
            ),
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black26,
                ),
          ),
          requestFocusOnTap: true,
          errorText: state.errorText,
          label: Text(label),
          hintText: hint,
          onSelected: (T? value) {
            if (value == null) {
              return;
            }

            state.didChange(value);
          },
          dropdownMenuEntries: menuList.map<DropdownMenuEntry<T>>((T e) {
            return DropdownMenuEntry<T>(
              value: e,
              label: getDisplayLabel(e),
            );
          }).toList(),
        );
      },
      validator: validator,
    );
  }
}
