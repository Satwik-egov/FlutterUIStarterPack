import 'package:attendance_management/pages/manage_attendance.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_digit_app/blocs/attendencebloc.dart';
import 'package:new_digit_app/blocs/authbloc.dart';
import 'package:new_digit_app/blocs/localization.dart';
import 'package:new_digit_app/pages/sideBar.dart';
import 'package:new_digit_app/widget/localized.dart';
import '../utils/i18_key_constants.dart' as i18;

// import '../blocs/userbloc.dart';

class HomeScreen extends LocalizedStatefulWidget {
  const HomeScreen({super.key, super.appLocalizations});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends LocalizedState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, state) {
      return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) => state.maybeWhen(
              orElse: () => const CircularProgressIndicator(),
              authenticated: (accesstoken, refreshtoken, userRequest) =>
                  Scaffold(
                    appBar: AppBar(),
                    body: Column(
                      children: [
                        DigitIconButton(
                          icon: Icons.fingerprint,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ManageAttendancePage(
                                          projectId: "",
                                          userId: "",
                                          appVersion: '1.3',
                                          attendanceListeners:
                                              HCMAttendanceBloc(
                                            context: context,
                                          ),
                                        )));
                          },
                        ),
                        // DigitIconButton(
                        //   icon: Icons.arrow_back,
                        //   onPressed: () {
                        //     context
                        //         .read<AuthBloc>()
                        //         .add(const AuthEvent.logout());
                        //     context.navigateBack();
                        //   },
                        // ),
                        const Text('Text below to see if translation occurs'),
                        Text(localizations
                            .translate(i18.common.coreCommonContinue))
                      ],
                    ),
                    drawer: Drawer(child: SideBar()),
                  )
              //     BlocBuilder<UserBloc, UserState>(
              //   builder: (context, state) => ElevatedButton(
              //       onPressed: () {
              //         context
              //             .read<UserBloc>()
              //             .add(UserEvent.searchUser(uuid: userRequest!.uuid));
              //       },
              //       child: const Text('Click for search')),
              // ),
              ));
    });
  }
}
