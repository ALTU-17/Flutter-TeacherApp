import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teacherapp/common/customDropDown.dart';
import 'package:teacherapp/config/utils.dart';
import 'package:teacherapp/features/auth/models/teacher_user.dart';

import '../../auth/auth.dart';

class TeacherProfileView extends HookConsumerWidget {
  const TeacherProfileView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final auth = ref.watch(authProvider).requireValue;
    final authP = ref.read(authProvider.notifier);
    final key = useTextFieldGlobalKey();
    onImagepick() {}
    final List<String> qualifications = [
      'HSc',
      'M.Sc',
      'MSE',
      'BPharm',
      'B.Com',
      'M.Phil',
      'MCA',
      'M Com',
      'BCA',
      'DCE',
      'MBA',
      'M.LIS',
      'BE',
      'B.Sc',
      'B.A',
      'PGDBM',
      'M.A',
      'B.LIS',
      'BCS',
      'B.Music n Dance',
      'Qual',
    ];

    final List<String> profSubjects = ['D.Ed', 'B.Ed', 'M.Ed', 'Others'];
    final List<String> trainingStatuses = [
      'completed',
      'ongoing',
      'Not Started'
    ];
    final List<String> genderOptions = ['male', 'female', 'Other'];
    final List<String> bloodGroups = ['O+', 'A+'];

    final Set<String> selectedQualifications = {'B.Com', 'M.A'};
    final image = useState<XFile?>(null);
    onUpdate() {
      if (key.currentState?.saveAndValidate() ?? false) {
        Utils.debLog(key.currentState?.value);
        authP.profileUpdate(
            TeacherDetails.fromJson(key.currentState?.value ?? {}));
      } else {
        Utils.toast("Field is requred");
      }
    }

