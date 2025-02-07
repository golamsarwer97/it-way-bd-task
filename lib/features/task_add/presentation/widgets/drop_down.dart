import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_palette.dart';

class DropDown extends StatelessWidget {
  final void Function(String?)? onChanged;
  final List<String> items;
  final String? hintText, selectedItem, title;

  const DropDown({
    super.key,
    this.onChanged,
    required this.items,
    this.hintText,
    this.selectedItem,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderSide: const BorderSide(color: AppPalette.gradient2, width: 3),
      borderRadius: BorderRadius.circular(10),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toString(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 15),
        DropdownSearch<String>(
          popupProps: const PopupProps.menu(
            showSearchBox: false,
            showSelectedItems: true,
          ),
          items: (filter, infiniteScrollProps) =>
              items, // Add your role names here
          decoratorProps: DropDownDecoratorProps(
            decoration: InputDecoration(
              hintText: hintText,
              fillColor: AppPalette.backgroundColor2,
              filled: true,
              errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppPalette.errorColor, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: border,
              focusedBorder: border,
            ),
          ),

          onChanged: onChanged,

          enabled: true,
        ),
      ],
    );
  }
}
