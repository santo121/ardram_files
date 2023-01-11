import 'package:ardram/payment%20history/widget/payment_widget.dart';
import 'package:flutter/material.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({super.key});

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
       
        title: const Text(
          "Ardram",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ))
        ],
        
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          paymentMSGWidget(context),
          paymentMSGWidget(context),
          paymentMSGWidget(context),
          paymentMSGWidget(context),
        ],
      ),
    );
  }
}