    Widget buildProfilePicture() {
      final auth = ref.watch(authProvider).requireValue;
      final authP = ref.watch(authProvider.notifier);
      final imageName = auth.teacherDetails?.teacherImageName;
      final url =
          '${auth.teacherVerification?.projectUrl}uploads/teacher_image/$imageName';
      Utils.debLog(url);
      onImagePick() async {
        final ImagePicker picker = ImagePicker();
        final XFile? im = await picker.pickImage(source: ImageSource.gallery);
        if (im == null) return;
        image.value = im;
        await authP.profileImageUpload(File(im.path));
      }

      return Center(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            // CircleAvatar(
            //   radius: 70.r,
            //   child: FormBuilderImagePicker(
            //     name: 'image',
            //     showDecoration: false,
            //     maxImages: 1,
            //     backgroundColor: Colors.transparent,
            //   ),
            // ),
            //https://sms.arnoldcentralschool.org/SACSv4test/uploads/teacher_image/kritika.jpg
            CircleAvatar(
              radius: 70.r,
              backgroundImage: image.value != null
                  ? FileImage(File(image.value!.path))
                  : NetworkImage(url),
            ),
            InkWell(
              onTap: onImagePick,
              child: CircleAvatar(
                radius: 18.r,
                backgroundColor: Colors.grey.shade300,
                child: const Icon(Icons.add, color: Colors.black),
              ),
            ),
          ],
        ),
      );
    }

    Widget buildQualificationsSection() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                children: [
                  const TextSpan(text: 'Academic Qualification'),
                  TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.red, fontSize: 14.sp)),
                ],
              ),
            ),
          ),
          FormBuilderFilterChips(
            name: 'academic_qual',
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            options: qualifications
                .map((item) => FormBuilderChipOption(
                      value: item,
                      child: Text(item, style: TextStyle(fontSize: 12.sp)),
                    ))
                .toList(),
            initialValue: [auth.teacherDetails?.academicQual ?? ''],
            selectedColor: Colors.blue.shade100,
            valueTransformer: (value) => value?.join(","),
            spacing: 5.w,
            runSpacing: 1.h,
            alignment: WrapAlignment.start,
            checkmarkColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
              side: BorderSide(color: Colors.grey.shade400),
            ),
            validator: (value) => (value == null || value.isEmpty)
                ? 'Please select at least one'
                : null,
          ),
          SizedBox(height: 10.h),
        ],
      );
    }

    Utils.debLog(auth.teacherDetails?.professionalQual);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFCB0D4C), Color(0xFF5094CB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 130, bottom: 15),
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 10, spreadRadius: 2),
              ],
            ),
            child: SingleChildScrollView(
              child: FormBuilder(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildProfilePicture(),
                    SizedBox(height: 30.h),
                    _buildRowField(
                      'Staff\'s Name',
                      auth.teacherDetails?.name ?? '',
                      isRequired: true,
                      'name',
                    ),
                    _buildRowField(
                        //'Date of Birth', '05-07-2014',
                        'Date of Birth',
                        auth.teacherDetails?.birthday ?? '',
                        isRequired: true,
                        "birthday",
                        readOnly: true),
                    _buildRowField(
                        'Date of Joining',
                        auth.teacherDetails?.dateOfJoining ?? '',
                        readOnly: true,
                        // '01-04-2020',
                        isRequired: true,
                        "date_of_joining"),
                    _buildRowField(
                      'Designation',
                      auth.teacherDetails?.designation ?? '',
                      "designation",
                    ),
                    //'Teacher'),
                    buildQualificationsSection(),

                    // ),
                    CustomDropdownField(
                      label: 'Professional Qualification',
                      options: profSubjects,

                      isRequired: true,
                      // initialValue: 'B.Ed',
                      initialValue: auth.teacherDetails?.professionalQual ?? '',
                      name: 'professional_qual',
                    ),

                    _buildRowField(
                      isRequired: true,
                      'Subject for D.Ed/B.Ed',
                      auth.teacherDetails?.specialSub ?? '',
                      'special_sub',
                    ),
                    CustomDropdownField(
                      label: 'Training Status',
                      options: trainingStatuses,
                      isRequired: true,
                      initialValue: auth.teacherDetails?.trained ?? '',
                      name: 'trained',
                    ),
                    _buildRowField('Experience',
                        auth.teacherDetails?.experience ?? '', "experience",
                        isRequired: true),

                    CustomDropdownField(
                      label: 'Gender',
                      options: genderOptions,
                      isRequired: true,
                      initialValue: auth.teacherDetails?.sex ?? '',
                      name: 'sex',
                    ),
                    CustomDropdownField(
                      label: 'Blood Group',
                      options: bloodGroups,
                      isRequired: true,
                      initialValue: auth.teacherDetails?.bloodGroup ?? '',
                      name: 'blood_group',
                    ),
                    _buildRowField('Religion',
                        auth.teacherDetails?.religion ?? '', "religion",
                        isRequired: true),
                    _buildRowField('Address',
                        auth.teacherDetails?.address ?? '', "address",
                        isRequired: true),
                    _buildRowField('Mobile Number',
                        auth.teacherDetails?.phone ?? '', "phone",
                        isRequired: true),
                    _buildRowField(
                        'Email ID', auth.teacherDetails?.email ?? '', "email",
                        isRequired: true),
                    _buildRowField(
                        'Aadhar Card No.',
                        auth.teacherDetails?.aadharCardNo ?? '',
                        "aadhar_card_no",
                        isRequired: true),
                    SizedBox(height: 10.h),

                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 12.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r)),
                          backgroundColor: const Color(0xFF4E9DDE),
                        ),
                        onPressed: onUpdate,
                        child: Text(
                          'Update',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRowField(String label, String value, String name,
      {bool isRequired = false, bool readOnly = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 130.w,
            child: RichText(
              text: TextSpan(
                text: label,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.5.sp,
                    color: Colors.black),
                children: isRequired
                    ? [
                        TextSpan(
                            text: ' *',
                            style:
                                TextStyle(color: Colors.red, fontSize: 14.sp))
                      ]
                    : [],
              ),
            ),
          ),
          Expanded(
            child: FormBuilderTextField(
              initialValue: value,
              readOnly: readOnly,
              decoration: InputDecoration(
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r)),
              ),
              style: TextStyle(fontSize: 12.sp),
              name: name,
            ),
          ),
        ],
      ),
    );
  }
}
