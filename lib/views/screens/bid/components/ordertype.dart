import 'package:flutter/material.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:opal_user_app/utils/helper/helper.dart';
import 'package:opal_user_app/views/screens/bid/components/stepspagewidget.dart';

class OrderTypeSelector extends StatefulWidget {
  @override
  _OrderTypeSelectorState createState() => _OrderTypeSelectorState();
}

class _OrderTypeSelectorState extends State<OrderTypeSelector> {
  String _selectedOrderType = 'Fixed Price';
  final TextEditingController _bidPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildOrderTypeButton(context, 'Fixed Price'),
            _buildOrderTypeButton(context, 'Bid'),
            // _buildOrderTypeButton(context, 'Urgent'),
          ],
        ),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: _selectedOrderType == 'Fixed Price'
              ? Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: buildTextField(
                    hint: 'Enter your price in OMR',
                    controller: TextEditingController(),
                  ),
                )
              : SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildOrderTypeButton(BuildContext context, String type) {
    bool isSelected = _selectedOrderType == type;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOrderType = type;
        });
      },
      child: Container(
        width: ScreenSize.screenWidth(context) * 0.35,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor.withOpacity(0.2)
              : Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            type,
            style: TextStyle(
              color: isSelected ? AppColors.primaryColor : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
