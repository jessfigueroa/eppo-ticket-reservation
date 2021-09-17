import 'package:eppo/enums/enum.dart';
import 'package:eppo/modules/auth/bloc/auth_bloc.dart';
import 'package:eppo/routes/index.route.dart';
import 'package:eppo/themes/index.theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_logs/flutter_logs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterLogs.initLogs(
    logLevelsEnabled: [
      LogLevel.INFO,
      LogLevel.WARNING,
      LogLevel.ERROR,
      LogLevel.SEVERE
    ],
    timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
    directoryStructure: DirectoryStructure.FOR_DATE,
    logTypesEnabled: ["device", "network", "errors"],
    logFileExtension: LogFileExtension.TXT,
    logsWriteDirectoryName: "EppoLogsErrors",
    logsExportDirectoryName: "EppoLogsErrors/Exported",
    debugFileOperations: true,
    isDebuggable: true,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => AuthBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eppo',
        routes: routes,
        initialRoute: 'login_screen',
        theme: getThemeData(DataThemeType.LIGTH),
      ),
    );
  }
}
