part of 'widgets.dart';

class CircularImageAvatar extends StatelessWidget {
  final String fotoUri;
  const CircularImageAvatar(this.fotoUri);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(122),
              // child: Image.network(fotoUri, fit: BoxFit.fill),
              child: fotoUri.length == 0
                  ? Image.asset(IMG_PROFILE_DEFAULT)
                  : Image.network(fotoUri, fit: BoxFit.fill),
            ),
          ),
        ),
      ),
    );
  }
}
