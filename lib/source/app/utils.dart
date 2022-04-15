import 'dart:io';
import 'dart:math';

import 'package:base_flutter/source/app/constants.dart';
import 'package:base_flutter/source/domain/models/device_info.dart';
import 'package:device_info/device_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

Future<DeviceInfo> getDeviceDetails() async {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  String name = 'unkown';
  String identifier = 'unkown';
  String version = 'unkown';
  try {
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      name = build.brand + ' ' + build.model;
      identifier = build.androidId;
      version = build.version.codename;
    } else if (Platform.isIOS) {
      var build = await deviceInfoPlugin.iosInfo;
      name = build.name + ' ' + build.model;
      identifier = build.identifierForVendor;
      version = build.systemVersion;
    }
  } on PlatformException {
    return DeviceInfo(name, identifier, version);
  }

  return DeviceInfo(name, identifier, version);
}

Future<int> getAppBuildNumber() async {
  var _packageInfo = await PackageInfo.fromPlatform();
  try {
    return int.parse(_packageInfo.buildNumber);
  } catch (ex) {
    return 1;
  }
}

Future<String> getBuildName() async {
  var _packageInfo = await PackageInfo.fromPlatform();
  try {
    return _packageInfo.version;
  } catch (ex) {
    return '';
  }
}

Future<String> getAppVersion() async {
  var _buildName = await getBuildName();
  var _env = getEnvironment();

  return '$_buildName $_env';
}

String getEnvironment() {
  var _env = Constants.baseUrl.contains('test') ? 'test' : '';

  return _env;
}

void navigateToLocation(double? lat, double? lng) async {
  var uri = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
  if (await canLaunch(uri.toString())) {
    await launch(uri.toString());
  } else {
    throw 'Could not launch ${uri.toString()}';
  }
}

Future<void> makePhoneCall(String phoneNumber) async {
  canLaunch('tel:' + phoneNumber).then((bool result) async {
    if (result) {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launch(launchUri.toString());
    } else {}
  });
}

String getFormattedDateTimeAsNumbers(String dateTime) {
  var date = DateTime.parse(dateTime);
  // updated on. 22:15 - 07/12/2021
  return DateFormat('HH:mm - dd/MM/yyyy').format(date);
}
String getFormattedDateTimeAsString(String dateTime,BuildContext context) {
  var date = DateTime.parse(dateTime);
  // updated on. 22:15 - 07/12/2021
  return DateFormat(' MMMM yyyy, HH:mm',Localizations.localeOf(context).toString()).format(date);
}

// String getServerFormattedDateTime(DateTime dateTime) {
//   // updated on. 22:15 - 07/12/2021
//   return DateFormat('HH:mm - dd/MM/yyyy').format(dateTime);
//   return DateFormat('yyy-MM-ddT').format(dateTime);
// }2022-2-28T23:13:16.076Z
Future<String> getImageFromGallery() async {
  FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
    type: FileType.media,
  );
  if (pickedFile != null) {
    return Future<String>.value(pickedFile.files.single.path);
  } else {
    return Future<String>.value("error");
  }
}

Future<String> getFileSize(File file, int decimals) async {
  int bytes = await file.length();
  if (bytes <= 0) return "0 B";
  const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
  var i = (log(bytes) / log(1024)).floor();
  return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];
}

Future<double> getFileSizeInKB(File file) async {
  int bytes = await file.length();
  if (bytes <= 0) return 0;
  return ((bytes / pow(1024, 1)));
}
