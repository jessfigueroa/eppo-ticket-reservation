part of 'utils.dart';

getCurrentSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

getCurrentHeight(BuildContext context, double? percentage) {
  percentage = percentage ?? 1.0;
  return MediaQuery.of(context).size.height * percentage;
}

getCurrentWidth(BuildContext context, double? percentage) {
  percentage = percentage ?? 1.0;
  return MediaQuery.of(context).size.width * percentage;
}
