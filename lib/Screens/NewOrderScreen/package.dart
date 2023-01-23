import 'package:borzo_app/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class Package extends StatefulWidget {
  const Package({super.key});

  @override
  State<Package> createState() => _PackageState();
}

class _PackageState extends State<Package> {
  List item = [
    'Documents',
    'Food',
    'Cloth',
    'Groceries',
    'Flower',
    'Cake',
  ];

  TextEditingController itemController = TextEditingController();
  TextEditingController parcelValueController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Package',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SizedBox(
                  height: 60,
                  child: TextField(
                    cursorColor: const Color(0xff0048ff),
                    controller: itemController,
                    decoration: const InputDecoration(
                      label: Text('What are you sending?'),
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff0048ff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
                child: ScrollConfiguration(
                  behavior: const MaterialScrollBehavior()
                      .copyWith(overscroll: false),
                  child: ListView.builder(
                    itemCount: item.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            itemController.text = item[index];
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              item[index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 5),
                child: CustomTextFormField(
                  textController: parcelValueController,
                  isnumber: true,
                  lableText: 'Parcel Value',
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: const [
              Expanded(
                child: Text(
                  'We will compensate the value of lost item within three working days according to the rules. Maximum compensation - 50,000',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 5, left: 20),
          child: CustomTextFormField(
            textController: phoneNumberController,
            isnumber: true,
            lableText: 'Phone',
          ),
        ),
      ],
    );
  }

  // Widget itemContainer(String itemType, double containerWidth) {
  //   return Container(
  //     margin: const EdgeInsets.only(right: 5),
  //     decoration: BoxDecoration(
  //         color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
  //     //height: 40,
  //     width: containerWidth,
  //     child: Center(
  //       child: Text(
  //         itemType,
  //       ),
  //     ),
  //   );
  // }
}
