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
    PaymentMethod(name: "Dana", imagePath: "assets/dana_logo.png"),
    PaymentMethod(name: "ShopeePay", imagePath: "assets/shopee_pay_logo.png"),
  ];

  final List CreditCard = [
    PaymentMethod(
      name: "Credit Card",
      imagePath: "assets/credit_card_logo.png",
    ),
  ];

  final List VirtualAccount = [
    PaymentMethod(name: "BCA", imagePath: "assets/bca_logo.png"),
    PaymentMethod(name: "BRI", imagePath: "assets/bri_logo.png"),
    PaymentMethod(name: "Mandiri", imagePath: "assets/mandiri_logo.png"),
    PaymentMethod(name: "BNI", imagePath: "assets/bni_logo.png"),
  ];

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedMethod;
  }

  void _selectMethod(PaymentMethod method) {
    setState(() {
      _selected = method;
    });
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
          SizedBox(height: 15),
          _buildCreditCardPaymentSection(),
          SizedBox(height: 15),
          _buildVirtualAccountPaymentSection(),
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

  Widget _buildCreditCardPaymentSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Credit Card',
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
              children: List.generate(CreditCard.length, (index) {
                final method = CreditCard[index];
                final isLast = index == CreditCard.length - 1;

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

  Widget _buildVirtualAccountPaymentSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Virtual Account',
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
              children: List.generate(VirtualAccount.length, (index) {
                final method = VirtualAccount[index];
                final isLast = index == VirtualAccount.length - 1;

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
