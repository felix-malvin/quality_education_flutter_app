import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar.dart';
import 'package:quality_education_app/models/payment_method_model.dart';
import 'package:quality_education_app/commons/color.dart';

class PaymentMethodPage extends StatefulWidget {
  final PaymentMethod selectedMethod;
  const PaymentMethodPage({required this.selectedMethod});

  @override
  _PaymentMethodPage createState() => _PaymentMethodPage();
}

class _PaymentMethodPage extends State<PaymentMethodPage> {
  late PaymentMethod _selected;

  final List EMoney = [
    PaymentMethod(name: "OVO", imagePath: "assets/ovo_logo.png"),
    PaymentMethod(name: "Gopay", imagePath: "assets/gopay_logo.png"),
  ];

  void _selectMethod(PaymentMethod method) {
    setState(() {
      _selected = method;
    });
  }

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedMethod;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: CustomAppBar(title: 'Payment Method'),
      body: Column(
        children: [
          SizedBox(height: 10),
          _buildEMoneyPaymentSection(),
        ],
      ),
    );
  }

  Widget _buildEMoneyPaymentSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'E-Money',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF2E2E2E),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: CustomColors.white,
              border: Border.all(color: Color(0xFFE6E6E6)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: List.generate(EMoney.length, (index) {
                final method = EMoney[index];
                final isLast = index == EMoney.length - 1;

                return Container(
                  decoration: BoxDecoration(
                    border:
                        isLast
                            ? null
                            : Border(
                              bottom: BorderSide(color: Color(0xFFE6E6E6)),
                            ),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 3,
                      horizontal: 10,
                    ),
                    leading: Image.asset(method.imagePath, width: 30),
                    title: Text(
                      method.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.secondaryText,
                      ),
                    ),
                    trailing: Transform.scale(
                      scale: 1.5,
                      child: Radio<PaymentMethod>(
                        value: method,
                        groupValue: _selected,
                        onChanged: (PaymentMethod? value) {
                          if (value != null) {
                            setState(() {
                              _selected = value;
                            });
                            Navigator.pop(context, value);
                          }
                        },
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _selected = method;
                      });
                      Navigator.pop(context, method);
                    },
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

}
