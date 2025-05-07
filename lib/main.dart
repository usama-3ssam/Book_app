import 'package:book_app/app/app.dart';
import 'package:flutter/material.dart';
import 'core/services/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const MyBooklyApp());
}
