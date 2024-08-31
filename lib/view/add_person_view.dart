import 'package:dynmic_forms/core/constens.dart';
import 'package:dynmic_forms/core/utils/widgets/custom_button.dart';
import 'package:dynmic_forms/core/utils/widgets/custom_textformfield.dart';
import 'package:dynmic_forms/models/person_model.dart';
import 'package:dynmic_forms/view/home_view.dart';
import 'package:flutter/material.dart';

class AddPersonView extends StatefulWidget {
  const AddPersonView({super.key});

  @override
  State<AddPersonView> createState() => _AddPersonViewState();
}

class _AddPersonViewState extends State<AddPersonView> {
  final List<TextEditingController> controllers = [TextEditingController()];
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
            const Text(
              'Hobbies',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: controllers.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Row(
                  children: [
                    Expanded(
                        child: CustomTextFormFeild(
                      label: 'Hobby',
                      controller: controllers[index],
                    )),
                    if (index != 0)
                      IconButton(
                          onPressed: () {
                            setState(() {
                              controllers[index].clear();
                              controllers[index].dispose();
                              controllers.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.indigo,
                          )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            controllers.add(TextEditingController());
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.indigo,
                        ))
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
                persons.add(PersonModel(
                  name: nameController.text,
                  hobbies: controllers
                      .map((e) => e.text)
                      .where((element) => element.isNotEmpty)
                      .toList(),
                ));
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
