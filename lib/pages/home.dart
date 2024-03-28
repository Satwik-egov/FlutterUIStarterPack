import 'package:attendance_management/pages/manage_attendance.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_digit_app/blocs/app_init.dart';
import 'package:new_digit_app/blocs/attendencebloc.dart';
import 'package:new_digit_app/blocs/authbloc.dart';
import 'package:new_digit_app/blocs/localization.dart';
import 'package:new_digit_app/blocs/userbloc.dart';
import 'package:new_digit_app/pages/sideBar.dart';
import 'package:new_digit_app/widget/localized.dart';
import '../utils/i18_key_constants.dart' as i18;

class HomeScreen extends LocalizedStatefulWidget {
  const HomeScreen({super.key, super.appLocalizations});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends LocalizedState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: _alternateLogout,
      child:
          BlocBuilder<AppInitialization, InitState>(builder: (context, state) {
        final actionMap = state.entityActionMapping;
        return BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) => state.maybeWhen(
                  orElse: () => const CircularProgressIndicator(),
                  authenticated: (accesstoken, refreshtoken, userRequest) =>
                      BlocBuilder<UserBloc, UserState>(
                          builder: (context, currentUserState) {
                    context.read<UserBloc>().add(UserEvent.searchUser(
                        uuid: userRequest!.uuid, actionMap: actionMap));
                    if (currentUserState is UserUserState) {
                      final user = currentUserState.userModel;
                      return BlocBuilder<LocalizationBloc, LocalizationState>(
                          builder: (context, state) {
                        return Scaffold(
                          appBar: AppBar(),
                          body: Column(
                            children: [
                              DigitIconButton(
                                icon: Icons.fingerprint,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ManageAttendancePage(
                                                projectId:
                                                    "", //TO-DO change this line
                                                userId: "",
                                                appVersion: '1.3',
                                                attendanceListeners:
                                                    HCMAttendanceBloc(
                                                  actionMap: actionMap,
                                                  context: context,
                                                ),
                                              )));
                                },
                              ),
                              DigitIconButton(
                                  icon: Icons.book,
                                  iconText: 'Stock',
                                  onPressed: () => AutoRouter.of(context)
                                      .pushNamed('home/projects')),
                              const Text(
                                  'Text below to see if translation occurs'),
                              Text(localizations
                                  .translate(i18.common.coreCommonContinue))
                            ],
                          ),
                          drawer: Drawer(child: SideBar()),
                        );
                      });
                    } else {
                      return Text('User not fetched');
                    }
                  }),
                ));
      }),
    );
  }

  Future<bool> _alternateLogout(bool didPop) async {
    bool confirmed = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure'),
          content: Row(
            children: [
              ElevatedButton(
                child: const Text('Yes'),
                onPressed: () {
                  context.read<AuthBloc>().add(const AuthEvent.logout());
                  Navigator.of(context).pop(true);
                },
              ),
              ElevatedButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ],
          ),
        );
      },
    );

    return confirmed ?? false;
  }
}
