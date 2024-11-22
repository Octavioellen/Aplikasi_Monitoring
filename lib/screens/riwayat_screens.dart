import 'package:aplikasi_monitoring/providers/attendance_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RiwayatScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran')),
      body: ListView.builder(
        itemCount: attendanceProvider.attendanceHistory.length,
        itemBuilder: (context, index) {
          final record = attendanceProvider.attendanceHistory[index];
          return ListTile(
            title: Text(record.date),
            subtitle: Text(
              'Hadir: ${record.presentCount}, Tidak Hadir: ${record.absenCount}',
            ),
          );
        },
      ),
    );
  }
}