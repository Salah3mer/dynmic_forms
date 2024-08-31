import 'package:dynmic_forms/core/constens.dart';
import 'package:dynmic_forms/core/utils/widgets/custom_button.dart';
import 'package:dynmic_forms/core/utils/widgets/custom_textformfield.dart';
import 'package:dynmic_forms/models/teacher_model.dart';
import 'package:dynmic_forms/view/home_view.dart';
import 'package:flutter/material.dart';

class TeacherView extends StatefulWidget {
  const TeacherView({super.key});

  @override
  State<TeacherView> createState() => _TeacherViewState();
}

class _TeacherViewState extends State<TeacherView> {
  final List<TextEditingController> classNumbersControllers = [
    TextEditingController()
  ];
  final List<TextEditingController> classSubjectControllers = [
    TextEditingController()
  ];
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Person'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextFormFeild(
              label: 'Name',
              controller: nameController,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Classes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        classNumbersControllers.add(TextEditingController());
                        classSubjectControllers.add(TextEditingController());
                      });
                    },
                    child: const Text(
                      'Add Classes',
                      style: TextStyle(color: Colors.indigo),
                    ))
              ],
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: classNumbersControllers.length,
                itemBuilder: (context, index) => Row(
                  children: [
                    Expanded(
                        child: CustomTextFormFeild(
                      label: 'Class Number',
                      textInputType: TextInputType.number,
                      controller: classNumbersControllers[index],
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: CustomTextFormFeild(
                      label: 'Subject',
                      controller: classSubjectControllers[index],
                    )),
                    if (index != 0)
                      IconButton(
                          onPressed: () {
                            setState(() {
                              classNumbersControllers[index].clear();
                              classNumbersControllers[index].dispose();
                              classNumbersControllers.removeAt(index);
                              classSubjectControllers[index].clear();
                              classSubjectControllers[index].dispose();
                              classSubjectControllers.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.indigo,
                          )),
                  ],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              onTap: () {
                List<ClassModel> classes = [];
                for (var i = 0; i < classNumbersControllers.length; i++) {
                  final classnum = classNumbersControllers[i].text;
                  final classSubjext = classSubjectControllers[i].text;
                  if (classnum.isNotEmpty && classSubjext.isNotEmpty) {
                    classes.add(ClassModel(
                        classNumber: num.parse(classnum),
                        subject: classSubjext));
                  }
                }

                //add teachers
                teachers.add(
                    TeacherModel(name: nameController.text, classes: classes));

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ));
              },
              text: 'Add',
            )
          ],
        ),
      ),
    );
  }
}
