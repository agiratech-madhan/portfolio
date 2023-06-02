import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_flutter/src/utils/src/helpers/ui_dimens.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

final _formKey = GlobalKey<FormState>();

class ContactSection extends HookConsumerWidget {
  const ContactSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final phoneNumberController = useTextEditingController();
    final emailController = useTextEditingController();
    final subjectController = useTextEditingController();
    final messageController = useTextEditingController();
    // final nameValue = useValueListenable(nameController);
    // final phoneValue = useValueListenable(phoneNumberController);
    // final emaiValue = useValueListenable(emailController);
    // final subjectValue = useValueListenable(subjectController);
    // final messageValue = useValueListenable(messageController);

    // useEffect(() {
    //   nameController.text = nameValue.text;
    //   emailController.text = emaiValue.text;
    //   phoneNumberController.text = phoneValue.text;
    //   subjectController.text = subjectValue.text;
    //   messageController.text = messageValue.text;
    // }, [nameValue, phoneValue, emaiValue, subjectValue, messageValue]);

    return Container(
      constraints: BoxConstraints(
        minWidth: context.screenWidth * 0.4,
        maxWidth: context.screenWidth * 0.66,
        minHeight: context.screenHeight * 0.2,
      ),
      margin: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              color: Colors.orange,
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.orange)),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Lets Built Something better",
                    style:
                        GoogleFonts.openSans(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    "Together",
                    style:
                        GoogleFonts.openSans(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              Container(
                  width: 500,
                  // height: 600,
                  child: Lottie.asset('assets/json/data.json')),
              Text(
                "K.Madhan",
                style: GoogleFonts.openSans(fontSize: 20, color: Colors.white),
              ),
              Text(
                "A Flutter Developer",
                style: GoogleFonts.openSans(fontSize: 20, color: Colors.white),
              ),
              Row(
                children: [
                  // Container(
                  //   child: Column(
                  //     children: [
                  //       TextButton(
                  //         // icon: Icon(
                  //         //   Icons.home,
                  //         //   color: Colors.orange,
                  //         // ),
                  //         onPressed: () {},
                  //         child: Text(
                  //           "Home",
                  //           style: GoogleFonts.openSans(color: Colors.white),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.github,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      final String url =
                          "https://github.com/agiratech-madhan?tab=repositories";

                      await launchUrl(Uri.parse(url));
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      await launchUrl(
                        Uri.parse("https://www.linkedin.com/in/madhan-k-/"),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.email_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      String? encodeQueryParameters(
                          Map<String, String> params) {
                        return params.entries
                            .map((MapEntry<String, String> e) =>
                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                            .join('&');
                      }

                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'madhan.k@agiratech.com',
                        query: encodeQueryParameters(<String, String>{
                          'subject': 'Example Subject & Symbols are allowed!',
                        }),
                      );

                      launchUrl(emailLaunchUri);
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.instagram,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          Form(
            key: _formKey,
            child: Column(children: [
              Row(
                children: [
                  Container(
                    width: 340,
                    margin: EdgeInsets.only(top: 30),
                    child: TextFormField(
                      controller: nameController,
                      textDirection: TextDirection.ltr,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Required';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      style: GoogleFonts.openSans(
                          color: Colors.white, fontSize: 17),
                      decoration: commonDecoration("Enter your Name "),
                    ),
                  ),
                  Container(
                      width: 340,
                      margin: EdgeInsets.only(top: 30, left: 30),
                      child: TextFormField(
                        style: GoogleFonts.openSans(
                            color: Colors.white, fontSize: 17),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '*Required';
                          }
                          return null;
                        },
                        controller: phoneNumberController,
                        decoration: commonDecoration("Phone Number"),
                      )),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 30),
                  width: 710,
                  child: TextFormField(
                    style:
                        GoogleFonts.openSans(color: Colors.white, fontSize: 17),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: commonDecoration("Enter your Email"),
                  )),
              Container(
                  width: 710,
                  margin: EdgeInsets.only(top: 30),
                  child: TextFormField(
                    style:
                        GoogleFonts.openSans(color: Colors.white, fontSize: 17),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },
                    controller: subjectController,
                    decoration: commonDecoration("Subject"),
                  )),
              Container(
                  width: 710,
                  margin: EdgeInsets.only(top: 30, bottom: 20),
                  child: TextFormField(
                    style:
                        GoogleFonts.openSans(color: Colors.white, fontSize: 17),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },
                    maxLines: 5,
                    controller: messageController,
                    decoration: commonDecoration("Message"),
                  )),
              Container(
                  width: 710,
                  height: 50,
                  margin: EdgeInsets.only(top: 30, bottom: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.black),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          log("${nameController.text}"
                              "${emailController.text}"
                              "${messageController.text}");
                          final values = await sendEmail(nameController.text,
                              emailController.text, messageController.text);
                          // //TODO: send email
                          nameController.clear();
                          emailController.clear();
                          phoneNumberController.clear();
                          messageController.clear();
                          subjectController.clear();
                          print(values);
                        }
                        // await FlutterEmailSender.send(emailData);
                      },
                      child: Text('Send Message'))),
            ]),
          )
        ],
      ),
    );
  }
}

InputDecoration commonDecoration(String value) {
  return InputDecoration(
      hintText: value,
      hintStyle: TextStyle(color: Colors.white),
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.orange,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.orange,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.orange,
        ),
      ),
      fillColor: Colors.black);
}

Future sendEmail(String name, String email, String message) async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  const serviceId = 'service_a9lo892';
  const templateId = 'template_amce8yp';
  const userId = '_DbPHqYlc1GewkHd9';
  final response = await http.post(url,
      headers: {
        'Content-Type': 'application/json'
      }, //This line makes sure it works for all platforms.
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'from_name': name,
          'from_email': email,
          'message': message
        }
      }));
  return response.statusCode;
}
