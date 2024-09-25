import 'package:flutter/material.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:mysam_app/core/resources/style/style.dart';
import 'package:mysam_app/core/widgets/components/custom_text.dart';
import 'package:playx/playx.dart';

class FilterChipSelector<T> extends StatefulWidget {
  final List<T> items;
  final T selectedItem;
  final String Function(T item) itemLabel;
  final Function(T item) onSelectedItemChanged;

  const FilterChipSelector({
    required this.items,
    required this.selectedItem,
    required this.itemLabel,
    required this.onSelectedItemChanged,
  });

  @override
  State<FilterChipSelector<T>> createState() => _FilterChipSelectorState<T>();
}

class _FilterChipSelectorState<T> extends State<FilterChipSelector<T>> {
  late T currentSelectedItem;

  @override
  void initState() {
    super.initState();
    currentSelectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    if (currentSelectedItem != widget.selectedItem) {
      currentSelectedItem = widget.selectedItem;
    }
    return Container(
      width: double.infinity,
      padding: Style.mediumPadding,
      child: Wrap(
        spacing: 16.r,
        alignment: WrapAlignment.center,
        children: List.generate(widget.items.length, (index) {
          final item = widget.items[index];
          return _buildChip(
            label: widget.itemLabel(item),
            isSelected: currentSelectedItem == item,
            onTap: () {
              setState(() {
                currentSelectedItem = item;
              });
              widget.onSelectedItemChanged(item);
            },
          );
        }),
      ),
    );
  }

  Widget _buildChip({
    required String label,
    required VoidCallback onTap,
    bool isSelected = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: Style.featureChipBorderRadius,
      child: Chip(
        label: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0.r,
          ),
          child: isSelected
              ? CustomText(
                  label,
                  color: context.colors.onPrimary,
                  fontSize: 14.sp,
                )
              : CustomText(
                  label,
                  color: context.colors.onSurface,
                  fontSize: 14.sp,
                ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: Style.featureChipBorderRadius,
          side: BorderSide(
            color:
                isSelected ? context.colors.surface : context.colors.onSurface,
          ),
        ),
        backgroundColor:
            isSelected ? context.colors.onSurface : context.colors.surface,
      ),
    );
  }
}
