import 'dart:developer';

import 'package:ardram/Notifications/controller/notification_controller.dart';
import 'package:ardram/global/Button/ardram_button.dart';
import 'package:ardram/payment%20options/controller/payment_option.dart';
import 'package:ardram/payment%20options/model/peyment_option_model.dart';
import 'package:ardram/payment%20options/widgets/about_service_card.dart';
import 'package:ardram/payment%20options/widgets/payment_option.dart';
import 'package:ardram/storage/ardram_local_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key, this.forOnlinePayment = true,this.userSelectedPeriod=''});
  final bool forOnlinePayment;
  final dynamic userSelectedPeriod;
  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  List<PaymentOptionModel> payOptions = [
    PaymentOptionModel(period: PaymentPeriod.monthly, selectedPeriod: 0),
    PaymentOptionModel(period: PaymentPeriod.quarterly, selectedPeriod: 0),
    PaymentOptionModel(period: PaymentPeriod.halfYearly, selectedPeriod: 0),
    PaymentOptionModel(period: PaymentPeriod.yearly, selectedPeriod: 0),
  ];
  dynamic selectedPeriod;
  final _razorpay = Razorpay();
  @override
  void initState() {
    super.initState();
    selectedPeriod = ArdramLocalStorage.getSelectedPeriod();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }


  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Do something when payment succeeds
    final selectedAmount = Provider.of<PaymentOption>(context).selectedAmount;
    final pref = await SharedPreferences.getInstance();
    String? dateTime = pref.getString('dateTime');
    DateTime dateTimeNew = DateTime.parse(dateTime!);

    NotificationController.showNotification(
        verification:
            "Ardram ${getDateTime(selectedAmount, dateTimeNew)!.year}${getDateTime(selectedAmount, dateTimeNew)!.month}",
        body: 'Hello this is the time for pay the due',
        id: 1,
        title:
            "Ardram ${getDateTime(selectedAmount, dateTimeNew)!.year}${getDateTime(selectedAmount, dateTimeNew)!.month}",
        payload: selectedAmount,
        scheduleDate: getDateTime(selectedAmount, dateTimeNew)!);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  log(response.message.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  log(response.toString());

  }
  // 'key': 'rzp_test_hO0gujMeqHltNS',

  void openCheckout(
   {required int? amount,}
  ) async {

log(amount.toString());
    var options = {
      'key': 'rzp_live_odrmJ2TVl6Ux2P',
      'amount': amount==null?500*100:amount*100,
      'name': 'ആര്‍ദ്രം',
      'description': 'Charity Trust..',
      'currency': 'INR',
      'timeout': 60,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '9544787977', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm', 'freecharge'],
        'cards': ['mastercard']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return onlinePayment();
  }

  Scaffold onlinePayment() => Scaffold(
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
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AboutArdramCard(),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return PaymentOptionSelector(
                      selectedPeriodSp: widget.userSelectedPeriod==''? selectedPeriod:widget.userSelectedPeriod,
                      indexVal: index,
                      periods: payOptions[index].period,
                      // selectedValue: myModel.selectedService,
                    );
                  }),
              widget.forOnlinePayment
                  ? Consumer<PaymentOption>(builder: (context, myModel, _) {
                      return ArdramButton(
                        context: context,
                        onTap: ()async {
                          openCheckout(amount:amountChecking( myModel.selectedAmount));
                          await ArdramLocalStorage.setSelectedAmount(myModel.selectedAmount);

                        },
                        buttonText: "Pay",
                      );
                    })
                  : Consumer<PaymentOption>(builder: (context, myModel, _) {
                      return ArdramButton(
                        context: context,
                        onTap: () async {
                          final pref = await SharedPreferences.getInstance();
                          
                          log(myModel.selectedAmount.toString());
                          await ArdramLocalStorage.setSelectedAmount(myModel.selectedAmount);
                          String? dateTime = pref.getString('dateTime');
                          if (dateTime != null&&selectedPeriod!=null) {
                            DateTime dateTimeNew = DateTime.parse(dateTime);
                            DateTime currentDate = DateTime.now();
                            log(getDateTime(myModel.selectedAmount, dateTimeNew)
                                .toString());
                            // log('val is null');
                            log('val is not null');
                            getDateTime(myModel.selectedAmount, dateTimeNew) !=
                                    null
                                ? NotificationController.showNotification(
                                    verification:
                                        "Ardram ${getDateTime(myModel.selectedAmount, dateTimeNew)!.year}${getDateTime(myModel.selectedAmount, dateTimeNew)!.month}",
                                    body:
                                        'Hello this is the time for pay the due',
                                    id: 1,
                                    title:
                                        "Ardram ${getDateTime(myModel.selectedAmount, dateTimeNew)!.year}${getDateTime(myModel.selectedAmount, dateTimeNew)!.month}",
                                    payload: myModel.selectedAmount,
                                    scheduleDate: getDateTime(
                                            myModel.selectedAmount,
                                            dateTimeNew) ??
                                        currentDate
                                            .add(const Duration(seconds: 3)))
                                :
                                 NotificationController.showNotification(
                                    
                                    verification: "Hello to every one",
                                    body: "Ardram",
                                    id: 1,
                                    title: "Hello to every one",
                                    payload: 500,
                                    scheduleDate: DateTime.now()
                                        .add(const Duration(seconds: 3)));
                          } else {
                            final pref = await SharedPreferences.getInstance();
                            pref.setInt(
                                'dateTime',
                                int.parse(DateTime.now()
                                    .add(const Duration(seconds: 3))
                                    .toString()));
                            NotificationController.showNotification(
                                verification: "Hello to every one",
                                body: "Ardram",
                                id: 1,
                                title: "Hello to every one",
                                payload: 500,
                                scheduleDate: DateTime.now()
                                    .add(const Duration(seconds: 3)));
                          }
                        },
                        buttonText: "Save",
                      );
                    }),
            ],
          ),
        ),
      );

  DateTime? getDateTime(
    int selectedAmount,
    DateTime selectedDateTime,
  ) {
    dynamic dateTime;
    switch (selectedAmount) {
    }

    switch (selectedAmount) {
      case 6000:
        dateTime = selectedDateTime.add(const Duration(days: 360));
        break;
      case 3000:
        dateTime = selectedDateTime.add(const Duration(days: 180));
        break;
      case 1500:
        dateTime = selectedDateTime.add(const Duration(seconds: 90));
        break;
      case 500:
        dateTime = selectedDateTime.add(const Duration(seconds: 30));
        break;
    }

    return dateTime;
    // if(selectedAmount==6000){
    //   return selectedDateTime.add(const Duration(days: 360));
    // }
    // else if(selectedAmount==1500){
    //   return selectedDateTime.add(const Duration(days: 90));
    // }
    // else if(selectedAmount==3000){
    //   return  selectedDateTime.add(const Duration(days: 180));
    // }
    // else{
    //   dateTime =selectedDateTime.add(const Duration(days: 30));
    //   return dateTime;
    // }
  }


  int? amountChecking(providerModel){
    int? amount= ArdramLocalStorage.getSelectedAmount();
  log('from amount check ${amount.toString()}');
  if(providerModel==0&&amount==0){
    log('from 500');
    return 500;
  }
  else if(providerModel!=0&&amount!=0){
    log('from provider model$providerModel');

    return providerModel;
  }
  else if(providerModel==0&&amount!=0){
    log('from provider amount$amount');
    Provider.of<PaymentOption>(context,listen: false).changeSelectedAmount(amount!);

    return amount;
  }
  return providerModel;
 
  }
}
