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

    List<Widget> widgetList = [
      Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 2.0),
        child: Container(
          color: Colors.transparent,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 5.0, left: 5.0),
        child: Container(
          alignment: Alignment.center,
          color: const Color.fromRGBO(0, 0, 0, 0.1),
          child: TextField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 3, color: AppColor.primary),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 3, color: otp1.isNotEmpty ? AppColor.primary : AppColor.text),
              ),
            ),
            cursorColor: AppColor.primary,
            obscureText: isHideOTP,
            autofocus: true,
            focusNode: focusNodeOtp1,
            obscuringCharacter: "*",
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 24.0, color: Colors.black),
            onChanged: (value) {
              setState(() {
                otp1 = value;
                otpError = "";
              });
              if (value.isNotEmpty) {
                focusNodeOtp2.requestFocus();
              }
            },
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 5.0, left: 5.0),
        child: RawKeyboardListener(
          autofocus: true,
          focusNode: FocusNode(),
          onKey: (event) {
            if (event.logicalKey == LogicalKeyboardKey.backspace && otp2 == "") {
              backspaceClick = backspaceClick + 1;
              if (backspaceClick >= 2) {
                focusNodeOtp1.requestFocus();
              }
            }
          },
          child: Container(
            alignment: Alignment.center,
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            child: TextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
              ],
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: AppColor.primary),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: otp2.isNotEmpty ? AppColor.primary : AppColor.text),
                ),
              ),
              keyboardType: TextInputType.number,
              cursorColor: AppColor.primary,
              autofocus: true,
              focusNode: focusNodeOtp2,
              obscureText: isHideOTP,
              obscuringCharacter: "*",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24.0, color: Colors.black),
              onChanged: (value) {
                backspaceClick = 0;
                setState(() {
                  otp2 = value;
                  otpError = "";
                });
                if (value.isNotEmpty) {
                  focusNodeOtp3.requestFocus();
                }
              },
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 5.0, left: 5.0),
        child: RawKeyboardListener(
          autofocus: true,
          focusNode: FocusNode(),
          onKey: (event) {
            if (event.logicalKey == LogicalKeyboardKey.backspace && otp3 == "") {
              backspaceClick = backspaceClick + 1;
              if (backspaceClick >= 2) {
                focusNodeOtp2.requestFocus();
              }
            }
          },
          child: Container(
            alignment: Alignment.center,
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            child: TextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
              ],
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: AppColor.primary),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: otp3.isNotEmpty ? AppColor.primary : AppColor.text),
                ),
              ),
              cursorColor: AppColor.primary,
              obscureText: isHideOTP,
              autofocus: true,
              keyboardType: TextInputType.number,
              focusNode: focusNodeOtp3,
              obscuringCharacter: "*",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24.0, color: Colors.black),
              onChanged: (value) {
                backspaceClick = 0;
                setState(() {
                  otp3 = value;
                  otpError = "";
                });
                if (value.isNotEmpty) {
                  focusNodeOtp4.requestFocus();
                }
              },
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 5.0, left: 5.0),
        child: RawKeyboardListener(
          autofocus: true,
          focusNode: FocusNode(),
          onKey: (event) {
            if (event.logicalKey == LogicalKeyboardKey.backspace && otp4 == "") {
              backspaceClick = backspaceClick + 1;
              if (backspaceClick >= 2) {
                focusNodeOtp3.requestFocus();
              }
            }
          },
          child: Container(
            alignment: Alignment.center,
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            child: TextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
              ],
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: AppColor.primary),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: otp4.isNotEmpty ? AppColor.primary : AppColor.text),
                ),
              ),
              keyboardType: TextInputType.number,
              cursorColor: AppColor.primary,
              obscureText: isHideOTP,
              autofocus: true,
              focusNode: focusNodeOtp4,
              obscuringCharacter: "*",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24.0, color: Colors.black),
              onChanged: (value) {
                backspaceClick = 0;
                setState(() {
                  otp4 = value;
                  otpError = "";
                });
                if (value.isNotEmpty) {
                  focusNodeOtp5.requestFocus();
                }
              },
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 5.0, left: 5.0),
        child: RawKeyboardListener(
          autofocus: true,
          focusNode: FocusNode(),
          onKey: (event) {
            if (event.logicalKey == LogicalKeyboardKey.backspace && otp5 == "") {
              backspaceClick = backspaceClick + 1;
              if (backspaceClick >= 2) {
                focusNodeOtp4.requestFocus();
              }
            }
          },
          child: Container(
            alignment: Alignment.center,
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            child: TextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
              ],
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: AppColor.primary),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: otp5.isNotEmpty ? AppColor.primary : AppColor.text),
                ),
              ),
              cursorColor: AppColor.primary,
              obscureText: isHideOTP,
              autofocus: true,
              keyboardType: TextInputType.number,
              focusNode: focusNodeOtp5,
              obscuringCharacter: "*",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24.0, color: Colors.black),
              onChanged: (value) {
                backspaceClick = 0;
                setState(() {
                  otp5 = value;
                  otpError = "";
                });
                if (value.isNotEmpty) {
                  focusNodeOtp6.requestFocus();
                }
              },
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 5.0, left: 5.0),
        child: RawKeyboardListener(
          autofocus: true,
          focusNode: FocusNode(),
          onKey: (event) {
            if (event.logicalKey == LogicalKeyboardKey.backspace && otp6 == "") {
              backspaceClick = backspaceClick + 1;
              if (backspaceClick >= 2) {
                focusNodeOtp5.requestFocus();
              }
            }
          },
          child: Container(
            alignment: Alignment.center,
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            child: TextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
              ],
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: AppColor.primary),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: otp6.isNotEmpty ? AppColor.primary : AppColor.text),
                ),
              ),
              keyboardType: TextInputType.number,
              cursorColor: AppColor.primary,
              obscureText: isHideOTP,
              autofocus: true,
              focusNode: focusNodeOtp6,
              obscuringCharacter: "*",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24.0, color: Colors.black),
              onChanged: (value) {
                backspaceClick = 0;
                setState(() {
                  otp6 = value;
                  otpError = "";
                });
                if (value.isNotEmpty) {
                  focusNodeOtp6.unfocus();
                }
              },
            ),
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          setState(() {
            isHideOTP = !isHideOTP;
          });
        },
        icon: SvgPicture.asset(isHideOTP ? ImageSVG.iconEye : ImageSVG.iconEyeClose, height: 16),
      ),
      // Padding(
      //   padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      //   child: Container(
      //     color: Colors.transparent,
      //   ),
      // ),
    ];

    return Scaffold(
      appBar: null,
      bottomNavigationBar: isPortrait
          ? SvgPicture.asset(
              ImageSVG.bottomCurves,
              width: screenSize.width,
            )
          : Container(
              height: 2,
            ),
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
                              widgetList.length,
                              (int index) => Container(child: widgetList[index]),
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

}
