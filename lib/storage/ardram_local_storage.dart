import 'package:shared_preferences/shared_preferences.dart';

class ArdramLocalStorage{

 static late SharedPreferences preferences;

static Future initStorage()async=>
    preferences = await SharedPreferences.getInstance();

static Future setSelectedPeriod(int period)async =>await preferences.setInt('SelectedPeriod', period);
static Future setLoggedIn(bool period)async =>await preferences.setBool('isLogin', period);
static Future setSelectedAmount(int amount)async => await preferences.setInt('Period', amount);
static Future setCustomerId(String customerId)async => await preferences.setString('CustomerId', customerId);
static Future setUserName(String userName)async => await preferences.setString('userName', userName);
static Future setUserPhone(String userPhone)async => await preferences.setString('userPhone', userPhone);

static int? getSelectedPeriod()=>preferences.getInt('SelectedPeriod');
static int? getSLoggedIn()=>preferences.getInt('isLogin');
static int? getSelectedAmount()=>preferences.getInt('Period');
static String? getCustomerId()=>preferences.getString('CustomerId');
static String? getUserName()=>preferences.getString('userName');
static String? getUserPhone()=>preferences.getString('userPhone');

                          // pref.setInt('Period', myModel.selectedAmount);



 
}