import 'package:attendance_management/attendance_management.dart';

class HCMAttendanceBloc extends AttendanceListeners {
  @override
  void callSyncMethod() {
    // TODO: implement callSyncMethod
  }

  late Function(List<AttendanceRegisterModel>) registersLoaded;

  @override
  void getAttendanceRegisters(
      Function(List<AttendanceRegisterModel> attendanceRegisterModel)
          attendanceRegisters) {
    // TODO: implement getAttendanceRegisters
    registersLoaded = attendanceRegisters;

    return onRegistersLoaded();
  }

  void onRegistersLoaded() {
    registersLoaded([AttendanceRegisterModel(id: '', name: 'Attendance')]);
  }

  @override
  void searchAttendanceLog(SearchAttendanceLog searchAttendanceLog) {
    // TODO: implement searchAttendanceLog
  }

  @override
  void submitAttendanceDetails(SubmitAttendanceDetails attendanceLogs) {
    // TODO: implement submitAttendanceDetails
  }
}
