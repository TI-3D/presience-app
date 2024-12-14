import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:presience_app/data/datasources/remote_datasources/attendance_remote_datasource.dart';
import 'package:presience_app/data/datasources/remote_datasources/auth_remote_datasource.dart';
import 'package:presience_app/data/datasources/remote_datasources/course_remote_datasource.dart';
import 'package:presience_app/data/datasources/remote_datasources/face_recognition_remote_datasource.dart';
import 'package:presience_app/data/datasources/remote_datasources/permit_remote_datasource.dart';
import 'package:presience_app/data/datasources/remote_datasources/schedule_remote_datasource.dart';
import 'package:presience_app/data/dto/requests/get_history_attendance_dto.dart';
import 'package:presience_app/firebase_options.dart';
import 'package:presience_app/presentation/blocs/attendance/attendance_bloc.dart';
import 'package:presience_app/presentation/blocs/attendance_week/attendance_week_bloc.dart';
import 'package:presience_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:presience_app/presentation/blocs/course/course_bloc.dart';
import 'package:presience_app/presentation/blocs/face_recognition/face_recognition_bloc.dart';
import 'package:presience_app/presentation/blocs/forgot_password/forgot_password_bloc.dart';
import 'package:presience_app/presentation/blocs/history_attendance/history_attendance_bloc.dart';
import 'package:presience_app/presentation/blocs/permit/permit_bloc.dart';
import 'package:presience_app/presentation/blocs/schedule/schedule_bloc.dart';
import 'package:presience_app/presentation/router/routes.dart';
import 'package:presience_app/presentation/utils/theme.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());

  // Menghapus splash screen setelah aplikasi siap
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(AuthRemoteDatasource())
            ..add(const AuthEvent.checkLoginStatus()),
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
        BlocProvider(
          create: (context) => CourseBloc(CourseRemoteDatasource())
            ..add(const CourseEvent.getCourses()),
        ),
        BlocProvider(
          create: (context) =>
              HistoryAttendanceBloc(AttendanceRemoteDatasource())
                ..add(const HistoryAttendanceEvent.getHistoryAttendance(
                  GetHistoryAttendanceDto(attendanceStatus: '', courseId: 0),
                )),
        ),
        BlocProvider(
          create: (context) => FaceRecognitionBloc(
            FaceRecognitionRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => ForgotPasswordBloc(
            AuthRemoteDatasource(),
          ),
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
