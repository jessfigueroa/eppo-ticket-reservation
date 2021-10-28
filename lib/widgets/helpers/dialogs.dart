part of 'helpers.dart';

// mostrarAlerta(
//   BuildContext context,
//   String mensaje,
//   String title, {
//   @required List<Widget> actions,
//   @required bool error,
// }) async {
//   return await showDialog(
//       context: context,
//       builder: (BuildContext contexto) {
//         return AlertDialog(
//           titlePadding: EdgeInsets.all(0),
//           title: Container(
//             padding: EdgeInsets.all(10),
//             height: 50,
//             decoration: BoxDecoration(
//               color: error
//                   ? Colors.red.withOpacity(0.6)
//                   : Colors.green.withOpacity(0.6),
//               borderRadius: BorderRadius.vertical(top: Radius.circular(3)),
//             ),
//             child: Row(
//               children: [
//                 Image.asset('assets/looroh_logo.png'),
//                 SizedBox(width: 10),
//                 Text(title),
//               ],
//             ),
//           ),
//           content: Text(
//             mensaje,
//             style: TextStyle(color: error ? Colors.red : Colors.black),
//           ),
//           actions: actions,
//         );
//       });
// }
showPassengerDialog(
  BuildContext context,
  UserEppo user,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Container(
          padding: EdgeInsets.all(10),
          height: 100,
          width: getCurrentWidth(context, 0.9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 100,
                width: 80,
                color: Colors.grey,
                child: Image.asset('assets/images/profile.jpg'),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 55,
                        child: Text(
                          'DNI',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(':'),
                      SizedBox(width: 5),
                      Text(user.dni),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 55,
                        child: Text(
                          'Nombre',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(':'),
                      SizedBox(width: 5),
                      Container(
                        width: 100,
                        child: Text(user.capitalName),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 55,
                        child: Text(
                          'Asiento',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(':'),
                      SizedBox(width: 5),
                      Text("${user.seatNumber}"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

showAlertOkIOS(
  BuildContext context,
  String titulo,
  String contenido,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(titulo),
        content: Text(contenido),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text("OK"),
          )
        ],
      );
    },
  );
}

// Future<bool> showAlertEditDeleteIOS(
//   BuildContext context, {
//   @required Function onDeleteAction,
//   @required Function onEditAction,
//   String contenido = "Seleccione una.",
//   String titulo = "Opciones",
//   contenidoConfirmacionDelete = "",
// }) {
//   return showCupertinoDialog(
//     barrierDismissible: true,
//     context: context,
//     builder: (context) {
//       return CupertinoAlertDialog(
//         title: Text(titulo),
//         content: Text(contenido),
//         actions: [
//           TextButton(
//             child: Text("Eliminar", style: TextStyle(color: Colors.red)),
//             onPressed: () async {
//               Navigator.pop(context, false);

//               bool resp = await showAlertYesOrNoIOS(
//                 context,
//                 "Cuidado!",
//                 contenido: contenidoConfirmacionDelete,
//               );
//               resp = resp ?? false;
//               if (resp) {
//                 onDeleteAction();
//               }
//             },
//           ),
//           TextButton(
//             child: Text("Editar"),
//             style: ButtonStyle(),
//             onPressed: () {
//               Navigator.pop(context);
//               onEditAction();
//             },
//           )
//         ],
//       );
//     },
//   );
// }

// Future<T> showAlertYesOrNoIOS<T>(BuildContext context, String titulo,
//     {String contenido = ""}) async {
//   if (await Vibration.hasVibrator()) {
//     Vibration.vibrate();
//   }
//   return showCupertinoDialog(
//     context: context,
//     barrierDismissible: true,
//     barrierLabel: "false",
//     builder: (context) {
//       return Bounce(
//         from: 20,
//         duration: Duration(milliseconds: 500),
//         child: CupertinoAlertDialog(
//           title: Text(titulo),
//           content: Text(contenido),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context, false),
//               child: Text("NO"),
//             ),
//             TextButton(
//               onPressed: () => Navigator.pop(context, true),
//               child: Text("SI", style: TextStyle(color: Colors.red)),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

// showMapDialog(context, LatLng coordenadas) {
//   return showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         backgroundColor: Theme.of(context).primaryColor,
//         contentPadding: EdgeInsets.all(5),
//         content: MapaEditDialog(
//           coordenadas: coordenadas,
//         ),
//       );
//     },
//   );
// }

// class ShowComentarioDialog extends StatelessWidget {
//   final bool isClienteComent;
//   //ya sea el idCliente o el idPedido
//   final String uid;
//   const ShowComentarioDialog({
//     Key key,
//     @required this.uid,
//     this.isClienteComent,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       titlePadding: EdgeInsets.zero,
//       contentPadding: EdgeInsets.zero,
//       titleTextStyle: TextStyle(
//           fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
//       title: _TitleAlertDialog(isClienteComent: isClienteComent),
//       content: _ContentAlertDialog(uid: uid, isClienteComent: isClienteComent),
//     );
//   }
// }

// class _ContentAlertDialog extends StatefulWidget {
//   final String uid;
//   final bool isClienteComent;
//   const _ContentAlertDialog({Key key, @required this.uid, this.isClienteComent})
//       : super(key: key);

//   @override
//   __ContentAlertDialogState createState() => __ContentAlertDialogState();
// }

// class __ContentAlertDialogState extends State<_ContentAlertDialog> {
//   TextEditingController textCtrl;
//   String _errorText;
//   Comentario comentarioOld;
//   Comentario comentarioNew;

//   Usuario userLogin;

//   @override
//   void initState() {
//     comentarioOld =
//         BlocProvider.of<ComentarioBloc>(context).state.comentarioEdit;

//     comentarioNew = Comentario(
//       comentario: comentarioOld.comentario,
//       fechaRegistro: comentarioOld.fechaRegistro,
//       id: comentarioOld.id,
//       usuarioComenta: comentarioOld.usuarioComenta,
//     );
//     textCtrl = TextEditingController(text: comentarioNew.comentario);
//     userLogin = userLogin = BlocProvider.of<LoginBloc>(context).state.usuario;
//     super.initState();
//   }

//   @override
//   void dispose() {
//     textCtrl.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bool isEdit = comentarioNew.id != null;
//     return Container(
//       height: 300,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             height: 230,
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CajaComentario(
//                     comentario: textCtrl.text,
//                     horaderegistro: isEdit
//                         ? comentarioNew.getHoraDeRegistro()
//                         : "hace un momento",
//                     nombreComenta: isEdit
//                         ? comentarioNew.usuarioComenta.getNombreUsuario()
//                         : userLogin.getNombreUsuario(),
//                     urlImg: isEdit
//                         ? comentarioNew.usuarioComenta.foto
//                         : userLogin.foto,
//                     showActions: false,
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     child: CustomTextField(
//                       labelText: "",
//                       hintText: "",
//                       controller: textCtrl,
//                       errorText: _errorText,
//                       minLines: 3,
//                       textInputAction: TextInputAction.newline,
//                       onChanged: _validarCampos,
//                       keyboardType: TextInputType.multiline,
//                       maxLength: 100,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(Colors.grey),
//                     ),
//                     onPressed: () => Navigator.pop(context),
//                     child: Text(
//                       "Cancelar",
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 5),
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(
//                           Theme.of(context).primaryColor),
//                     ),
//                     onPressed: () =>
//                         _onComentar(widget.uid, widget.isClienteComent),
//                     child: Text("Comentar"),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   _onComentar(String uid, bool isClienteComent) {
//     final formValido = _validarCampos(textCtrl.text);
//     if (formValido) {
//       BlocProvider.of<ComentarioBloc>(context).add(
//         OnRegistrarComentario(
//           comment: comentarioNew,
//           uid: uid,
//           tipoComentario:
//               isClienteComent ? ComentarioType.USUARIO : ComentarioType.PEDIDO,
//         ),
//       );

//       Navigator.pop(context);
//     }
//   }

//   bool _validarCampos(String val) {
//     comentarioNew.comentario = val;
//     _errorText = null;
//     bool valido = true;
//     if (val.length < 10) {
//       _errorText = "minimo 10 caracteres";
//       valido = false;
//     }
//     setState(() {});
//     return valido;
//   }
// }

// class _TitleAlertDialog extends StatelessWidget {
//   final bool isClienteComent;
//   const _TitleAlertDialog({Key key, this.isClienteComent}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(width: 1),
//             Expanded(
//               child: Container(
//                 child: Center(
//                   child: Text(
//                       "Añadir Comentario al ${isClienteComent ? "Cliente" : "Pedido"}"),
//                 ),
//               ),
//             ),
//             IconButton(
//               onPressed: () => Navigator.pop(context),
//               icon: Icon(
//                 Icons.close,
//                 size: 20,
//               ),
//             ),
//           ],
//         ),
//         Container(
//           color: Colors.grey,
//           height: 1,
//         ),
//       ],
//     );
//   }
// }

// showComentarioDialog(BuildContext contexto, String uid, bool isClienteComent) {
//   return showDialog(
//     barrierDismissible: false,
//     context: contexto,
//     builder: (context) {
//       return ShowComentarioDialog(uid: uid, isClienteComent: isClienteComent);
//     },
//   );
// }

// showOptionsMarkerDialog(
//   BuildContext context,
//   Pedido pedido,
// ) {
//   return showCupertinoDialog(
//     barrierDismissible: true,
//     context: context,
//     builder: (context) {
//       // log("${pedido.pedidoIsProgramado}");
//       return AlertDialog(
//         scrollable: true,
//         contentPadding: EdgeInsets.zero,
//         content: Container(
//           child: Material(
//             color: Colors.transparent,
//             child: Column(
//               children: [
//                 SizedBox(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.close),
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 1),
//                 Container(height: 1, color: Colors.grey[200]),
//                 ListTile(
//                   leading: Icon(Icons.remove_red_eye_outlined),
//                   title: Text("Ver detalle"),
//                   onTap: () {
//                     Navigator.pop(context);
//                     BlocProvider.of<PedidoBloc>(context).add(
//                       OnDetallePedido(pedido: pedido),
//                     );
//                     Navigator.pushNamed(context, "pedido_detalle_view");
//                   },
//                 ),
//                 Container(height: 1, color: Colors.grey[200]),
//                 !pedido.pedidoIsProgramado
//                     ? Container()
//                     : ListTile(
//                         leading: Icon(Icons.local_shipping_outlined),
//                         title: Text("Marcar como entregado"),
//                         onTap: () async {
//                           final resp = await cambiarEstadoPedido(
//                             context,
//                             "60666834f5c8af38ac995e0f",
//                             true,
//                           );
//                           if (resp) {
//                             Navigator.pop(context);
//                           }
//                         },
//                       ),
//                 Container(height: 1, color: Colors.grey[200]),
//                 !pedido.pedidoIsProgramado
//                     ? Container()
//                     : ListTile(
//                         leading: Icon(Icons.update),
//                         title: Text("Reprogramar entrega"),
//                         onTap: () async {
//                           final resp = await cambiarEstadoPedido(
//                             context,
//                             "60666840f5c8af38ac995e11",
//                             false,
//                           );
//                           if (resp) {
//                             Navigator.pop(context);
//                           }
//                         },
//                       ),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }

// showCambiarEstadoDilog(BuildContext context) {
//   return showDialog(
//     context: context,
//     builder: (context) => _AlertMotivoTextDialog(),
//   );
// }

// class _AlertMotivoTextDialog extends StatefulWidget {
//   _AlertMotivoTextDialog({Key key}) : super(key: key);

//   @override
//   __AlertMotivoTextDialogState createState() => __AlertMotivoTextDialogState();
// }

// class __AlertMotivoTextDialogState extends State<_AlertMotivoTextDialog> {
//   TextEditingController txtCtrl;
//   String _errorText;
//   @override
//   void initState() {
//     txtCtrl = TextEditingController();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Center(child: Text("Motivo")),
//       content: CustomTextField(
//         labelText: "",
//         hintText: "Escribe...",
//         controller: txtCtrl,
//         minLines: 3,
//         maxLines: 4,
//         errorText: _errorText,
//         onChanged: _validarCampos,
//         keyboardType: TextInputType.multiline,
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: Text(
//             "Cancelar",
//             style: TextStyle(color: Colors.red),
//           ),
//         ),
//         TextButton(
//           onPressed: () {
//             final formValido = _validarCampos(txtCtrl.text);
//             if (formValido) {
//               Navigator.pop(context, txtCtrl.text);
//             }
//           },
//           child: Text("Reprogramar"),
//         ),
//       ],
//     );
//   }

//   bool _validarCampos(String val) {
//     _errorText = null;
//     bool valido = true;
//     if (val.length < 10) {
//       _errorText = "minimo 10 caracteres";
//       valido = false;
//     }
//     setState(() {});
//     return valido;
//   }
// }

// Future<bool> showAlertCategoriaEditDelete(
//   BuildContext context, {
//   @required Function onDeleteAction(bool productos),
//   @required Function onEditAction,
//   String contenido = "Seleccione una.",
//   String titulo = "Opciones",
//   contenidoConfirmacionDelete = "",
// }) {
//   return showCupertinoDialog(
//     barrierDismissible: true,
//     context: context,
//     builder: (context) {
//       return CupertinoAlertDialog(
//         title: Text(titulo),
//         content: Text(contenido),
//         actions: [
//           TextButton(
//             child: Text("Eliminar", style: TextStyle(color: Colors.red)),
//             onPressed: () async {
//               Navigator.pop(context, false);
//               Map<String, bool> resp = await showAlertDeleteCategoria(
//                 context,
//                 "Cuidado!",
//                 contenido: contenidoConfirmacionDelete,
//               );
//               resp = resp ?? false;
//               if (resp['resp']) {
//                 onDeleteAction(resp['productos']);
//               }
//             },
//           ),
//           TextButton(
//             child: Text("Editar"),
//             style: ButtonStyle(),
//             onPressed: () {
//               Navigator.pop(context);
//               onEditAction();
//             },
//           )
//         ],
//       );
//     },
//   );
// }

// Future<Map<String, bool>> showAlertDeleteCategoria<T>(
//     BuildContext context, String titulo,
//     {String contenido = ""}) async {
//   if (await Vibration.hasVibrator()) {
//     Vibration.vibrate();
//   }
//   return showCupertinoDialog(
//     context: context,
//     barrierDismissible: true,
//     barrierLabel: "false",
//     builder: (context) {
//       return _AlertConfirmDeleteCategoria(contenido: contenido, titulo: titulo);
//     },
//   );
// }

// class _AlertConfirmDeleteCategoria extends StatefulWidget {
//   const _AlertConfirmDeleteCategoria({
//     Key key,
//     this.contexto,
//     this.contenido,
//     this.titulo,
//   }) : super(key: key);

//   final String contenido;
//   final String titulo;
//   final BuildContext contexto;

//   @override
//   __AlertConfirmDeleteCategoriaState createState() =>
//       __AlertConfirmDeleteCategoriaState();
// }

// class __AlertConfirmDeleteCategoriaState
//     extends State<_AlertConfirmDeleteCategoria> {
//   bool _eliminarProductos;
//   @override
//   void initState() {
//     _eliminarProductos = false;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Bounce(
//       from: 20,
//       duration: Duration(milliseconds: 500),
//       child: CupertinoAlertDialog(
//         title: Text(widget.titulo),
//         content: Column(
//           children: [
//             Text(
//               widget.contenido,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "¿Incluir productos?",
//                   style: TextStyle(fontSize: 12, color: Colors.red),
//                 ),
//                 SizedBox(width: 5),
//                 CupertinoSwitch(
//                   value: _eliminarProductos,
//                   onChanged: (val) {
//                     setState(() {
//                       _eliminarProductos = val;
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(
//               context,
//               {"resp": false, "productos": _eliminarProductos},
//             ),
//             child: Text("NO"),
//           ),
//           TextButton(
//             onPressed: () => Navigator.pop(
//               context,
//               {"resp": true, "productos": _eliminarProductos},
//             ),
//             child: Text("SI", style: TextStyle(color: Colors.red)),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Future<ColorDB> showColorPalleteDialog(BuildContext context) {
//   return showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: Text("Colores"),
//       content: _ColorSelector(),
//     ),
//   );
// }

// class _ColorSelector extends StatelessWidget {
//   _ColorSelector({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final coloresBloc = BlocProvider.of<ColoresBloc>(context);
//     coloresBloc.add(OnInicializarColoresActivos());
//     final size = MediaQuery.of(context).size;
//     return BlocBuilder<ColoresBloc, ColoresState>(
//       builder: (context, state) {
//         final colorSelected = state.idColorSelected;
//         return Container(
//           // color: Colors.red,
//           width: size.width * 0.9,
//           height: size.height * 0.8,
//           child: ListView.separated(
//             separatorBuilder: (context, index) => Container(
//               height: 1,
//               color: Colors.grey[300],
//             ),
//             itemBuilder: (context, index) {
//               final color = state.coloresComboBox[index];
//               return _ColorItem(
//                 color: color,
//                 colorSelected: colorSelected,
//               );
//             },
//             itemCount: state.coloresComboBox.length,
//           ),
//         );
//       },
//     );
//   }
// }

// class _ColorItem extends StatelessWidget {
//   final ColorDB color;
//   final String colorSelected;
//   _ColorItem({Key key, this.color, this.colorSelected}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool isSelected = colorSelected == color.id;
//     return ListTile(
//       title: Text(color.descripcionColor),
//       subtitle: Text(color.codigo),
//       trailing: Icon(
//         !isSelected ? Icons.radio_button_off : Icons.radio_button_checked,
//         color: color.getColorDB(),
//       ),
//       leading: CircleAvatar(
//         child: isSelected
//             ? Icon(
//                 Icons.check,
//                 color: Colors.white,
//                 size: 24,
//               )
//             : Container(),
//         backgroundColor: color.getColorDB(),
//       ),
//       onTap: () {
//         BlocProvider.of<ColoresBloc>(context)
//             .add(OnColorSelectorChange(color.id));
//         Navigator.pop(context, color);
//       },
//     );
//   }
// }
