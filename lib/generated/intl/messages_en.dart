// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "cantSeeCountry": MessageLookupByLibrary.simpleMessage(
            "Can’t see the country of your interest?"),
        "consultWithUs":
            MessageLookupByLibrary.simpleMessage("Consult with us"),
        "deleteUser": MessageLookupByLibrary.simpleMessage("Delete User"),
        "logOut": MessageLookupByLibrary.simpleMessage("Logout"),
        "noInternetConnection":
            MessageLookupByLibrary.simpleMessage("No internet connection."),
        "oopsNoResultsFound":
            MessageLookupByLibrary.simpleMessage("Oops, No results found!"),
        "oopsSomethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Oops Something went wrong"),
        "proceed": MessageLookupByLibrary.simpleMessage("Proceed"),
        "selectCountry": MessageLookupByLibrary.simpleMessage("Select Country"),
        "selectCountryDes": MessageLookupByLibrary.simpleMessage(
            "Please select the country where\nyou want to study"),
        "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
            "Something went wrong! Please try after some time."),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome")
      };
}
