import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/data/local_store/sql_store/tables/stock_reconciliation.dart';
import 'package:inventory_management/pages/manage_stocks.dart';
import 'package:inventory_management/pages/reports/report_details.dart';
import 'package:inventory_management/pages/stock_reconciliation/stock_reconciliation.dart';
import 'package:new_digit_app/blocs/inventory.dart';
import 'package:new_digit_app/pages/sideBar.dart';
import 'package:new_digit_app/widget/localized.dart';

class StocksPage extends LocalizedStatefulWidget {
  final projectId;
  final userId;
  final actionMap;
  final roles;

  const StocksPage(
      {super.key,
      required this.projectId,
      required this.userId,
      super.appLocalizations,
      required this.actionMap,
      required this.roles});

  @override
  State<StocksPage> createState() => _StocksPageState();
}

class _StocksPageState extends LocalizedState<StocksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(child: SideBar()),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        DigitIconButton(
            icon: Icons.inventory,
            iconText: 'Manage Stock',
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ManageStocksPage(
                          projectId: widget.projectId,
                          userId: widget.userId!,
                          inventoryListener: HCMInventoryBloc(
                              projectId: widget.projectId,
                              userId: widget.userId,
                              uuid: widget.userId,
                              context: context,
                              actionMap: widget.actionMap,
                              roles: widget.roles),
                          //TO-DO, what if the list of roles contains more elements
                          boundaryName: '',
                          isDistributor: true,
                          isWareHouseMgr: true,
                          transportType: [],
                        )))),
        DigitIconButton(
            icon: Icons.book_sharp,
            iconText: 'Stock Reconciliation',
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StockReconciliationPage(
                        inventoryListener: HCMInventoryBloc(
                            projectId: widget.projectId,
                            userId: widget.userId,
                            uuid: widget.userId,
                            context: context,
                            actionMap: widget.actionMap,
                            roles: widget.roles),
                        projectId: widget.projectId,
                        isDistributor: true,
                        isWareHouseMgr: true,
                        loggedInUserUuid: widget.userId)))),
        const DigitIconButton(
          icon: Icons.report,
          iconText: 'View Reports',
        )
      ]),
    );
  }
}
