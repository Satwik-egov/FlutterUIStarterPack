import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_digit_app/pages/sideBar.dart';
import 'package:new_digit_app/widget/localized.dart';

class StocksPage extends LocalizedStatefulWidget {
  final projectId;
  final userId;

  const StocksPage(
      {super.key,
      required this.projectId,
      required this.userId,
      super.appLocalizations});

  @override
  State<StocksPage> createState() => _StocksPageState();
}

class _StocksPageState extends LocalizedState<StocksPage> {
  final projectId = widget.projectId;
  final userId = widget.userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(child: SideBar()),
      body: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DigitIconButton(
              icon: Icons.inventory,
              iconText: 'Manage Stock',
            ),
            DigitIconButton(
              icon: Icons.book_sharp,
              iconText: 'Stock Reconciliation',
            ),
            DigitIconButton(
              icon: Icons.report,
              iconText: 'View Reports',
            )
          ]),
    );
  }
}
