import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_algorithms_app/Core/utils/app_state.dart';
import 'package:ss_algorithms_app/Core/utils/request.dart';
import 'package:ss_algorithms_app/Core/utils/show_error_dialog.dart';
import 'package:ss_algorithms_app/Core/utils/show_success_dialog.dart';
import 'package:ss_algorithms_app/Features/home/views/widgets/affine_algo_item.dart';
import 'package:ss_algorithms_app/Features/home/views/widgets/algorithm_item.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  String? caesarInput;
  String? caesarKey;

  String? vigenereInput;
  String? vigenereKey;

  String? autokeyInput;
  String? autokeyKey;

  String? affineInput;
  String? affineKey1;
  String? affineKey2;

  final _caesarInputController = TextEditingController();
  final _caesarKeyController = TextEditingController();

  final _vigenereInputController = TextEditingController();
  final _vigenereKeyController = TextEditingController();

  final _autokeyInputController = TextEditingController();
  final _autokeyKeyController = TextEditingController();

  final _affineInputController = TextEditingController();
  final _affineKey1Controller = TextEditingController();
  final _affineKey2Controller = TextEditingController();

  final _caesarForm = GlobalKey<FormState>();
  final _vigenereForm = GlobalKey<FormState>();
  final _autokeyForm = GlobalKey<FormState>();
  final _affineForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Current IP:\n[ ${appState.baseUrl} ]',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: _caesarForm,
                  child: AlgorithmItem(
                    maxInputLength: 100,
                    maxKeyLength: 100,
                    onChanged1: (data) {
                      caesarInput = data;
                    },
                    controller1: _caesarInputController,
                    validator1: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value.';
                      }
                      return null;
                    },
                    onChanged2: (data) {
                      caesarKey = data;
                    },
                    controller2: _caesarKeyController,
                    validator2: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value.';
                      }
                      return null;
                    },
                    text: "Caesar Cipher",
                    onPressed1: () async {
                      if (_caesarForm.currentState!.validate()) {
                        try {
                          var data = await postData(
                              '${appState.baseUrl}/caesarEncryption',
                              {'pt': caesarInput!, 'k': caesarKey!});
                          var decodedData = jsonDecode(data);
                          // ignore: use_build_context_synchronously
                          showSuccessDialog(
                            context,
                            'Encrypted Text:',
                            decodedData['message'],
                          );
                        } catch (e) {
                          // ignore: use_build_context_synchronously
                          showErrorDialog(context, e.toString());
                        }
                      }
                    },
                    onPressed2: () async {
                      if (_caesarForm.currentState!.validate()) {
                        try {
                          var data = await postData(
                              '${appState.baseUrl}/caesarDecryption',
                              {'ct': caesarInput!, 'k': caesarKey!});
                          var decodedData = jsonDecode(data);
                          // ignore: use_build_context_synchronously
                          showSuccessDialog(
                            context,
                            'Decrypted Text:',
                            decodedData['message'],
                          );
                        } catch (e) {
                          // ignore: use_build_context_synchronously
                          showErrorDialog(context, e.toString());
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Form(
                  key: _vigenereForm,
                  child: AlgorithmItem(
                    maxInputLength: 100,
                    maxKeyLength: 100,
                    onChanged1: (data) {
                      vigenereInput = data;
                    },
                    controller1: _vigenereInputController,
                    validator1: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value.';
                      }
                      return null;
                    },
                    onChanged2: (data) {
                      vigenereKey = data;
                    },
                    controller2: _vigenereKeyController,
                    validator2: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value.';
                      }
                      return null;
                    },
                    text: "Vigenere Cipher",
                    onPressed1: () async {
                      if (_caesarForm.currentState!.validate()) {
                        try {
                          var data = await postData(
                              '${appState.baseUrl}/vigenereEncryption',
                              {'pt': vigenereInput!, 'k': vigenereKey!});
                          var decodedData = jsonDecode(data);
                          // ignore: use_build_context_synchronously
                          showSuccessDialog(
                            context,
                            'Encrypted Text:',
                            decodedData['message'],
                          );
                        } catch (e) {
                          // ignore: use_build_context_synchronously
                          showErrorDialog(context, e.toString());
                        }
                      }
                    },
                    onPressed2: () async {
                      if (_caesarForm.currentState!.validate()) {
                        try {
                          var data = await postData(
                              '${appState.baseUrl}/vigenereDecryption',
                              {'ct': vigenereInput!, 'k': vigenereKey!});
                          var decodedData = jsonDecode(data);
                          // ignore: use_build_context_synchronously
                          showSuccessDialog(
                            context,
                            'Decrypted Text:',
                            decodedData['message'],
                          );
                        } catch (e) {
                          // ignore: use_build_context_synchronously
                          showErrorDialog(context, e.toString());
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Form(
                  key: _autokeyForm,
                  child: AlgorithmItem(
                    maxInputLength: 100,
                    maxKeyLength: 1,
                    onChanged1: (data) {
                      autokeyInput = data;
                    },
                    controller1: _autokeyInputController,
                    validator1: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value.';
                      }
                      return null;
                    },
                    onChanged2: (data) {
                      autokeyKey = data;
                    },
                    controller2: _autokeyKeyController,
                    validator2: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value.';
                      }
                      return null;
                    },
                    text: "Autokey Cipher",
                    onPressed1: () async {
                      if (_caesarForm.currentState!.validate()) {
                        try {
                          var data = await postData(
                              '${appState.baseUrl}/autokeyEncryption',
                              {'pt': autokeyInput!, 'k': autokeyKey!});
                          var decodedData = jsonDecode(data);
                          // ignore: use_build_context_synchronously
                          showSuccessDialog(
                            context,
                            'Encrypted Text:',
                            decodedData['message'],
                          );
                        } catch (e) {
                          // ignore: use_build_context_synchronously
                          showErrorDialog(context, e.toString());
                        }
                      }
                    },
                    onPressed2: () async {
                      if (_caesarForm.currentState!.validate()) {
                        try {
                          var data = await postData(
                              '${appState.baseUrl}/autokeyDecryption',
                              {'ct': autokeyInput!, 'k': autokeyKey!});
                          var decodedData = jsonDecode(data);
                          // ignore: use_build_context_synchronously
                          showSuccessDialog(
                            context,
                            'Decrypted Text:',
                            decodedData['message'],
                          );
                        } catch (e) {
                          // ignore: use_build_context_synchronously
                          showErrorDialog(context, e.toString());
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Form(
                  key: _affineForm,
                  child: AffineAlgoItem(
                    onChanged1: (data) {
                      affineInput = data;
                    },
                    controller1: _affineInputController,
                    validator1: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value.';
                      }
                      return null;
                    },
                    onChanged2: (data) {
                      affineKey1 = data;
                    },
                    controller2: _affineKey1Controller,
                    validator2: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value.';
                      }
                      return null;
                    },
                    onChanged3: (data) {
                      affineKey2 = data;
                    },
                    controller3: _affineKey2Controller,
                    validator3: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value.';
                      }
                      return null;
                    },
                    text: "Affine Cipher",
                    onPressed1: () async {
                      if (_caesarForm.currentState!.validate()) {
                        try {
                          var data = await postData(
                              '${appState.baseUrl}/affineEncryption', {
                            'pt': affineInput!,
                            'k1': affineKey1!,
                            'k2': affineKey2!
                          });
                          var decodedData = jsonDecode(data);
                          // ignore: use_build_context_synchronously
                          showSuccessDialog(
                            context,
                            'Encrypted Text:',
                            decodedData['message'],
                          );
                        } catch (e) {
                          // ignore: use_build_context_synchronously
                          showErrorDialog(context, e.toString());
                        }
                      }
                    },
                    onPressed2: () async {
                      if (_caesarForm.currentState!.validate()) {
                        try {
                          var data = await postData(
                              '${appState.baseUrl}/affineDecryption', {
                            'ct': affineInput!,
                            'k1': affineKey1!,
                            'k2': affineKey2!
                          });
                          var decodedData = jsonDecode(data);
                          // ignore: use_build_context_synchronously
                          showSuccessDialog(
                            context,
                            'Decrypted Text:',
                            decodedData['message'],
                          );
                        } catch (e) {
                          // ignore: use_build_context_synchronously
                          showErrorDialog(context, e.toString());
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
