// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../blocs/app_init.dart';
// import 'langSelection.dart';

// class UnauthenticatedPageWrapper extends StatelessWidget {
//   const UnauthenticatedPageWrapper({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(providers: [
//       BlocProvider(
//         create: (context) => AppInitialization()..add(InitEvent.onLaunch()),
//       ),

      
//     ],
//     child: context.router.push(SelectLanguageScreen);
//     );
//   }
// }
