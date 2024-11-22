import 'package:aplikasi_monitoring/providers/attendance_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreens extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider> (context);

    return Scaffold(
      appBar: AppBar(title: Text('presensi mahasiswa'),
      ),
      body: ListView.builder(
        itemCount: attendanceProvider.siswa.length,
        itemBuilder: (context, index) {
          final Siswa = attendanceProvider.siswa[index];

          return ListTile(
            title: Text(Siswa.name),
            trailing: Checkbox(
              value: Siswa.isPresent, 
              onChanged: (_) => attendanceProvider.toggleAttendance(index),
            ),
          );
        },
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(onPressed: attendanceProvider.siswa.any((s) => s.isPresent)
        ? attendanceProvider.saveAttendance
        : null,
        child: Text("Simpan Kehadiran") ),
      ),
    );
  }
}