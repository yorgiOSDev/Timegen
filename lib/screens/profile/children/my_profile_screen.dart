import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_template/services/my_profile_service.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../router/route_utils.dart';
import '../../../utils/alert/alert.dart';
import '../../../utils/alert/awesome_snack_bar_utils.dart';
import '../../../utils/constants.dart';
import '../../../utils/responsive/responsive_layout.dart';
import '../../../widgets/drawer_widget.dart';
import '../../../widgets/toggle_switch_theme_widget.dart';

import 'package:http/http.dart' as http;

class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({super.key});
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final String _fromTitle = 'screens.profile.children.myProfile.change_password';
  final String _prefixFromLabel = 'screens.profile.children.myProfile.form';
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      drawer:
          !ResponsiveLayout.isDesktop(context) ? const DrawerWidget() : null,
      body: CustomScrollView(
        physics: ResponsiveLayout.isDesktop(context)
            ? const NeverScrollableScrollPhysics()
            : null,
        slivers: [
          SliverAppBar(
            title: Text(context.tr(SCREENS.myProfile.toTitle)),
            pinned: true,
            actions: [
            ],
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: Consumer<MyProfileService>(
              builder: (context, state, child) => FormBuilder(
                key: _formKey,
                enabled: state.isFromEnabled,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(context.tr(_fromTitle),
                                  style: theme.textTheme.titleMedium!
                                      .copyWith(fontWeight: FontWeight.bold)),
                              IconButton(
                                  onPressed: () => {
                                    state
                                        .changeFormEnabled(!state.isFromEnabled)
                                  },
                                  icon: const Icon(AppDefaultIcons.edit))
                            ],
                          ),
                          const SizedBox(height: AppStyleDefaultProperties.h),
                          FormBuilderTextField(
                            name: 'password',
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: context.tr('$_prefixFromLabel.password'),
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.minLength(8),
                              FormBuilderValidators.required(),
                            ]),
                          ),
                          const SizedBox(height: 8),
                          FormBuilderTextField(
                              name: 'confirmPassword',
                              controller: passwordConfirmController,
                              decoration: InputDecoration(
                                labelText: context.tr('$_prefixFromLabel.confirm_password'),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.minLength(8),
                                FormBuilderValidators.required(),
                              ])
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    )
                  )
                ),
              ),
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        Consumer<MyProfileService>(
          builder: (context, state, child) => state.isFromEnabled
              ? Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(AppThemeColors.failure),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
                          ),
                          onPressed: () {
                            state.changeFormEnabled(false);
                            passwordController.text = "";
                            passwordConfirmController.text = "";
                          },
                          child: Text(context.tr('$_prefixFromLabel.cancel'))),
                    ),
                    const SizedBox(width: AppStyleDefaultProperties.w),
                    Expanded(
                      child: FilledButton(
                          onPressed: () async {
                            late SnackBar snackBar;
                            if (_formKey.currentState!.saveAndValidate()) {
                             var result = await changePassword(passwordController.text, passwordConfirmController.text);
                             if(result['state'] == 200){
                               state.changeFormEnabled(false);
                               snackBar = Alert.awesomeSnackBar(
                                   message: result["msg"],
                                   type: AWESOMESNACKBARTYPE.success);
                             } else {
                               snackBar = Alert.awesomeSnackBar(
                                   message: result["msg"],
                                   type: AWESOMESNACKBARTYPE.failure);
                             }
                             passwordController.text = "";
                             passwordConfirmController.text = "";
                            }
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          },
                          child: Text(context.tr('$_prefixFromLabel.submit'))),
                    )
                  ],
                )
              : const SizedBox.shrink(),
        )
      ],
    );
  }

  Future<Map> changePassword(password, confirmPassword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await http.post(
        Uri.parse('${Server.baseURL}/api/v1/user/update-password'),
        headers: <String, String>{
          'Authorization': prefs.getString('token') ?? ""
        },
        body: {"password": password, "password_confirmation": confirmPassword},
   );
    var data = jsonDecode(response.body);
    return { "state": response.statusCode, "msg": data['message'] };
  }

  Future<Map> userInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await http.get(
      Uri.parse('${Server.baseURL}/api/v1/user/info'),
      headers: <String, String>{
        'Authorization': prefs.getString('token') ?? ""
      });
    var data = jsonDecode(response.body);
    return { "email": data["data"]["attributes"]["email"], "role": data["data"]["attributes"]["role"] };
  }
}
