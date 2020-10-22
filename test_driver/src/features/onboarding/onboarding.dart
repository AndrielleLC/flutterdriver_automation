import 'package:flutter_driver/flutter_driver.dart';
import 'onboarding_element_map.dart';


class Onboarding extends OnboardingElementMap{
  FlutterDriver _driver;

  Onboarding(FlutterDriver driver){
    this._driver = driver; 
  }

  Future<void> inputEmailIsPresent() async{
    return _driver.waitFor(inputEmail);
  }

  Future<void> inputPasswordIsPresent() async{
    return _driver.waitFor(inputPassword);
  }

  Future clickEmailField() async {
    return _driver.tap(inputEmail);
  }

  Future clickPasswordField() async {
    return _driver.tap(inputPassword);
  }

  Future<void> fillEmail() async{
    return _driver.enterText('youremail@gmail.com');
  }

  Future<void> fillPassword() async{
    return _driver.enterText('somewrongpassword@');
  }

  Future clickBtnLogin() async {
    return _driver.tap(loginBtn);
  }

  Future<String> getHomeTitle() async {
    return _driver.getText(homeTitle);
  }
}

