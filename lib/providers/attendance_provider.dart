import 'package:aplikasi_monitoring/models/attendance.dart';
import 'package:flutter/material.dart';
import '../models/siswa.dart';

class AttendanceProvider with ChangeNotifier {
  List<Siswa> _siswa = [
    Siswa(name: 'Ali'),
    Siswa(name: 'Budi'),
    Siswa(name: 'Citra'),
  ];

  List<Attendance> _attendanceHistory = [];

  List<Siswa> get siswa => _siswa;
  List<Attendance> get attendanceHistory =>_attendanceHistory;

  void toggleAttendance(int index) {
    _siswa[index].isPresent =!_siswa[index].isPresent;
    notifyListeners();
  }

  void saveAttendance() {
    final presentCount =_siswa.where((siswa) => siswa.isPresent).length;
    final absenCount =_siswa.length -presentCount;

    final currentDate = DateTime.now();
    _attendanceHistory.insert(
      0,
      Attendance(
        date: "${currentDate.day}/${currentDate.month}/${currentDate.year}",
        presentCount: presentCount,
        absenCount: absenCount,
      ),
    );

    for (var siswa in _siswa) {
      siswa.isPresent = false;
    }

    notifyListeners();
  }
}