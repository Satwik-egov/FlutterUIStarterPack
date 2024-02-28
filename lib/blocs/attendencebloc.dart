import 'package:attendance_management/blocs/attendance_listeners.dart';
import 'package:attendance_management/models/attendance_register.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HCMAttendanceBloc extends AttendanceListeners {
  final String? userId;
  final String? individualId;
  final String? projectId;
  BuildContext context;

  HCMAttendanceBloc({
    this.individualId,
    this.userId,
    this.projectId,
    required this.context,
  });

  late Function(List<AttendanceRegisterModel> registers) _registersLoaded;

  @override
  void getAttendanceRegisters(
    Function(List<AttendanceRegisterModel> registers) attendanceRegisters,
  ) {
    _registersLoaded = attendanceRegisters;

    return onRegistersLoaded();
  }

  void onRegistersLoaded()  {
    _registersLoaded([AttendanceRegisterModel(id: '',name: 'Attendance')]);
  }

  @override
  void searchAttendanceLog(
    SearchAttendanceLog searchAttendanceLog,
  ) async {}

  @override
  Future<void> submitAttendanceDetails(
    SubmitAttendanceDetails attendanceLogs,
  ) async {}

  @override
  void callSyncMethod() {}
}
