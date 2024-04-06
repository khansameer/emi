import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:emi_calculation/core/common/common_text_widget.dart';
import 'package:emi_calculation/core/common/common_textfield.dart';
import 'package:emi_calculation/core/image_path/image_path.dart';
import 'package:emi_calculation/core/preference_helper.dart';
import 'package:emi_calculation/screen/authentication/login/login_screen.dart';
import 'package:emi_calculation/screen/dashboard/bloc/dashboard_event.dart';
import 'package:emi_calculation/screen/dashboard/bloc/dashboard_state.dart';
import 'package:emi_calculation/screen/dashboard/bloc/emi_bloc.dart';
import 'package:emi_calculation/screen/dashboard/component/step_one_component.dart';
import 'package:emi_calculation/screen/dashboard/model/emi_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return DashboardScreenState();
  }
}

class DashboardScreenState extends State<DashboardScreen> {
  final EMIBloc emiBloc = EMIBloc();
  EMIModel? emiModel;
  @override
  void initState() {
    emiBloc.add(GetEMIList());
    super.initState();
  }

  PopupMenuItem buildPopupMenuItem(
      {String? title, String? icon, String? value}) {
    return PopupMenuItem(
      value: value ?? "hindi",
      child: Row(
        children: [
          commonSetAssetImage(
              color: Colors.black,
              image: icon ?? icHindi,
              width: thirty,
              height: thirty),
          CommonTextWidget(
            left: twenty,
            text: title ?? "Hindi",
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return commonBgView(
        color: Colors.white,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == "light") {
                setState(() {});
                AdaptiveTheme.of(context).setLight();
                saveTheme(value: false);
              } else {
                setState(() {});
                AdaptiveTheme.of(context).setDark();
                saveTheme(value: true);
              }
            },
            color: Colors.white,
            child: commonSetAssetImage(
                image: icThemes, width: thirtyFive, height: thirtyFive),
            itemBuilder: (ctx) => [
              buildPopupMenuItem(
                  title: "Light", icon: icEnglish, value: "light"),
              buildPopupMenuItem(title: "Dark", icon: icEnglish, value: "dark"),
            ],
          ),
          const SizedBox(
            width: fifteen,
          ),
          PopupMenuButton(
            onSelected: (value) {
              print('======$value');
              if (value == "hindi") {
                context.setLocale(const Locale('hi'));
                saveLanguage(language: "hindi");
              } else {
                context.setLocale(const Locale('en'));
                saveLanguage(language: "english");
              }
            },
            color: Colors.white,
            child: commonSetAssetImage(
                image: icLanguage, width: twentyFive, height: twentyFive),
            itemBuilder: (ctx) => [
              buildPopupMenuItem(),
              buildPopupMenuItem(
                  title: "English", icon: icEnglish, value: "english"),
            ],
          ),
          const SizedBox(
            width: fifteen,
          ),
          commonInkWell(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              await PreferenceHelper.clear();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false);
            },
            child: commonSetAssetImage(
                image: icLogOut, width: thirty, height: thirty),
          ),
          const SizedBox(
            width: fifteen,
          ),
        ],
        context: context,
        child: Scaffold(
          body: BlocProvider(
              create: (_) => emiBloc,
              child:
                  BlocListener<EMIBloc, EMIState>(listener: (context, state) {
                if (state is EMIError) {}
              }, child: BlocBuilder<EMIBloc, EMIState>(
                builder: (BuildContext context, state) {
                  if (state is EMIInitial) {
                    return _buildLoading();
                  } else if (state is EMILoading) {
                    return _buildLoading();
                  } else if (state is EMILoaded) {
                    emiModel = state.emiModel;
                    return commonView(size: size, model: state.emiModel);
                  }
                  return Container();
                },
              ))),
        ));
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  commonView({required Size size, required EMIModel model}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.center,
          child: commonInkWell(
            onTap: () {
              showModalBottomSheetDialog(
                  context: context,
                  size: size,
                  onClose: () {},
                  widget: StepOneComponent(
                    size: size,
                    model: model,
                  ));
            },
            child: Container(
              height: ninety,
              decoration: const BoxDecoration(
                  color: colorButtons,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Center(
                child: CommonTextWidget(
                  text: 'apply_loan'.tr(),
                  fontWeight: FontWeight.w600,
                  fontSize: sixteen,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
