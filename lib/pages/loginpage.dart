import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_digit_app/routes/routes.dart';
import 'package:new_digit_app/widget/localized.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../blocs/authbloc.dart';

class LoginScreen extends LocalizedStatefulWidget {
  LoginScreen({Key? key, super.appLocalizations}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends LocalizedState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true; // Initial state for password field visibility
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'username',
                    hintText: 'Enter your username',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
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
                const SizedBox(height: 20.0),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    state.maybeWhen(
                        orElse: () {},
                        error: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('text')));

                          Future.delayed(const Duration(seconds: 2), () {
                            context
                                .read<AuthBloc>()
                                .add(const AuthEvent.logout());
                          });
                        },
                        unauthenticated: () {},
                        authenticated: () {
                          AutoRouter.of(context).navigate(const HomeRoute());
                        });
                  },
                  builder: (context, state) => ElevatedButton(
                    child: Text(localizations.translate(i18.login.labelText)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(AuthEvent.login(
                              username: _usernameController.text,
                              password: _passwordController.text,
                            ));
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                TextButton(
                  child: Text(localizations.translate(
                    i18.forgotPassword.labelText,
                  )),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(localizations.translate(
                      'CORE_COMMON_INVALID_USER',
                    ))));
                  },
                ),
              ],
            )),
      ),
    );
  }
}
