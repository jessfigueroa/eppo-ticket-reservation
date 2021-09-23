part of '../__city.dart';

class CreateCityPage extends StatefulWidget {
  @override
  _CreateCityPageState createState() => _CreateCityPageState();
}

class _CreateCityPageState extends State<CreateCityPage> {
  CityBloc? _cityBloc;
  CityModel? _city;
  TextEditingController? _controllerName;
  TextEditingController? _controllerAddress;
  bool? _switchEstado = true;
  LatLng? _latLng;
  FormSubmitTypeState? _type;
  String? _errorName;
  String? _errorAddress;
  String? _title;
  String msg = "";
  // String? msg;
  bool _formValido = false;

  @override
  void initState() {
    _cityBloc = BlocProvider.of<CityBloc>(context);
    _city = _cityBloc!.state.city;
    _controllerName = TextEditingController(
      text: _city?.name ?? "",
    );
    _controllerAddress = TextEditingController(
      text: _city?.address ?? "",
    );
    _latLng = _city?.getLatLng();

    _switchEstado = _city?.status ?? true;
    _formValido = false;
    _title = _city?.isNew ?? true ? "Nuevo Prospecto" : _city?.name;
    _type = _city?.isNew ?? true ? PostType() : UpdateType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CityBloc, CityState>(
      listener: (context, state) async {
        final submitState = state.formSubmitState;
        final submitType = state.formSubmitTypeState;
        switch (submitType.runtimeType) {
          case UpdateType:
            msg = "Guardando cambios...";
            break;
          case PostType:
            msg = "Guardando...";
            break;
          default:
        }
        if (submitType is PostType || submitType is UpdateType) {
          switch (submitState.runtimeType) {
            case SuccessSubmit:
              await showAlertOkIOS(
                context,
                "Correcto!",
                "Se guardó correctamente el local",
              );
              Navigator.pop(context);
              break;
            case ErrorSubmit:
              showAlertOkIOS(
                context,
                "Error!",
                (submitState as ErrorSubmit).errorMsg,
              );
              break;
            default:
          }
        }
      },
      child: BlocBuilder<CityBloc, CityState>(
        builder: (context, state) {
          final sumbitState = state.formSubmitState;
          return Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  title: Text(_title ?? ''),
                ),
                body: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      CustomTextField(
                        labelText: "Nombre",
                        hintText: "",
                        controller: _controllerName!,
                        errorText: _errorName,
                        onChanged: (val) => _validarCampos(val),
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        errorText: _errorAddress,
                        labelText: "Dirección...",
                        hintText: "Av. s/n calle N al costado de...",
                        controller: _controllerAddress!,
                        minLines: 3,
                        onChanged: _validarCampos,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: Container(
                          child: GoogleMap(
                            mapToolbarEnabled: false,
                            zoomControlsEnabled: false,
                            zoomGesturesEnabled: false,
                            scrollGesturesEnabled: false,
                            initialCameraPosition: CameraPosition(
                              target: _latLng!,
                              zoom: 15,
                            ),
                            markers: {
                              Marker(
                                markerId: MarkerId("user_marker"),
                                position: _latLng!,
                              )
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      BotonForm(
                        onPressed: () => _preSaveCity(),
                        text: _TEXT_BTN_SAVE,
                        color: Theme.of(context).primaryColor,
                        enabled: _formValido,
                      )
                    ],
                  ),
                ),
              ),
              sumbitState is Submitting ? LoadingApple(text: msg) : Container(),
            ],
          );
        },
      ),
    );
  }

  _preSaveCity() {
    this._city!.address = this._controllerAddress?.text;
    this._city!.name = this._controllerName?.text;
    this._city!.status = this._switchEstado;

    _saveCity(context, _city!, _type!);
  }

  _validarCampos(String val) {
    _errorName = null;
    _errorAddress = null;
    _formValido = true;

    if (_controllerName!.text.length < 3) {
      _errorName = "La razón social debe tener al menos 3 letras";
      _formValido = false;
    }
    if (_controllerAddress!.text.isEmpty) {
      _errorAddress = "Escribe algo en tus apuntes.";
      _formValido = false;
    }
    setState(() {});
  }
}
