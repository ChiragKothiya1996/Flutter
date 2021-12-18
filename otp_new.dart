class VerificationScreen extends StatefulWidget {
  final String email;
  const VerificationScreen({Key? key, required this.email}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String otp1 = "";
  String otp2 = "";
  String otp3 = "";
  String otp4 = "";
  String otp5 = "";
  String otp6 = "";

  FocusNode focusNodeOtp1 = FocusNode();
  FocusNode focusNodeOtp2 = FocusNode();
  FocusNode focusNodeOtp3 = FocusNode();
  FocusNode focusNodeOtp4 = FocusNode();
  FocusNode focusNodeOtp5 = FocusNode();
  FocusNode focusNodeOtp6 = FocusNode();

  int backspaceClick = 0;
  String otpError = "";
  bool isHideOTP = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GridView.count(
                            crossAxisCount: 8,
                            mainAxisSpacing: 10.0,
                            shrinkWrap: true,
                            primary: false,
                            scrollDirection: Axis.vertical,
                            children: List<Container>.generate(
                              widgetOTPList().length,
                              (int index) => Container(child: widgetOTPList()[index]),
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: 20),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  List<Widget> widgetOTPList() {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 2.0),
        child: Container(
          color: Colors.transparent,
        ),
      ),
      widgetOtpView(focusNodeOtp1, focusNodeOtp2, otp1),
      widgetOtpView(focusNodeOtp2, focusNodeOtp1, otp2),
      widgetOtpView(focusNodeOtp3, focusNodeOtp2, otp3),
      widgetOtpView(focusNodeOtp4, focusNodeOtp3, otp4),
      widgetOtpView(focusNodeOtp5, focusNodeOtp4, otp5),
      widgetOtpView(focusNodeOtp6, focusNodeOtp5, otp6),
      IconButton(
        onPressed: () {
          isHideOTP = !isHideOTP;
          _setState();
        },
        icon: SvgPicture.asset(isHideOTP ? ImageSVG.iconEye : ImageSVG.iconEyeClose, height: 16),
      ),
    ];
  }

  Widget widgetOtpView(FocusNode focusNode, FocusNode previousFocusNode, String otp) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0, left: 5.0),
      child: RawKeyboardListener(
        autofocus: true,
        focusNode: FocusNode(),
        onKey: (event) {
          if (focusNode != focusNodeOtp1) {
            if (event.logicalKey == LogicalKeyboardKey.backspace && otp == "") {
              backspaceClick = backspaceClick + 1;
              if (backspaceClick >= 2) {
                previousFocusNode.requestFocus();
              }
            }
          }
        },
        child: Container(
          alignment: Alignment.center,
          color: const Color.fromRGBO(0, 0, 0, 0.1),
          child: TextField(
            inputFormatters: [LengthLimitingTextInputFormatter(1)],
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 3, color: AppColor.primary),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 3, color: otp.isNotEmpty ? AppColor.primary : AppColor.text2),
              ),
            ),
            keyboardType: TextInputType.number,
            cursorColor: AppColor.primary,
            obscureText: isHideOTP,
            autofocus: true,
            focusNode: focusNode,
            obscuringCharacter: "*",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24.0, color: Colors.black),
            onChanged: (value) {
              backspaceClick = 0;
              if (focusNode == focusNodeOtp1) {
                otp1 = value;
              } else if (focusNode == focusNodeOtp2) {
                otp2 = value;
              } else if (focusNode == focusNodeOtp3) {
                otp3 = value;
              } else if (focusNode == focusNodeOtp4) {
                otp4 = value;
              } else if (focusNode == focusNodeOtp5) {
                otp5 = value;
              } else if (focusNode == focusNodeOtp6) {
                otp6 = value;
              }
              otpError = "";
              _setState();
              if (value.isNotEmpty) {
                if (focusNode == focusNodeOtp1) {
                  focusNodeOtp2.requestFocus();
                } else if (focusNode == focusNodeOtp2) {
                  focusNodeOtp3.requestFocus();
                } else if (focusNode == focusNodeOtp3) {
                  focusNodeOtp4.requestFocus();
                } else if (focusNode == focusNodeOtp4) {
                  focusNodeOtp5.requestFocus();
                } else if (focusNode == focusNodeOtp5) {
                  focusNodeOtp6.requestFocus();
                } else if (focusNode == focusNodeOtp6) {
                  focusNodeOtp6.unfocus();
                }
              }
            },
          ),
        ),
      ),
    );
  }

}
