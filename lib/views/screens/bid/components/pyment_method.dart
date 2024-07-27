import 'package:flutter/material.dart';
import 'package:opal_user_app/config/asset_paths.dart';
import 'package:opal_user_app/utils/helper/helper.dart';
import 'package:opal_user_app/views/widgets/icon_widget.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String _selectedPaymentMethod = 'Cash';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedPaymentMethod = 'Cash';
              });
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      _selectedPaymentMethod == 'Cash' ? Colors.red : Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  IconWidget(                                  isbgColor: true,

                      bgColor: _selectedPaymentMethod == 'Cash'
                          ? Colors.red
                          : Colors.black,
                      iconPath: AssetPaths.cashSvg),
                                          SizedBox(width: 15,),
      
                  const Text('Cash'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedPaymentMethod = 'Card';
              });
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      _selectedPaymentMethod == 'Card' ? Colors.red : Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  IconWidget(
                    isbgColor: true,
                      bgColor: _selectedPaymentMethod == 'Card'
                          ? Colors.red
                          : Colors.black,
                      iconPath: AssetPaths.cardSvg),
                      SizedBox(width: 15,),
                  const Text('Card'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
