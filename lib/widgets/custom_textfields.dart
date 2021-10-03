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
    this.subtitleActive = "",
    this.subtitleInactive = "",
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
