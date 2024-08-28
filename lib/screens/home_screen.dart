import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/auth/app_authentication.dart';
import 'package:flutter_application_1/screens/home_nav_bar.dart';
import 'package:flutter_application_1/widgets/coustom_text_form_fild.dart';
import 'package:flutter_application_1/widgets/custom_elevated_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var EmailController = TextEditingController();
  var IDController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              Text: 'Email',
              controller: EmailController, //at5zn hna al email aly al user ktbo
              hintText: 'University Email',
              label: ' Email',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Email is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            CustomTextFormField(
              Text: 'ID',
              hintText: 'University ID ',
              label: 'ID',
              keyboardType: TextInputType.number,
              controller: IDController, //at5zn hna al id aly al user ktbo
              validator: (value) {
                if (value!.isEmpty) {
                  return 'ID is required';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            customElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  // al code aly hytnfz ba3d ma user das submit
                  AppAuthentication.home(
                      Email: EmailController!.text,
                      ID: IDController!.text,
                      context: null);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeNavBar(),
                      ));
                }
              },
              text: 'Submit',
            ),
          ],
        ),
      ),
    ));
  }
}
