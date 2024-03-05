import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_digit_app/blocs/app_init.dart';
import 'package:new_digit_app/blocs/userbloc.dart';
import 'package:new_digit_app/model/user/userModel.dart';
import 'package:new_digit_app/widget/localized.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../utils/i18_key_constants.dart' as i18;

class ProfileScreen extends LocalizedStatefulWidget {
  const ProfileScreen({super.key, super.appLocalizations});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends LocalizedState<ProfileScreen> {
  final nameKey = 'nameKey';
  final mobileNoKey = 'mobileNoKey';
  final genderKey = 'genderKey';
  final emailIdKey = 'emailIdKey';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    FormGroup buildForm(UserState state) {
      final user = state.mapOrNull(
        user: (value) => value.userModel,
      );

      return fb.group(<String, Object>{
        nameKey: FormControl<String>(value: user?.name, validators: []),
        mobileNoKey: FormControl<String>(
          value: user?.mobileNumber,
          // validators: [
          //   CustomValidator.validMobileNumber,
          // ],
        ),
        emailIdKey: FormControl<String>(
          value: user?.emailId,
          validators: [Validators.email],
        ),
        genderKey: FormControl<String>(
          value: context.read<AppInitialization>().state.maybeWhen(
                orElse: () => null,
                initialized: (appConfig, serviceRegistryList) {
                  return appConfig.appConfig!.appConfig?[0].genderOptions
                      .map((e) => e.code)
                      .firstWhere((element) => element == user?.gender,
                          orElse: () => '');
                },
              ),
        ),
      });
    }

    return Scaffold(
      appBar: AppBar(),
      body:
          BlocBuilder<AppInitialization, InitState>(builder: (context, state) {
        final actionMap = state.entityActionMapping;
        return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DigitIconButton(
                icon: Icons.arrow_back,
                onPressed: () {
                  context.navigateBack();
                },
                iconText: localizations.translate(i18.common.coreCommonBack),
              ),
              ReactiveFormBuilder(
                form: () => buildForm(state),
                builder: (BuildContext context, FormGroup formGroup,
                        Widget? child) =>
                    DigitCard(
                        child: Column(
                  children: [
                    DigitTextFormField(
                      formControlName: nameKey,
                      maxLength: 200,
                      label: localizations.translate(i18.common.coreCommonName),
                      validationMessages: {
                        'required': (object) => localizations.translate(
                              '${i18.individualDetails.nameLabelText}_IS_REQUIRED',
                            ),
                      },
                    ),
                    DigitTextFormField(
                      formControlName: mobileNoKey,
                      minLength: 10,
                      maxLength: 10,
                      label: localizations
                          .translate(i18.common.coreCommonMobileNumber),
                      validationMessages: {
                        'required': (object) => localizations.translate(
                              '${i18.individualDetails.nameLabelText}_IS_REQUIRED',
                            ),
                      },
                    ),
                    BlocBuilder<AppInitialization, InitState>(
                      builder: (context, state) => state.maybeWhen(
                        orElse: () => const Offstage(),
                        initialized: (appConfig, _) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    localizations.translate(
                                      i18.common.coreCommonGender,
                                    ),
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ],
                              ),
                              ...appConfig
                                  .appConfig!.appConfig![0].genderOptions
                                  .map((e) => ReactiveRadioListTile<String>(
                                        value: e.code,
                                        title: Text(
                                            localizations.translate(e.code)),
                                        formControlName: genderKey,
                                      ))
                                  .toList(),
                            ],
                          );
                        },
                      ),
                    ),
                    DigitTextFormField(
                      formControlName: emailIdKey,
                      label: localizations.translate(
                        i18.common.coreCommonEmailId,
                      ),
                      maxLength: 200,
                      validationMessages: {
                        'required': (object) => localizations.translate(
                              '${i18.individualDetails.nameLabelText}_IS_REQUIRED',
                            ),
                      },
                    ),
                    DigitElevatedButton(
                        child: Text(
                            localizations.translate(i18.common.coreCommonSave)),
                        onPressed: () {
                          UserModel? user = state.mapOrNull(
                            user: (value) => value.userModel,
                          );

                          final updatedUser = user!.copyWith(
                            gender:
                                formGroup.control(genderKey).value as String,
                            mobileNumber: formGroup.control(mobileNoKey).value,
                            name: formGroup.control(nameKey).value as String,
                            emailId:
                                formGroup.control(emailIdKey).value as String,
                          );
                          context.read<UserBloc>().add(UserEvent.updateUser(
                              actionMap: actionMap,
                              user: updatedUser,
                              olduser: user));
                        })
                  ],
                )),
              ),
            ],
          );
        });
      }),
    );
  }
}
