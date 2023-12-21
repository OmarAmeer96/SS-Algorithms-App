import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_algorithms_app/Core/utils/api_service.dart';
import 'package:ss_algorithms_app/Core/utils/app_state.dart';
import 'package:ss_algorithms_app/Core/utils/show_error_dialog.dart';
import 'package:ss_algorithms_app/Core/utils/show_success_dialog.dart';
import 'package:ss_algorithms_app/Core/utils/styles.dart';
import 'package:ss_algorithms_app/Core/utils/validatiom.dart';
import 'package:ss_algorithms_app/Features/home/views/widgets/affine_algo_item.dart';
import 'package:ss_algorithms_app/Features/home/views/widgets/caesar_item.dart';
import 'package:ss_algorithms_app/Features/home/views/widgets/vigenere_item.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  String? caesarInput;
  int? caesarKey;

  String? vigenereInput;
  String? vigenereKey;

  String? autokeyInput;
  String? autokeyKey;

  String? affineInput;
  int? affineKey1;
  int? affineKey2;

  final _caesarInputController = TextEditingController();
  final _caesarKeyController = TextEditingController();

  final _vigenereInputController = TextEditingController();
  final _vigenereKeyController = TextEditingController();

  // final _autokeyInputController = TextEditingController();
  // final _autokeyKeyController = TextEditingController();

  final _affineInputController = TextEditingController();
  final _affineKey1Controller = TextEditingController();
  final _affineKey2Controller = TextEditingController();

  final _caesarForm = GlobalKey<FormState>();
  final _vigenereForm = GlobalKey<FormState>();
  // final _autokeyForm = GlobalKey<FormState>();
  final _affineForm = GlobalKey<FormState>();

  bool caesarIsLoading = false;
  bool viginereIsLoading = false;
  bool autokeyIsLoading = false;
  bool affineIsLoading = false;

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    final apiService = ApiService(dio);
    dio.options.baseUrl = 'http://mohammedsamy.pythonanywhere.com';

    // ignore: unused_local_variable
    var appState = Provider.of<AppState>(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Algorithms',
                  style: Styles.sFProDisplayBold.copyWith(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _caesarForm,
                child: CaesarItem(
                  onChanged1: (data) {
                    caesarInput = data.toLowerCase();
                  },
                  controller1: _caesarInputController,
                  validator1: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value.';
                    } else if (!validateLowerCase(value)) {
                      return 'Only lowercase letters';
                    }
                    return null;
                  },
                  onChanged2: (data) {
                    if (data.toString().isNotEmpty) {
                      caesarKey = int.parse(data);
                    }
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
                      setState(() {
                        caesarIsLoading = true;
                      });
                      try {
                        var data = await apiService.encryptCaesar({
                          "pt": caesarInput,
                          "k": caesarKey,
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
                        showErrorDialog(
                          context,
                          '$e ${caesarKey!.runtimeType}',
                        );
                      } finally {
                        setState(() {
                          caesarIsLoading = false;
                        });
                      }
                    }
                  },
                  onPressed2: () async {
                    if (_caesarForm.currentState!.validate()) {
                      setState(() {
                        caesarIsLoading = true;
                      });
                      try {
                        var data = await apiService.decryptCaesar({
                          "ct": caesarInput,
                          "k": caesarKey,
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
                        showErrorDialog(
                          context,
                          '$e ${caesarKey!.runtimeType}',
                        );
                      } finally {
                        setState(() {
                          caesarIsLoading = false;
                        });
                      }
                    }
                  },
                  isLoading: caesarIsLoading,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Form(
                key: _vigenereForm,
                child: VigenereItem(
                  onChanged1: (data) {
                    vigenereInput = data.toLowerCase();
                  },
                  controller1: _vigenereInputController,
                  validator1: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value.';
                    } else if (!validateLowerCase(value)) {
                      return 'Only lowercase letters';
                    }
                    return null;
                  },
                  onChanged2: (data) {
                    vigenereKey = data.toString().toLowerCase();
                  },
                  controller2: _vigenereKeyController,
                  validator2: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value.';
                    } else if (!validateKeyLength(vigenereInput!, value)) {
                      return 'Key must be <= input';
                    } else if (!validateLowerCase(value)) {
                      return 'Only lowercase letters allowed';
                    }
                    return null;
                  },
                  text: "Vigenere Cipher",
                  onPressed1: () async {
                    if (_vigenereForm.currentState!.validate()) {
                      setState(() {
                        viginereIsLoading = true;
                      });
                      try {
                        var data = await apiService.encryptVigenere(
                            {"pt": vigenereInput, "k": vigenereKey});
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
                      } finally {
                        setState(() {
                          viginereIsLoading = false;
                        });
                      }
                    }
                  },
                  onPressed2: () async {
                    if (_vigenereForm.currentState!.validate()) {
                      setState(() {
                        viginereIsLoading = true;
                      });
                      try {
                        var data = await apiService.decryptVigenere(
                            {"ct": vigenereInput, "k": vigenereKey});
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
                      } finally {
                        setState(() {
                          viginereIsLoading = false;
                        });
                      }
                    }
                  },
                  isLoading: viginereIsLoading,
                ),
              ),

              // Form(
              //   key: _autokeyForm,
              //   child: AutoKeyItem(
              //     onChanged1: (data) {
              //       autokeyInput = data;
              //     },
              //     controller1: _autokeyInputController,
              //     validator1: (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'Please enter a value.';
              //       } else if (!validateLowerCase(value)) {
              //         return 'Only lowercase letters';
              //       }
              //       return null;
              //     },
              //     onChanged2: (data) {
              //       autokeyKey = data;
              //     },
              //     controller2: _autokeyKeyController,
              //     validator2: (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'Please enter a value.';
              //       } else if (!validateSingleLowerCaseLetter(value)) {
              //         return 'Only one lowercase letter';
              //       }
              //       return null;
              //     },
              //     text: "Autokey Cipher",
              //     onPressed1: () async {
              //       if (_autokeyForm.currentState!.validate()) {
              //         setState(() {
              //           autokeyIsLoading = true;
              //         });
              //         try {
              //           var data = await apiService.encryptAutokey(
              //               {"pt": autokeyInput, "k": autokeyKey});
              //           var decodedData = jsonDecode(data);
              //           // ignore: use_build_context_synchronously
              //           showSuccessDialog(
              //             context,
              //             'Encrypted Text:',
              //             decodedData['message'],
              //           );
              //         } catch (e) {
              //           // ignore: use_build_context_synchronously
              //           showErrorDialog(context, e.toString());
              //         } finally {
              //           setState(() {
              //             autokeyIsLoading = false;
              //           });
              //         }
              //       }
              //     },
              //     onPressed2: () async {
              //       if (_autokeyForm.currentState!.validate()) {
              //         setState(() {
              //           autokeyIsLoading = true;
              //         });
              //         try {
              //           var data = await apiService.decryptAutokey(
              //               {"ct": autokeyInput, "k": autokeyKey});
              //           var decodedData = jsonDecode(data);
              //           // ignore: use_build_context_synchronously
              //           showSuccessDialog(
              //             context,
              //             'Decrypted Text:',
              //             decodedData['message'],
              //           );
              //         } catch (e) {
              //           // ignore: use_build_context_synchronously
              //           showErrorDialog(context, e.toString());
              //         } finally {
              //           setState(() {
              //             autokeyIsLoading = false;
              //           });
              //         }
              //       }
              //     },
              //     isLoading: autokeyIsLoading,
              //   ),
              // ),
              const SizedBox(
                height: 16,
              ),
              Form(
                key: _affineForm,
                child: AffineAlgoItem(
                  onChanged1: (data) {
                    affineInput = data.toLowerCase();
                  },
                  controller1: _affineInputController,
                  validator1: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value.';
                    } else if (!validateLowerCase(value)) {
                      return 'Only lowercase letters';
                    }
                    return null;
                  },
                  onChanged2: (data) {
                    if (data.isNotEmpty) {
                      affineKey1 = int.parse(data);
                    }
                  },
                  controller2: _affineKey1Controller,
                  validator2: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value.';
                    } else if (!validateRelativelyPrimeWith26(
                        int.parse(value))) {
                      return 'gcd($value, 26) != 1';
                    }
                    return null;
                  },
                  onChanged3: (data) {
                    if (data.isNotEmpty) {
                      affineKey2 = int.parse(data);
                    }
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
                    if (_affineForm.currentState!.validate()) {
                      setState(() {
                        affineIsLoading = true;
                      });
                      try {
                        var data = await apiService.encryptAffine({
                          "pt": affineInput,
                          "k1": affineKey1,
                          "k2": affineKey2,
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
                      } finally {
                        setState(() {
                          affineIsLoading = false;
                        });
                      }
                    }
                  },
                  onPressed2: () async {
                    if (_affineForm.currentState!.validate()) {
                      setState(() {
                        affineIsLoading = true;
                      });
                      try {
                        var data = await apiService.decryptAffine({
                          "ct": affineInput,
                          "k1": affineKey1,
                          "k2": affineKey2,
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
                      } finally {
                        setState(() {
                          affineIsLoading = false;
                        });
                      }
                    }
                  },
                  isLoading: affineIsLoading,
                ),
              ),
              const SizedBox(
                height: 56,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
