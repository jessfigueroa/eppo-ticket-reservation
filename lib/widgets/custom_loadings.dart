part of 'widgets.dart';

class LoadingApple extends StatelessWidget {
  final text;
  LoadingApple({@required this.text});
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black.withOpacity(0.6),
        child: Center(
          child: CupertinoAlertDialog(
            title: Text(text),
            content: Container(
              padding: EdgeInsets.all(10),
              child: CupertinoActivityIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
