import 'package:flutter/cupertino.dart';

abstract class LocalizedStatefulWidget extends StatefulWidget {
  final appLocalizations;

  const LocalizedStatefulWidget({super.key, this.appLocalizations});
}
