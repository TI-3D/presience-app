import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presience_app/data/datasources/remote_datasources/attendance_remote_datasource.dart';
import 'package:presience_app/data/datasources/remote_datasources/auth_remote_datasource.dart';
import 'package:presience_app/data/datasources/remote_datasources/permit_remote_datasource.dart';
import 'package:presience_app/data/datasources/remote_datasources/schedule_remote_datasource.dart';
import 'package:presience_app/presentation/blocs/attendance/attendance_bloc.dart';
import 'package:presience_app/presentation/blocs/attendance_week/attendance_week_bloc.dart';
import 'package:presience_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:presience_app/presentation/blocs/permit/permit_bloc.dart';
import 'package:presience_app/presentation/blocs/schedule/schedule_bloc.dart';
import 'package:presience_app/presentation/router/routes.dart';
import 'package:presience_app/presentation/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => ScheduleBloc(ScheduleRemoteDatasource())
            ..add(const ScheduleEvent.getSchedulesToday()),
        ),
        BlocProvider(
          create: (context) => AttendanceBloc(AttendanceRemoteDatasource())
            ..add(const AttendanceEvent.getAttendanceInformation()),
        ),
        BlocProvider(
          create: (context) => AttendanceWeekBloc(AttendanceRemoteDatasource())
            ..add(const AttendanceWeekEvent.getHistoryAttendanceWeek()),
        ),
        BlocProvider(
          create: (context) => PermitBloc(PermitRemoteDatasource())
            ..add(const PermitEvent.getHistoryPermit()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: getRoute(),
        theme: appTheme,
      ),
    );
  }
}
