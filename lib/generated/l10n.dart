// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Str {
  Str();

  static Str? _current;

  static Str get current {
    assert(_current != null,
        'No instance of Str was loaded. Try to initialize the Str delegate before accessing Str.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Str> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Str();
      Str._current = instance;

      return instance;
    });
  }

  static Str of(BuildContext context) {
    final instance = Str.maybeOf(context);
    assert(instance != null,
        'No instance of Str present in the widget tree. Did you add Str.delegate in localizationsDelegates?');
    return instance!;
  }

  static Str? maybeOf(BuildContext context) {
    return Localizations.of<Str>(context, Str);
  }

  /// `No internet connection.`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection.',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `No data found!`
  String get noDataFound {
    return Intl.message(
      'No data found!',
      name: 'noDataFound',
      desc: '',
      args: [],
    );
  }

  /// `Oops Something went wrong`
  String get oopsSomethingWentWrong {
    return Intl.message(
      'Oops Something went wrong',
      name: 'oopsSomethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Oops, No results found!`
  String get oopsNoResultsFound {
    return Intl.message(
      'Oops, No results found!',
      name: 'oopsNoResultsFound',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong! Please try after some time.`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong! Please try after some time.',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logOut {
    return Intl.message(
      'Logout',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get selectCountry {
    return Intl.message(
      'Select Country',
      name: 'selectCountry',
      desc: '',
      args: [],
    );
  }

  /// `Please select the country where\nyou want to study`
  String get selectCountryDes {
    return Intl.message(
      'Please select the country where\nyou want to study',
      name: 'selectCountryDes',
      desc: '',
      args: [],
    );
  }

  /// `Proceed`
  String get proceed {
    return Intl.message(
      'Proceed',
      name: 'proceed',
      desc: '',
      args: [],
    );
  }

  /// `Can’t see the country of your interest?`
  String get cantSeeCountry {
    return Intl.message(
      'Can’t see the country of your interest?',
      name: 'cantSeeCountry',
      desc: '',
      args: [],
    );
  }

  /// `Consult with us`
  String get consultWithUs {
    return Intl.message(
      'Consult with us',
      name: 'consultWithUs',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Delete User`
  String get deleteUser {
    return Intl.message(
      'Delete User',
      name: 'deleteUser',
      desc: '',
      args: [],
    );
  }

  /// `Error fetching country data`
  String get errorCountry {
    return Intl.message(
      'Error fetching country data',
      name: 'errorCountry',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Study Lancer`
  String get startUpTitle {
    return Intl.message(
      'Welcome to Study Lancer',
      name: 'startUpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please select your role to get registered`
  String get startUpDes {
    return Intl.message(
      'Please select your role to get registered',
      name: 'startUpDes',
      desc: '',
      args: [],
    );
  }

  /// `Student`
  String get student {
    return Intl.message(
      'Student',
      name: 'student',
      desc: '',
      args: [],
    );
  }

  /// `Agent`
  String get agent {
    return Intl.message(
      'Agent',
      name: 'agent',
      desc: '',
      args: [],
    );
  }

  /// `By continuing you agree to our\t`
  String get startUpFooter {
    return Intl.message(
      'By continuing you agree to our\t',
      name: 'startUpFooter',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get termsNCondition {
    return Intl.message(
      'Terms and Conditions',
      name: 'termsNCondition',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get termsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `Update 16/03/2023`
  String get updatedTermsDate {
    return Intl.message(
      'Update 16/03/2023',
      name: 'updatedTermsDate',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `At studylancer, accessible from studylancer.com, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by studylancer and how we use it. If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us. This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in studylancer. This policy is not applicable to any information collected offline or via channels other than this website.`
  String get privacyPolicyDes {
    return Intl.message(
      'At studylancer, accessible from studylancer.com, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by studylancer and how we use it. If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us. This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in studylancer. This policy is not applicable to any information collected offline or via channels other than this website.',
      name: 'privacyPolicyDes',
      desc: '',
      args: [],
    );
  }

  /// `Consent`
  String get consent {
    return Intl.message(
      'Consent',
      name: 'consent',
      desc: '',
      args: [],
    );
  }

  /// `By using our website, you hereby consent to our Privacy Policy and agree to its terms.`
  String get consentDes {
    return Intl.message(
      'By using our website, you hereby consent to our Privacy Policy and agree to its terms.',
      name: 'consentDes',
      desc: '',
      args: [],
    );
  }

  /// `Information we collect`
  String get informationWeCollect {
    return Intl.message(
      'Information we collect',
      name: 'informationWeCollect',
      desc: '',
      args: [],
    );
  }

  /// `The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information. If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide. When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.`
  String get informationWeCollectDes {
    return Intl.message(
      'The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information. If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide. When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.',
      name: 'informationWeCollectDes',
      desc: '',
      args: [],
    );
  }

  /// `Select your country`
  String get selectYourCountry {
    return Intl.message(
      'Select your country',
      name: 'selectYourCountry',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter phone number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your 10 digit mobile\nnumber to receive OTP`
  String get enterPhoneNumberDes {
    return Intl.message(
      'Please enter your 10 digit mobile\nnumber to receive OTP',
      name: 'enterPhoneNumberDes',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid mobile number`
  String get enterPhoneNumberError {
    return Intl.message(
      'Please enter a valid mobile number',
      name: 'enterPhoneNumberError',
      desc: '',
      args: [],
    );
  }

  /// `Get OTP`
  String get getOTP {
    return Intl.message(
      'Get OTP',
      name: 'getOTP',
      desc: '',
      args: [],
    );
  }

  /// `Verify Number`
  String get verifyNumber {
    return Intl.message(
      'Verify Number',
      name: 'verifyNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the OTP received to\nverify your number`
  String get verifyNumberDes {
    return Intl.message(
      'Please enter the OTP received to\nverify your number',
      name: 'verifyNumberDes',
      desc: '',
      args: [],
    );
  }

  /// `OTP does not match, please try again`
  String get verifyNumberError {
    return Intl.message(
      'OTP does not match, please try again',
      name: 'verifyNumberError',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'didNotReceiveOTP?' key

  /// `Resend OTP`
  String get resendOTP {
    return Intl.message(
      'Resend OTP',
      name: 'resendOTP',
      desc: '',
      args: [],
    );
  }

  /// `Resending OTP in 10 seconds`
  String get resendOtp {
    return Intl.message(
      'Resending OTP in 10 seconds',
      name: 'resendOtp',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Str> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Str> load(Locale locale) => Str.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
