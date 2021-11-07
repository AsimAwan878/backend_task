import 'package:dummy_task/constants.dart';
import 'package:dummy_task/views/custom_widget/custom_button.dart';
import 'package:dummy_task/views/custom_widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum VerificationState {
  showMainScreen,
  showFormScreen,
}

class UseScreen extends StatefulWidget {
  const UseScreen({Key? key}) : super(key: key);

  @override
  State<UseScreen> createState() => _UseScreenState();
}

class _UseScreenState extends State<UseScreen> {
  VerificationState currentState = VerificationState.showMainScreen;

  bool showLoading = false;

  final List<Map> _listItem = [
    {
      'userPlaneName': 'Hunza Plane',
      'userPlanePrice': "500000",
      'userPlaneDescription':
          'Planing a hunza trip this summer is very scenic plus i also have time so i must go there.',
      'userPlaneDuration': '10 days',
    },
    {
      'userPlaneName': 'Tour di swat',
      'userPlanePrice': "300000",
      'userPlaneDescription':
          'Planing a Swat trip this winter is very scenic plus i also have time so i must go to see jewel of KPK.',
      'userPlaneDuration': '10 days',
    },
    {
      'userPlaneName': 'Tour di swat',
      'userPlanePrice': "300000",
      'userPlaneDescription':
          'Planing a Swat trip this winter is very scenic plus i also have time so i must go to see jewel of KPK.',
      'userPlaneDuration': '10 days',
    },
  ];
  final planeTitleController = TextEditingController();
  final planePriceController = TextEditingController();
  final planeDescriptionController = TextEditingController();
  final planeDurationController = TextEditingController();

  getMainScreen(context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        SizedBox(
          width: sizeWidth(context),
          height: sizeWidth(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: _listItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.5),
                      child: GestureDetector(
                        onTap: () {
                          // Get.to(ChatInnerScreen(
                          //   imageIndex: _userlList[index]
                          //   ["userProfileImage"],
                          //   title: _userlList[index]["userTitle"],
                          //   subtitle: "Last seen today 4:30 pm",
                          // ));
                        },
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 1,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Row(
                            children: <Widget>[
                              const SizedBox(
                                width: 12.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  const Spacer(),
                                  SizedBox(
                                    width: sizeWidth(context) / 1.2,
                                    child: Row(
                                      children: [
                                        Text(
                                          _listItem[index]['userPlaneDuration'],
                                          style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black38,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          _listItem[index]['userPlaneName'],
                                          style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "\$ " +
                                              _listItem[index]
                                                  ['userPlanePrice'],
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black38,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  const Spacer(),
                                  SizedBox(
                                    width: sizeWidth(context) / 1.2,
                                    child: Center(
                                      child: Text(
                                        _listItem[index]
                                            ['userPlaneDescription'],
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black38,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.add_outlined,
                size: 30.0,
                color: Colors.white,
              ),
              onPressed: () async {
                setState(() {
                  currentState = VerificationState.showFormScreen;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  getNewPlane(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: SizedBox(
            width: sizeWidth(context) / 1.2,
            child: const Text("Enter Plane Title"),
          ),
        ),
        SizedBox(
          width: sizeWidth(context) / 1.2,
          child: CustomTextFormField(
            controller: planeTitleController,
            keyBoardType: TextInputType.name,
            isObscure: false,
            hintText: "",
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: SizedBox(
            width: sizeWidth(context) / 1.2,
            child: const Text("Enter Plane Description"),
          ),
        ),
        SizedBox(
            width: sizeWidth(context) / 1.2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 2,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              width: sizeWidth(context) / 1.2,
              child: TextFormField(
                controller: planeDescriptionController,
                minLines: 5,
                maxLines: 5,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                  ),
                ),
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: SizedBox(
            width: sizeWidth(context) / 1.2,
            child: const Text("For How Many Days"),
          ),
        ),
        SizedBox(
          width: sizeWidth(context) / 1.2,
          child: CustomTextFormField(
            controller: planeDurationController,
            keyBoardType: TextInputType.name,
            isObscure: false,
            hintText: "",
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: SizedBox(
            width: sizeWidth(context) / 1.2,
            child: const Text("Estimated Money"),
          ),
        ),
        SizedBox(
          width: sizeWidth(context) / 1.2,
          child: CustomTextFormField(
            controller: planePriceController,
            keyBoardType: TextInputType.name,
            isObscure: false,
            hintText: "",
          ),
        ),
        const Spacer(),
        SizedBox(
          width: sizeWidth(context) / 1.2,
          child: CustomButton(
            onPress: () async {
              setState(() {
                currentState = VerificationState.showMainScreen;
              });
            },
            textColor: primaryColor,
            buttonText: "Submit".toUpperCase(),
            buttonColor: Colors.white,
          ),
        ),
        const Spacer(),
        const Spacer(),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: showLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : currentState == VerificationState.showMainScreen
                ? getMainScreen(context)
                : getNewPlane(context),
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}
