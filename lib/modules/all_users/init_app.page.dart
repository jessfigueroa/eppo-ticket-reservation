// import 'package:animate_do/animate_do.dart';
// import 'package:eppo/modules/auth/auth.service.dart';
// import 'package:eppo/modules/auth/response_auth.model.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:mercadorista/bloc/login/login_bloc.dart';
// // import 'package:mercadorista/helpers/helpers.dart';
// // import 'package:mercadorista/models/models.dart';
// // import 'package:mercadorista/services/login_service.dart';

// class InitAppPage extends StatelessWidget {
//   // bool isFirst;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: _verificaToken(context),
//         builder: (context, snapshot) {
//           final texto = "From Looroh..";
//           return Stack(
//             children: [
//               Pulse(
//                 duration: Duration(seconds: 2),
//                 infinite: true,
//                 animate: false,
//                 controller: (ctrl) {
//                   ctrl.repeat();
//                 },
//                 child: Center(
//                   child: Image.asset(
//                     'assets/looroh_logo.png',
//                     height: 100,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: (MediaQuery.of(context).size.width / 2) -
//                     (texto.length * 5),
//                 bottom: 20,
//                 child: Text(
//                   texto,
//                   style: TextStyle(fontSize: 20, fontFamily: ''),
//                 ),
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Future _verificaToken(BuildContext context) async {
//     final loginService = AuthService();
//     AuthResponse loginResp;
//     try {
//       loginResp = await loginService.verificarToken();
//       if (loginResp.exito) {
//         final user = loginResp.usuario;
//         final token = loginResp.token;
//         inicializarAppMercadorista(context, user, token);
//       } else {
//         await Navigator.pushReplacementNamed(context, "login_view",
//             arguments: "La sesión expiró");
//       }
//     } catch (e) {
//       await Navigator.pushReplacementNamed(context, "login_view",
//           arguments: "La sesión expiró");
//     }
//   }
// }
