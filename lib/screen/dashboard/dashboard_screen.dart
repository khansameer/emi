import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:emi_calculation/core/common/common_text_widget.dart';
import 'package:emi_calculation/core/image_path/image_path.dart';
import 'package:emi_calculation/core/preference_helper.dart';
import 'package:emi_calculation/screen/authentication/login/login_screen.dart';
import 'package:emi_calculation/screen/dashboard/bloc/dashboard_event.dart';
import 'package:emi_calculation/screen/dashboard/bloc/dashboard_state.dart';
import 'package:emi_calculation/screen/dashboard/bloc/emi_bloc.dart';
import 'package:emi_calculation/screen/dashboard/component/step_one_component.dart';
import 'package:emi_calculation/screen/dashboard/model/emi_model.dart';
import 'package:emi_calculation/theme/ThemeChangerWidget.dart';
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return commonBgView(
        actions: [
          commonInkWell(
              onTap: () {
                ThemeChangerWidget.of(context).changeTheme();
              },
              child: commonSetAssetImage(
                  image: icLogOut, width: thirty, height: thirty)),
          const SizedBox(
            width: fifteen,
          ),
          commonInkWell(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              await PreferenceHelper.clear();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
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
                  widget: StepOneComponent(
                    size: size,
                    model: model,
                  ));
            },
            child: Container(
              height: ninety,
              decoration: BoxDecoration(
                  color: colorButtons, borderRadius: BorderRadius.circular(25)),
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
