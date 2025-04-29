import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart'
    show FormBuilderValidators;
import 'package:go_router/go_router.dart';
import 'package:teacherapp/common/styles.dart';
import 'package:teacherapp/config/utils.dart';
import 'package:teacherapp/features/auth/providers/auth_provider.dart';
import 'package:teacherapp/router/routers.dart';

class TeacherVerificationView extends ConsumerStatefulWidget {
  const TeacherVerificationView({super.key});

  @override
  ConsumerState<TeacherVerificationView> createState() =>
      _TeacherVerificationViewState();
}

class _TeacherVerificationViewState
    extends ConsumerState<TeacherVerificationView> {
  final _formKey = GlobalKey<FormBuilderState>();
/*
  Future<void> onNext() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final username = _formKey.currentState!.value['username'];
      final authP = ref.read(authProvider.notifier);
      final res = await authP.validateTeacher(username);
      if (res) return context.pushReplacement(LoginRoute().location);
    
    }
     else {
      print('userrname is invalid');
    }
    //dimple
     final key = useTextFieldGlobalKey();
    onNext() {

      if (key.currentState?.saveAndValidate() ?? false) {
      final username = key.currentState!.value['uaername'];
    // authP.login(username);

    } 
    else {
    Utils.toast("Field is requred");
    }
     
    }
    
  }*/
  ////
  
  Future<void> onNext() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final username = _formKey.currentState!.value['username'];
      final authP = ref.read(authProvider.notifier);

      try {
        final res = await authP.validateTeacher(username);
        if (res) {
          // ignore: use_build_context_synchronously
          context.pushReplacement(LoginRoute().location);
        } else {
          Utils.toast("Invalid username. Please check and try again.");
        }
      } catch (e) {
        Utils.toast("Username wrong. Enter a Vaild Username.");
      }
    } else {
      Utils.toast("Username field is required.");
    }
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/img.png', fit: BoxFit.cover),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Image.asset('assets/logo.png', width: 200, height: 140),
                  SizedBox(height: 15),
                  Image.asset('assets/loginPage.png',
                      width: 350.w, height: 450.h),
                  SizedBox(height: 40.h),
                  FormBuilder(
                    key: _formKey,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: FormBuilderTextField(
                        name: 'username',
                        decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.person_outline),
                          border: InputBorder.none,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: "              This field is required")
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(height: 35),
                  Container(
                    height: 40,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: onNext,
                      child: TextButton(
                        onPressed: onNext,
                        child: Text('Next', style: AppStyles.buttonText),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'aceventuraservices@gmail.com',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
