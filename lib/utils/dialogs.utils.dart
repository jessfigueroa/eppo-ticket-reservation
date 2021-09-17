part of 'utils.dart';

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
