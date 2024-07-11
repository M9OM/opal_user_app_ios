import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodsPage extends StatefulWidget {
  @override
  _PaymentMethodsPageState createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  List<Map<String, dynamic>> paymentMethods = [
    {
      'type': 'Visa',
      'lastDigits': '7830',
      'expiryDate': '06/24',
      'isDefault': true,
      'icon': 'assets/icon/cc-visa.svg',
    },
    {
      'type': 'Visa',
      'lastDigits': '5775',
      'expiryDate': '06/24',
      'isDefault': false,
      'icon': 'assets/icon/cc-visa.svg',
    },
  ];

  void _setDefaultPaymentMethod(int index) {
    setState(() {
      for (int i = 0; i < paymentMethods.length; i++) {
        paymentMethods[i]['isDefault'] = i == index;
      }
    });
  }

  void _deletePaymentMethod(int index) {
    setState(() {
      paymentMethods.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Information'),
      ),
      body: ListView.builder(
        itemCount: paymentMethods.length,
        itemBuilder: (context, index) {
          final paymentMethod = paymentMethods[index];
          return ListTile(
            shape: Border(
                bottom:
                    BorderSide(width: 1, color: Colors.grey.withOpacity(0.4))),
            leading: SvgPicture.asset(paymentMethod['icon'], width: 40),
            title: Text(
                '${paymentMethod['type']} ending in ${paymentMethod['lastDigits']}'),
            subtitle: Text('Exp. date ${paymentMethod['expiryDate']}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (paymentMethod['isDefault'])
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Default',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                else
                  TextButton(
                    onPressed: () => _setDefaultPaymentMethod(index),
                    child: Text('Set as Default'),
                  ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deletePaymentMethod(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add new payment method
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
