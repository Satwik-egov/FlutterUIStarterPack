import 'package:auto_route/auto_route.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_digit_app/blocs/app_localization.dart';
import 'package:new_digit_app/routes/routes.dart';
import 'package:new_digit_app/widget/localized.dart';
import '../blocs/localization.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../blocs/app_init.dart';
import '../blocs/authbloc.dart';

// class LoginScreen extends StatefulWidget {
class LoginScreen extends LocalizedStatefulWidget {
  // final String? localeKey;
  // LoginScreen({Key? key, required String? locale})
  LoginScreen({Key? key, super.appLocalizations})
      // : localeKey = locale,
      : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// class _LoginScreenState extends State<LoginScreen> {
class _LoginScreenState extends LocalizedState<LoginScreen> {
  // late String? localeKey;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true; // Initial state for password field visibility

  @override
  void initState() {
    super.initState();
    // localeKey = widget.localeKey;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppInitialization()..add(InitEvent.onLaunch()),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        // BlocProvider(
        //   create: (context) => Localization(),
        // ),
      ],
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<AppInitialization, InitState>(
          builder: (context, state) => Container(
            child: state.maybeWhen(
              orElse: () {},
              initialized: (appConfig, serviceRegList) =>
                  // BlocProvider(
                  //   create: (context) => Localization()
                  //     ..add(LocalizationEvent.onSelect(
                  //         locale: apploca,
                  //         moduleList: appConfig
                  //             .appConfig!.appConfig?[0].backendInterface)),
                  DigitCard(
                // DigitCard(
                child: Container(
                  // Container(
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                      key: _formKey,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                labelText: 'username',
                                hintText: 'Enter your username',
                                // Add validation for valid username format
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your username';
                                }
                                // Implement appropriate username validation
                                return null;
                              },
                            ),
                            SizedBox(height: 20.0),
                            TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter your password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                              ),
                              obscureText: _obscureText,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password.';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20.0),
                            BlocConsumer<AuthBloc, AuthState>(
                              listener: (context, state) {
                                state.maybeWhen(
                                    orElse: () {},
                                    error: () {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          // SnackBar(content: Text('Error Occured')));
                                          SnackBar(content: Text('text')));

                                      Future.delayed(Duration(seconds: 2), () {
                                        context
                                            .read<AuthBloc>()
                                            .add(AuthEvent.logout());
                                      });
                                    },
                                    unauthenticated: () {},
                                    authenticated: () {
                                      AutoRouter.of(context)
                                          .navigate(const HomeRoute());
                                    });
                              },
                              builder: (context, state) => ElevatedButton(
                                child: Text(localizations
                                    // child: Text(AppLocalizations.of(context)
                                    .translate(i18.login.labelText)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context
                                        .read<AuthBloc>()
                                        .add(AuthEvent.login(
                                          username: _usernameController.text,
                                          password: _passwordController.text,
                                        ));
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 20.0),
                            TextButton(
                              child: Text(localizations.translate(
                                // child:
                                //     Text(AppLocalizations.of(context).translate(
                                i18.forgotPassword.labelText,
                              )),
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        content: Text(localizations.translate(
                                  // 'CORE_COMMON_CONTINUE',
                                  'CORE_COMMON_INVALID_USER',
                                ))));
                              },
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
