// import 'package:advanced_textfield/advanced_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';

import '../controllers/ze_me_form_controller.dart';
import 'tf_validators.dart';
class ZeMeFormView extends StatefulWidget {
  const ZeMeFormView({super.key});

  @override
  State<ZeMeFormView> createState() => _ZeMeFormViewState();
}

class _ZeMeFormViewState extends State<ZeMeFormView>with TfValidators {
  final ZeMeFormController controller = Get.put(ZeMeFormController());

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController pinController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey22 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey33 = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  @override
  void dispose() {
    Get.delete<ZeMeFormController>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Demo')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                      keyboardType: TextInputType.text,
                      controller: usernameController,
                      decoration: const InputDecoration(
                          hintText: "Username", labelText: "Enter your Username"),
                      validator: validateUsername),
                  TextFormField(
                      keyboardType: TextInputType.text,
                      controller: pinController,
                      decoration: const InputDecoration(
                          hintText: "Enter your PIN", labelText: "PIN"),
                      validator: validatePIN),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                      onPressed: () {
                        // Check if all form fields are validated with each validators
                        if (!(_formKey.currentState!.validate())) {
                          return;
                        }
                      },
                      child: const Text("Submit Application"))
                ],
              ),
            ),
          ),
          FormBuilder(
            key: _formKey22,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                    name: 'email',
                    decoration: const InputDecoration(labelText: 'Email'),
                    // validator: FormBuilderValidators.compose([
                    //   FormBuilderValidators.required(),
                    //   FormBuilderValidators.email(),
                    // ]),
                  ),
                  FormBuilderTextField(
                    name: 'password',
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                    // validator: FormBuilderValidators.compose([
                    //   FormBuilderValidators.required(),
                    //   FormBuilderValidators.minLength(8),
                    // ]),
                  ),
                  FormBuilderDateTimePicker(
                    name: 'date_of_birth',
                    inputType: InputType.date,
                    decoration: const InputDecoration(labelText: 'Date of Birth'),
                    // validator: FormBuilderValidators.required(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // if (_formKey.currentState!.saveAndValidate()) {
                      //   final formData = _formKey.currentState!.value;
                      //   // Process the form data
                      // }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
          FormBuilder(
            key: _formKey33,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  // AdvancedTextfield(
                  //   hintText: "Enter your email",
                  //   labelText:"Email",
                  //   controller: _emailController,
                  //   isEmail: true,
                  //   errorMessage: "Invalid email format",
                  // ),
                  ElevatedButton(
                    onPressed: () {

                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


