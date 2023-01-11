import 'package:ardram/global/app_colors.dart';
import 'package:ardram/global/text_styles.dart';
import 'package:ardram/payment%20options/controller/payment_option.dart';
import 'package:ardram/storage/ardram_local_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FineModelClass{
  bool checkFlag;
  String fineName;
  FineModelClass({required this.checkFlag,required this.fineName});
}
enum PaymentPeriod{
  monthly,quarterly,halfYearly,yearly
}

class PaymentOptionSelector extends StatelessWidget {
const PaymentOptionSelector({super.key ,required this.indexVal,required this.periods,required this.selectedPeriodSp});

final PaymentPeriod periods;
final dynamic selectedPeriodSp;
// final bool? value;

final int indexVal;



  @override
  Widget build(BuildContext context) {
    return  Consumer<PaymentOption>(
      builder: (context,myModel,_) {
        
        return Container(
          decoration: BoxDecoration(color:const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1,color: Colors.white)
          ),
          padding:const EdgeInsets.only(top: 10,bottom: 10),
          margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
          child: ListTile(
            leading:Radio(
              value: indexVal,
              groupValue: myModel.selectedService?? selectedPeriodSp,
              onChanged:(val)async{
                myModel.changeSelectedService(val);
                myModel.changeSelectedAmount(periodAmount(periods)); 
                await ArdramLocalStorage.setSelectedPeriod(int.parse(val.toString()));
              } ,
              activeColor: ardramTextColor,
            ),
            //  Checkbox(
            //         side: const BorderSide(color: Colors.black),
            //         value: value,
            //         onChanged:valFnc,
            //       ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      
                        period(periods),
                        style:caption,
                      ),
                    Text(
                      
                        periodAmount(periods).toString(),
                        style:caption,
                      ),
                  ],
                ),
                  
            
          ),
        );
      }
    );
    
    
  }
  String period(value){
    String val='';
    switch(value){
   case PaymentPeriod.yearly:
   val = "Yearly";
   break;
   case PaymentPeriod.monthly:
   val = "Monthly";
   break;
   case PaymentPeriod.quarterly:
   val = "Quarterly";
   break;
   case PaymentPeriod.halfYearly:
   val = "Half Yearly";
   break;
   
    }
    return val;
  }
  int periodAmount(value){
    int val=0;
    switch(value){
   case PaymentPeriod.yearly:
   val = 6000;
   break;
   case PaymentPeriod.monthly:
   val = 500;
   break;
   case PaymentPeriod.quarterly:
   val = 1500;
   break;
   case PaymentPeriod.halfYearly:
   val = 3000;
   break;
   
    }
    return val;
  }
}