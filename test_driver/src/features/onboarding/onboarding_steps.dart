import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import 'onboarding.dart';

class InitialState extends GivenWithWorld<FlutterWorld> {
  InitialState()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));
  @override
  Future<void> executeStep() async {
    Onboarding onboarding = Onboarding(world.driver);
  }
  @override
  RegExp get pattern => RegExp(r"I started the app");
}

class CheckWidgets extends ThenWithWorld<FlutterWorld> {
  CheckWidgets() : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));
  @override
  Future<void> executeStep() async {
    Onboarding onboarding = Onboarding(world.driver);
    await onboarding.inputEmailIsPresent();
    await onboarding.inputPasswordIsPresent();
  }
  @override
  RegExp get pattern => RegExp(r"I have the email field, password field and the login button");
}

class FillFields extends AndWithWorld<FlutterWorld>{
  FillFields() : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));
  @override
  Future<void> executeStep() async{
    Onboarding onboarding = Onboarding(world.driver);
    await onboarding.clickEmailField();
    await onboarding.fillEmail();
    await onboarding.clickPasswordField();
    await onboarding.fillPassword();
  }

  @override
  RegExp get pattern => RegExp(r"I fill the email field and the password field");
}

class ClickLoginButton extends WhenWithWorld<FlutterWorld> {
  ClickLoginButton(): super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));
  @override
  Future<void> executeStep() async {
    Onboarding onboarding = Onboarding(world.driver);
    await onboarding.clickBtnLogin();
  }
  @override
  RegExp get pattern => RegExp(r"I tap the login button");
}

class CheckHomeTitle extends Then1WithWorld<String, FlutterWorld>{
  CheckHomeTitle() : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));
  @override
  Future<void> executeStep(String value) async {
    Onboarding onboarding = Onboarding(world.driver);
    expectMatch(await onboarding.getHomeTitle(), value);
}
  @override
  RegExp get pattern => RegExp(r"I see the product list called as {string}");
}


  