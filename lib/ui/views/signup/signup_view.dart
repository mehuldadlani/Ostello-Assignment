import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ostello_assignment/file_exporter.dart';
import 'package:ostello_assignment/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

part 'signup_viewmodel.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      viewModelBuilder: () => SignupViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(5),
              child: Container(
                color: appBarBg,
                height: 5.hWise,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Let\'s Onboard You!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.hWise,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: appPurple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.only(top: 10.hWise),
                  height: 5.hWise,
                  width: 100.wWise,
                ),
              ],
            ),
            backgroundColor: appBarBg,
            elevation: 0,
            actions: [
              Image.asset(
                'assets/coin.png',
                height: 100.hWise,
                width: 100.wWise,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.wWise),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  20.hGap,
                  Text(
                    'Full Name',
                    style: TextStyle(fontSize: 16.hWise, color: Colors.grey),
                  ),
                  10.hGap,
                  SizedBox(
                    height: 60.hWise,
                    width: context.w,
                    child: TextField(
                      onChanged: (value) => model.updateFullName(value),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffF1F0F2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        suffixIcon: Visibility(
                          visible: model.showNameTick,
                          child: Padding(
                              padding: EdgeInsets.only(right: 10.wWise),
                              child: Image.asset('assets/tick.png')),
                        ),
                        suffixIconConstraints: BoxConstraints(
                          maxHeight: 30.hWise,
                          maxWidth: 30.wWise,
                        ),
                      ),
                    ),
                  ),
                  20.hGap,
                  Text(
                    'Phone Number',
                    style: TextStyle(fontSize: 16.hWise, color: Colors.grey),
                  ),
                  10.hGap,
                  SizedBox(
                    height: 60.hWise,
                    width: context.w,
                    child: TextField(
                      onChanged: (value) => model.updatePhoneNumber(value),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffF1F0F2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        prefix: Text(
                          '🇮🇳 +91 |  ',
                          style: TextStyle(
                              fontSize: 16.hWise, color: Colors.black),
                        ),
                        suffixIcon: Visibility(
                          visible: model.showNumberTick,
                          child: Padding(
                              padding: EdgeInsets.only(right: 10.wWise),
                              child: Image.asset('assets/tick.png')),
                        ),
                        suffixIconConstraints: BoxConstraints(
                          maxHeight: 30.hWise,
                          maxWidth: 30.wWise,
                        ),
                      ),
                    ),
                  ),
                  20.hGap,
                  20.hGap,
                  Text(
                    'Select Class',
                    style: TextStyle(fontSize: 16.hWise, color: Colors.grey),
                  ),
                  10.hGap,
                  SizedBox(
                    height: 50.hWise, // Set the desired height here
                    child: DropdownMenu(
                      dropdownMenuEntries: model.classes,
                      enabled: true,
                      textStyle:
                          TextStyle(fontSize: 16.hWise, color: Colors.black),
                      width: context.w - 40.wWise,
                      inputDecorationTheme: InputDecorationTheme(
                        filled: true,
                        fillColor: const Color(0xffF1F0F2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  40.hGap,
                  Text(
                    'Select Stream',
                    style: TextStyle(fontSize: 16.hWise, color: Colors.grey),
                  ),
                  10.hGap,
                  SizedBox(
                    height: 40.hWise, // Set the desired height here
                    child: DropdownMenu(
                      controller: model.streamController,
                      dropdownMenuEntries: model.streams,
                      width: context.w - 40.wWise,
                      inputDecorationTheme: InputDecorationTheme(
                        filled: true,
                        fillColor: const Color(0xffF1F0F2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  40.hGap,
                  Text(
                    'Choose subjects that you have',
                    style: TextStyle(fontSize: 16.hWise, color: Colors.grey),
                  ),
                  20.hGap,
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontSize: 16.hWise, color: Colors.black),
                            filled: true,
                            fillColor: const Color(0xffF1F0F2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: model.selectedSubject.isEmpty
                                ? model.streamController.text
                                : '', // Remove hint text when subjects are selected
                            focusedBorder: OutlineInputBorder(
                              borderRadius: model._isSubjectsExpanded
                                  ? const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    )
                                  : BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: model._isSubjectsExpanded
                                  ? const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    )
                                  : BorderRadius.circular(10),
                              borderSide: model._isSubjectsExpanded
                                  ? const BorderSide(color: Colors.transparent)
                                  : const BorderSide(color: Colors.transparent),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                model._isSubjectsExpanded
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down,
                              ),
                              onPressed: model.toggleSubjectsExpansion,
                            ),
                          ),
                          // Use RichText to style different parts of the text differently
                          controller: TextEditingController(
                            text: model.selectedSubjects.length <= 2
                                ? model.selectedSubjects.join(', ')
                                : '${model.selectedSubjects.take(2).join(', ')} + ${model.selectedSubjects.length - 2} more',
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (model._isSubjectsExpanded)
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: Color(0xffF1F0F2),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Divider(),
                          if (model.selectedSubjects.isNotEmpty)
                            Padding(
                              padding: EdgeInsets.only(left: 15.wWise),
                              child: Text(
                                'Selected Subjects',
                                style: TextStyle(
                                  fontSize: 12.hWise,
                                  color: Colors.grey,
                                ),
                              ),
                            ).alignCL,
                          if (model.selectedSubjects.isNotEmpty)
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: model.selectedSubjects.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(model.selectedSubjects[index]),
                                  trailing: GestureDetector(
                                    onTap: () {
                                      model.addSubject(model.selectedSubjects[index]);
                                      model.removeSelectedSubject(
                                          model.selectedSubjects[index]);
                                      
                                    },
                                    child: const ImageIcon(
                                      AssetImage('assets/remove.png'),
                                      color: Colors.red,
                                    ),
                                  ),
                                );
                              },
                            ),
                          if (model.selectedSubjects.isNotEmpty)
                            const Divider(),
                          if (model.selectedSubjects.isNotEmpty)
                            Padding(
                              padding: EdgeInsets.only(left: 15.wWise),
                              child: Text(
                                'All Subjects',
                                style: TextStyle(
                                  fontSize: 12.hWise,
                                  color: Colors.grey,
                                ),
                              ),
                            ).alignCL,
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: model.subjects.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(model.subjects[index]),
                                trailing: GestureDetector(
                                    onTap: () {
                                      model.setSelectedSubject(
                                          model.subjects[index]);
                                      model
                                          .removeSubject(model.subjects[index]);
                                    },
                                    child: const ImageIcon(
                                      AssetImage(
                                        'assets/add.png',
                                      ),
                                      color: Colors.green,
                                    )),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  40.hGap,
                  Text(
                    'Select School',
                    style: TextStyle(fontSize: 16.hWise, color: Colors.grey),
                  ),
                  10.hGap,
                  SizedBox(
                    height: 40.hWise, // Set the desired height here
                    child: DropdownMenu(
                      dropdownMenuEntries: model.schools,
                      width: context.w - 40.wWise,
                      inputDecorationTheme: InputDecorationTheme(
                        filled: true,
                        fillColor: const Color(0xffF1F0F2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  40.hGap,
                  Text(
                    'Gender',
                    style: TextStyle(fontSize: 16.hWise, color: Colors.grey),
                  ),
                  10.hGap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: ListTile(
                          trailing: Text('Male',
                              style: TextStyle(
                                  fontSize: 12.hWise,
                                  color: Colors
                                      .black)), // Adjust font size and color
                          leading: Radio<int>(
                            value: 1,
                            groupValue: model.selectedOption,
                            activeColor:
                                appPurple, // Change the active radio button color here
                            fillColor: MaterialStateProperty.all(
                                appPurple), // Change the fill color when selected
                            splashRadius:
                                10, // Change the splash radius when clicked
                            onChanged: (int? value) {
                              model.setSelectedOption(value!);
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child: ListTile(
                          trailing: Text('Female',
                              style: TextStyle(
                                  fontSize: 12.hWise,
                                  color: Colors
                                      .black)), // Adjust font size and color
                          leading: Radio<int>(
                            value: 2,
                            groupValue: model.selectedOption,
                            activeColor:
                                appBarBg, // Change the active radio button color here
                            fillColor: MaterialStateProperty.all(
                                appPurple), // Change the fill color when selected
                            splashRadius:
                                25, // Change the splash radius when clicked
                            onChanged: (int? value) {
                              model.setSelectedOption(value!);
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child: ListTile(
                          trailing: Text('Other',
                              style: TextStyle(
                                  fontSize: 12.hWise,
                                  color: Colors
                                      .black)), // Adjust font size and color
                          leading: Radio<int>(
                            value: 3,
                            groupValue: model.selectedOption,
                            activeColor:
                                appBarBg, // Change the active radio button color here
                            fillColor: MaterialStateProperty.all(
                                appPurple), // Change the fill color when selected
                            splashRadius:
                                10, // Change the splash radius when clicked
                            onChanged: (int? value) {
                              model.setSelectedOption(value!);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  40.hGap,
                  Text(
                    'Refferal Code (Optional)',
                    style: TextStyle(fontSize: 16.hWise, color: Colors.grey),
                  ),
                  10.hGap,
                  SizedBox(
                    height: 60.hWise,
                    width: context.w,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffF1F0F2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  40.hGap,
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.wWise),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: appPurple,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    height: 60.hWise,
                    child: Center(
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.hWise,
                        ),
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(appPurple),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
                10.hGap,
                RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.hWise,
                    ),
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: appPurple,
                          fontSize: 16.hWise,
                        ),
                      ),
                    ],
                  ),
                ),
                20.hGap,
              ],
            ),
          )),
    );
  }
}
