import 'package:flutter/material.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';

class RangeSliderWithInput extends StatefulWidget {
  const RangeSliderWithInput({
    required this.label,
    required this.min,
    required this.max,
    required this.currentMin,
    required this.currentMax,
    required this.onChanged,
    super.key,
  });
  final String label;
  final double min;
  final double max;
  final double currentMin;
  final double currentMax;
  final Function(double, double) onChanged;

  @override
  State<RangeSliderWithInput> createState() => _RangeSliderWithInputState();
}

class _RangeSliderWithInputState extends State<RangeSliderWithInput> {
  late TextEditingController _minController;
  late TextEditingController _maxController;

  @override
  void initState() {
    super.initState();
    _minController = TextEditingController(
      text: widget.currentMin.toInt().toString(),
    );
    _maxController = TextEditingController(
      text: widget.currentMax.toInt().toString(),
    );
  }

  @override
  void didUpdateWidget(RangeSliderWithInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentMin != double.tryParse(_minController.text)) {
      _minController.text = widget.currentMin.toInt().toString();
    }
    if (widget.currentMax != double.tryParse(_maxController.text)) {
      _maxController.text = widget.currentMax.toInt().toString();
    }
  }

  @override
  void dispose() {
    _minController.dispose();
    _maxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        widget.label,
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 16.h),
      Builder(
        builder: (context) {
          final start = widget.currentMin.clamp(widget.min, widget.max);
          final end = widget.currentMax.clamp(widget.min, widget.max);
          return RangeSlider(
            values: RangeValues(start, end < start ? start : end),
            min: widget.min,
            max: widget.max,
            activeColor: context.colorScheme.primary,
            inactiveColor: context.colorScheme.secondary.withValues(alpha: 0.2),
            onChanged: (values) {
              widget.onChanged(values.start, values.end);
            },
          );
        },
      ),
      Row(
        children: [
          Expanded(
            child: _buildInputField(
              controller: _minController,
              onChanged: (val) {
                if (val.isEmpty) {
                  widget.onChanged(widget.min, widget.currentMax);
                  return;
                }
                final v = double.tryParse(val) ?? widget.min;
                widget.onChanged(v, widget.currentMax);
              },
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: _buildInputField(
              controller: _maxController,
              onChanged: (val) {
                if (val.isEmpty) {
                  widget.onChanged(widget.currentMin, widget.max);
                  return;
                }
                final v = double.tryParse(val) ?? widget.max;
                widget.onChanged(widget.currentMin, v);
              },
            ),
          ),
        ],
      ),
    ],
  );

  Widget _buildInputField({
    required TextEditingController controller,
    required Function(String) onChanged,
  }) => TextField(
    controller: controller,
    keyboardType: TextInputType.number,
    onChanged: onChanged,
    textAlign: TextAlign.center,
    style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
    decoration: const InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.zero,
    ),
  );
}
