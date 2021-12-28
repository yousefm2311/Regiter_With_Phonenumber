// ignore_for_file: deprecated_member_use, avoid_print, sized_box_for_whitespace

import 'package:animate_do/animate_do.dart';
import 'verification.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterWithPhoneNumber extends StatefulWidget {
  const RegisterWithPhoneNumber({Key? key}) : super(key: key);

  @override
  _RegisterWithPhoneNumberState createState() =>
      _RegisterWithPhoneNumberState();
}

class _RegisterWithPhoneNumberState extends State<RegisterWithPhoneNumber> {
  final TextEditingController controller = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: const Text("Register",
          //     style: TextStyle(color: Colors.black, fontSize: 25)),
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white38,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(40),
            width: double.infinity,
            //height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeInDown(
                  delay: const Duration(milliseconds: 100),
                  child: Image.asset(
                    "assets/images/Asset 28.png",
                    fit: BoxFit.cover,
                    width: 240,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 150),
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.grey.shade900),
                  ),
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 200),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20),
                    child: Text(
                      'Enter your phone number to continu, we will send you OTP to verifiy.',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade700),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 400),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.black.withOpacity(0.25)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffeeeeee),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle:
                              const TextStyle(color: Colors.black),
                          textFieldController: controller,
                          formatInput: false,
                          maxLength: 12,
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true, decimal: false),
                          cursorColor: Colors.black,
                          inputDecoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(bottom: 15, left: 0),
                            border: InputBorder.none,
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                                color: Colors.grey.shade500, fontSize: 16),
                          ),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        ),
                        Positioned(
                          left: 90,
                          top: 8,
                          bottom: 8,
                          child: Container(
                            height: 40,
                            width: 1,
                            color: Colors.black.withOpacity(0.13),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 600),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    onPressed: () {
                      setState(() {
                        _isLoading = true;
                      });
                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          _isLoading = false;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Verificatoin()));
                      });
                    },
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: _isLoading
                        ? Container(
                            width: 20,
                            height: 20,
                            child: const CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              color: Colors.black,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            "Request OTP ",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 800),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      const SizedBox(
                        width: 0,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
