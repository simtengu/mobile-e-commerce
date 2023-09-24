import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/horizontal_spacing.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:flutter/material.dart';

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({super.key});
  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  double _minValue = 0;
  double _maxValue = 100;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeSlider(
          divisions: 100,
          labels: RangeLabels("${_minValue.toInt()}", "${_maxValue.toInt()}"),
          activeColor: Pallete.primary.withOpacity(0.7),
          values: RangeValues(_minValue, _maxValue),
          min: 0,
          max: 1000, // Set the maximum price value
          onChanged: (RangeValues values) {
            setState(() {
              _minValue = values.start;
              _maxValue = values.end;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Pallete.primaryLight.withOpacity(0.7),
                borderRadius: BorderRadius.circular(9),
              ),
              child: body1('\$${_minValue.toInt()}',
                  customStyle: const TextStyle(color: Colors.black)),
            ),
            hSpacing(11),
            Text(
              'To',
              style: TextStyle(
                  color: Pallete.secondary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            hSpacing(11),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Pallete.primaryLight.withOpacity(0.7),
                borderRadius: BorderRadius.circular(9),
              ),
              child: body1('\$${_maxValue.toInt()}',
                  customStyle: const TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ],
    );
  }
}
