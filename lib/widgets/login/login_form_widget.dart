import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../../services/auth_service.dart';
import '../../services/login_form_service.dart';
import '../../utils/alert/alert.dart';
import '../../utils/alert/awesome_snack_bar_utils.dart';
import '../../utils/constants.dart';
import '../../utils/responsive/responsive_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginFormWidget extends StatelessWidget {
  final double? formWidth;
  LoginFormWidget({super.key, this.formWidth});
  final _formKey = GlobalKey<FormBuilderState>();
  final String _fromTitle = 'screens.login.children.formTitle';
  final String _prefixFromLabel = 'screens.login.children.form';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final emailController = TextEditingController();
    final passController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(AppStyleDefaultProperties.p),
          width: formWidth,
          child: FormBuilder(
            key: _formKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset('assets/images/TG_logo1.svg', width: 256, height: 256,)
                ),
                const SizedBox(height: 24,),
                const SizedBox(height: AppStyleDefaultProperties.h),
                FormBuilderTextField(
                  name: 'email',
                  controller: emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: ResponsiveLayout.isDesktop(context)
                      ? InputDecoration(
                          prefixIcon: const Icon(AppDefaultIcons.email),
                          labelText: context.tr('$_prefixFromLabel.email'))
                      : InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(AppDefaultIcons.email, color: Colors.grey,),
                          hintText: context.tr('$_prefixFromLabel.email'),
                          filled: true,
                          fillColor: Colors.white24),
                  // validator: FormBuilderValidators.compose(
                  //     [FormBuilderValidators.required()]),
                ),
                const SizedBox(height: AppStyleDefaultProperties.h),
                Consumer<LoginFormService>(
                  builder: (context, state, child) => FormBuilderTextField(
                    name: 'password',
                    controller: passController,
                    obscureText: state.showPassword,
                    style: TextStyle(color: Colors.white),
                    decoration: ResponsiveLayout.isDesktop(context)
                        ? InputDecoration(
                            prefixIcon: const Icon(AppDefaultIcons.password),
                            labelText: context.tr('$_prefixFromLabel.password'),
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  state.switchShowPassword(!state.showPassword),
                              splashRadius: 16.0,
                              icon: Icon(state.showPassword
                                  ? AppDefaultIcons.hidePassword
                                  : AppDefaultIcons.showPassword),
                            ),
                          )
                        : InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(AppDefaultIcons.password, color: Colors.grey),
                            hintText: context.tr('$_prefixFromLabel.password'),
                            filled: true,
                            fillColor: Colors.white24,

                            suffixIcon: IconButton(
                              color: Colors.grey,
                              onPressed: () =>
                                  state.switchShowPassword(!state.showPassword),
                              splashRadius: 16.0,
                              icon: Icon(state.showPassword
                                  ? AppDefaultIcons.hidePassword
                                  : AppDefaultIcons.showPassword),
                            ),
                          ),
                    // validator: FormBuilderValidators.required(),
                  ),
                ),
                const SizedBox(height: AppStyleDefaultProperties.h),
                const SizedBox(height: AppStyleDefaultProperties.h),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(AppThemeColors.inureOrange),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
                        ),
                        onPressed: () async {
                          late SnackBar snackBar;
                          if (_formKey.currentState!.saveAndValidate()) {
                            var loggedIn = await context.read<AuthService>().login(
                                emailController.text, passController.text);
                            if(loggedIn == true){
                              snackBar = Alert.awesomeSnackBar(
                                  message:
                                  '$_prefixFromLabel.alert.success.message',
                                  type: AWESOMESNACKBARTYPE.success);
                            } else {
                              snackBar = Alert.awesomeSnackBar(
                                  message:
                                  '$_prefixFromLabel.alert.failure.message',
                                  type: AWESOMESNACKBARTYPE.failure);
                            }
                          } else {
                            snackBar = Alert.awesomeSnackBar(
                                message:
                                    '$_prefixFromLabel.alert.failure.message',
                                type: AWESOMESNACKBARTYPE.failure);
                          }
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        },
                        child: Text(context.tr('$_prefixFromLabel.submit')),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: AppStyleDefaultProperties.h)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
