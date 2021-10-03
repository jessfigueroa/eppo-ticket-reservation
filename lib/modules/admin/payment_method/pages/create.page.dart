part of '../__payment.dart';

class CreatePaymentPage extends StatefulWidget {
  @override
  _CreatePaymentPageState createState() => _CreatePaymentPageState();
}

class _CreatePaymentPageState extends State<CreatePaymentPage> {
  PaymentmethodBloc? _paymentmethodBloc;
  PaymentModel? _payment;
  TextEditingController? _controllerName;
  bool? _switchEstado = true;
  FormSubmitTypeState? _type;
  String? _errorName;
  String? _title;
  String msg = "";
  // String? msg;
  bool _formValido = false;

  @override
  void initState() {
    _paymentmethodBloc = BlocProvider.of<PaymentmethodBloc>(context);
    _payment = _paymentmethodBloc!.state.payment;
    _controllerName = TextEditingController(
      text: _payment?.name ?? "",
    );
    _switchEstado = _payment?.status ?? true;
    _formValido = false;
    _title = _payment?.isNew ?? true ? "Nuevo método de pago" : _payment?.name;
    _type = _payment?.isNew ?? true ? PostType() : UpdateType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentmethodBloc, PaymentmethodState>(
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
                "Se guardó correctamente el método de pago",
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
      child: BlocBuilder<PaymentmethodBloc, PaymentmethodState>(
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
                      CustomSwitchTileEstado(
                        title: '',
                        estado: _switchEstado!,
                        subtitleActive: 'Activo',
                        subtitleInactive: 'Inactivo',
                        onChange: _changeStatusTile,
                      ),
                      SizedBox(height: 10),
                      BotonForm(
                        onPressed: () => _preSavePayment(),
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

  _changeStatusTile(bool status) {
    _switchEstado = status;
    _validarCampos('validate');
  }
  // #2c3e50
  //#DCE35B

  _preSavePayment() {
    this._payment!.name = this._controllerName?.text;
    this._payment!.status = this._switchEstado!;
    _savePayment(context, _payment!, _type!);
  }

  _validarCampos(String val) {
    _errorName = null;
    _formValido = true;
    if (_controllerName!.text.length < 3) {
      _errorName = "La razón social debe tener al menos 3 letras";
      _formValido = false;
    }
    setState(() {});
  }
}
