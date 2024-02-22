import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/pagebloc.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          key: _formKey,
          child: Card(
            margin: EdgeInsets.all(40),
            child: Container(
              padding: EdgeInsets.all(30),
              child: BlocProvider(
                create: (context) => PageBloc(),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'name'),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: 'password'),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 300,
                      width: 300,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context.read<PageBloc>().add(PageEvent.login(
                              name: _nameController.text,
                              password: _passwordController.text));
                        },
                        child: Text('Submit'))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
