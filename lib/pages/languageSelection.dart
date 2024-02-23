// import 'package:auto_route/auto_route.dart';
// import 'package:digit_components/digit_components.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:new_digit_app/blocs/app_init.dart';
// import 'package:new_digit_app/blocs/localization.dart';
// import 'package:new_digit_app/routes/routes.dart';
// // import '../utils/i18_key_constants.dart' as i18;
// // import '../utils/localizationHelper.dart';

// class SelectLanguageScreen extends StatelessWidget {
//   var localeKey = 'en_MZ';

//   SelectLanguageScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => AppInitialization()..add(InitEvent.onLaunch()),
//         ),
//         BlocProvider(
//           create: (context) => Localization(),
//         )
//       ],
//       child: Scaffold(
//         appBar: AppBar(),
//         body: Card(
//           margin: EdgeInsets.fromLTRB(10, 10, 10, 40),
//           child: BlocBuilder<AppInitialization, InitState>(
//             builder: (context, appConfigState) => Container(
//               child: appConfigState.maybeWhen(
//                   orElse: () => CircularProgressIndicator(),
//                   initialized: (appConfig, serviceRegList) => Column(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             BlocBuilder<Localization, LocalizationState>(
//                                 builder: (context, state) {
//                               final localizationModel = state.maybeWhen(
//                                   orElse: () => null,
//                                   selected: (localizationList) =>
//                                       localizationList);

//                               return Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: [
//                                       Container(
//                                         width:
//                                             MediaQuery.of(context).size.width /
//                                                 4,
//                                         child: DigitElevatedButton(
//                                           child: Text(localizationModel != null
//                                               ? 'English'
//                                               : 'Localization not available'),
//                                           onPressed: () => {
//                                             localeKey = 'en_MZ',
//                                             context.read<Localization>().add(
//                                                 LocalizationEvent.onSelect(
//                                                     locale: 'en_MZ',
//                                                     moduleList: appConfig
//                                                         .appConfig!
//                                                         .appConfig?[0]
//                                                         .backendInterface))
//                                           },
//                                         ),
//                                       ),
//                                       Container(
//                                         width:
//                                             MediaQuery.of(context).size.width /
//                                                 4,
//                                         // padding: EdgeInsets.all(8.0),
//                                         child: DigitElevatedButton(
//                                           // child: Text('French'),
//                                           child: Text(localizationModel != null
//                                               ? 'French'
//                                               : 'Localization not available'),
//                                           onPressed: () => {
//                                             localeKey = 'fr_MZ',
//                                             context.read<Localization>().add(
//                                                 LocalizationEvent.onSelect(
//                                                     locale: 'fr_MZ',
//                                                     moduleList: appConfig
//                                                         .appConfig!
//                                                         .appConfig?[0]
//                                                         .backendInterface))
//                                           },
//                                         ),
//                                       ),
//                                       Container(
//                                         width:
//                                             MediaQuery.of(context).size.width /
//                                                 4,
//                                         child: DigitElevatedButton(
//                                           child: Text(localizationModel != null
//                                               ? 'Portuguese'
//                                               : 'Localization not available'),
//                                           onPressed: () => {
//                                             localeKey = 'pt_MZ',
//                                             context.read<Localization>().add(
//                                                 LocalizationEvent.onSelect(
//                                                     locale: 'pt_MZ',
//                                                     moduleList: appConfig
//                                                         .appConfig!
//                                                         .appConfig?[0]
//                                                         .backendInterface))
//                                           },
//                                         ),
//                                       ),
//                                     ]),
//                               );
//                             }),
//                             SizedBox(
//                               width: 20,
//                               height: 20,
//                             ),
//                             Container(
//                               margin: EdgeInsets.all(30),
//                               child: ElevatedButton(
//                                   onPressed: () {
//                                     context.navigateTo(
//                                         LoginRoute(locale: localeKey));
//                                   },
//                                   child: Text('Submit')),
//                             )
//                           ]),
//                   uninitialized: () => Text('App unitialized')),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
