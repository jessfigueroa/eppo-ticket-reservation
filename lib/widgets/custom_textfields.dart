part of 'widgets.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;
  final Function? onEditingComplete;
  final Function? onChanged;
  final Function? onTap;
  final FocusNode? focusNode;
  final bool readOnly;
  final String? errorText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? textAlign;
  CustomTextField({
    required this.labelText,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.prefix,
    required this.controller,
    this.onEditingComplete,
    this.onChanged,
    this.focusNode,
    this.readOnly = false,
    this.onTap,
    this.errorText,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.textInputAction,
    this.contentPadding,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        maxLength: maxLength,
        maxLines: maxLines,
        minLines: minLines,
        textInputAction: textInputAction,
        onTap: () => onTap!(),
        readOnly: readOnly,
        enableInteractiveSelection: true,
        onEditingComplete: () => onEditingComplete!(),
        onChanged: (val) => onChanged!(val),
        controller: controller,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        focusNode: focusNode,
        // enabled: enabled,
        textAlign: textAlign ?? TextAlign.start,
        decoration: InputDecoration(
          errorText: errorText,
          prefix: prefix,
          alignLabelWithHint: true,
          labelText: labelText,
          focusColor: Colors.green,
          contentPadding: contentPadding ?? EdgeInsets.fromLTRB(15, 20, 12, 20),
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomSwitchTileEstado extends StatelessWidget {
  CustomSwitchTileEstado({
    required this.estado,
    required this.onChange,
    this.color,
    this.title = "",
    this.subtitleActive = "Activo",
    this.subtitleInactive = "Inactivo",
  });
  final String title;
  final String subtitleActive;
  final String subtitleInactive;

  final Color? color;
  final Function(bool) onChange;
  final bool estado;
  String estadoText = "";
  @override
  Widget build(BuildContext context) {
    estadoText = "";
    estado ? estadoText = subtitleActive : estadoText = subtitleInactive;
    return SwitchListTile(
      activeColor: color ?? Theme.of(context).primaryColor,
      value: estado,
      onChanged: onChange,
      subtitle: Row(
        children: [
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: estado ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(width: 10),
          Text(estadoText),
        ],
      ),
      title: Text(title),
    );
  }
}

class CustomComboSlidePopUp extends StatelessWidget {
  final List<ComboBoxModel> items;
  final String titulo;
  final String noItemMsg;

  CustomComboSlidePopUp({
    required this.items,
    required this.titulo,
    required this.noItemMsg,
  });
  @override
  Widget build(BuildContext context) {
    return SlidePopUp(
      items: items,
      titulo: "Selecciona...",
      noItemsMsg: noItemMsg,
    );
  }
}

class SlidePopUp extends StatelessWidget {
  final List<ComboBoxModel> items;
  final String titulo;
  final String noItemsMsg;
  const SlidePopUp({
    required this.items,
    required this.titulo,
    required this.noItemsMsg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.only(bottom: 20, top: 20, left: 0),
      child: Material(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 40, bottom: 10, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    titulo,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context, null),
                  )
                ],
              ),
            ),
            items.length == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error, color: Colors.red),
                      Container(
                        padding: EdgeInsets.all(30),
                        child: Center(
                          child: Text(noItemsMsg),
                        ),
                      ),
                    ],
                  )
                : Container(),
            ...items.map(
              (e) => _ItemDialog(item: e),
            )
          ],
        ),
      ),
    );
  }
}

class _ItemDialog extends StatelessWidget {
  final ComboBoxModel item;
  const _ItemDialog({required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: item.onTap,
      contentPadding: EdgeInsets.only(left: item.icon == null ? 40 : 20),
      leading: !item.withIcon
          ? Container(
              height: 20,
              width: 20,
              color: item.color,
            )
          : Container(
              padding: EdgeInsets.only(left: 20),
              child: CircleAvatar(
                radius: 20,
                backgroundColor:
                    item.iconBgColor ?? Color(0xff0083cd).withOpacity(0.75),
                child: item.icon ??
                    Center(
                      child: Text(item.texto.substring(0, 2).toUpperCase()),
                    ),
              ),
            ),
      title: Text(item.texto.substring(0, 1).toUpperCase() +
          item.texto.substring(1).toLowerCase()),
    );
  }
}

void showComboSlidePopUp(
  BuildContext context, {
  required List<ComboBoxModel> items,
  required String titulo,
  Widget Function(BuildContext, SheetState)? footerBuilder,
  required String noItemMsg,
}) {
  showSlidingBottomSheet(
    context,
    builder: (context) {
      return SlidingSheetDialog(
        duration: Duration(milliseconds: 250),
        cornerRadius: 20,
        elevation: 0,
        cornerRadiusOnFullscreen: 0,
        margin: EdgeInsets.only(top: 25),
        snapSpec: SnapSpec(
          snap: true,
          snappings: [1],
        ),
        footerBuilder: footerBuilder,
        builder: (context, state) {
          return CustomComboSlidePopUp(
            titulo: titulo,
            items: items,
            noItemMsg: noItemMsg,
          );
        },
      );
    },
  );
}
