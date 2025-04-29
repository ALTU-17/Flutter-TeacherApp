import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:teacherapp/common/styles.dart';
import 'package:teacherapp/config/utils.dart';
import 'package:teacherapp/features/auth/providers/providers.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _showPassword = useState(false);
    final auth = ref.watch(authProvider);
    final authP = ref.read(authProvider.notifier);
    final key = useTextFieldGlobalKey();
    onLogin() {
      if (key.currentState?.saveAndValidate() ?? false) {
      final password = key.currentState!.value['password'];
     authP.login(password);
    } else {
    Utils.toast("Field is requred");
    }
     
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(
              255, 207, 9, 75), // Change to match your theme
          elevation: 0, // Removes the shadow
          title: Row(
            children: [
              Image.asset(
                'assets/logo.png', // School logo path
                height: 28, // Adjust size
              ),
              const SizedBox(width:20), // Space between logo and text
              const Text(
                'SACS EvolvU Smart Teacher App', // School name
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/img.png', // Background image
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: FormBuilder(
                key: key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Image.asset(
                      'assets/passwordPage.png',
                      // 'assets/ex.png', // Another image
                      width: 320.w,
                      height: 390.h,
                    ),
                    const SizedBox(height: 90),
                
                    /// **Username Field**
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: FormBuilderTextField(
                        name: 'username',
                        readOnly: true,
                        initialValue:
                            auth.requireValue.teacherVerification?.userId,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.person_outline),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                
                    /// **Password Field**
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: FormBuilderTextField(
                        name: "password",
                        obscureText: !_showPassword.value,
                        validator: FormBuilderValidators.required(errorText: "             Field is required"),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(Icons.lock_outline),
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _showPassword.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              _showPassword.value = !_showPassword.value;
                            },
                          ),
                        ),
                      ),
                    ),
                    //const SizedBox(height: 10),
                
                    /// **Forgot Password Button**
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Add forgot password functionality here
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                
                    /// **Login Button**
                    GestureDetector(
                      onTap: () {
                        //                Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (_) => TeacherDashboardScreen()),
                        // );
                        // Handle login button press
                      },
                      child: InkWell(
                        onTap: onLogin,
                        child: Container(
                          height: 40,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text('Login', style: AppStyles.buttonText),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
