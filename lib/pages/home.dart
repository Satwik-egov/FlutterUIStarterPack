import 'package:attendance_management/pages/manage_attendance.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_digit_app/blocs/attendencebloc.dart';
import 'package:new_digit_app/blocs/authbloc.dart';

// import '../blocs/userbloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) => state.maybeWhen(
            orElse: () => const CircularProgressIndicator(),
            authenticated: (accesstoken, refreshtoken, userRequest) => Scaffold(
                  appBar: AppBar(),
                  body: Column(children: [
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
                                      attendanceListeners: HCMAttendanceBloc(
                                        context: context,
                                      ),
                                    )));
                      },
                    )
                  ]),
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
  }
}
