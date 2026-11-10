package order_app;

import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:order_app/presentation/screens/order_screen.dart';

void main() {
  runApp(const ProviderScope(child: OrderApp()));
}

class OrderApp extends StatelessWidget {
  const OrderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OrderScreen(),
    );
  }
}