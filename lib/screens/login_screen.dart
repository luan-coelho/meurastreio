import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meurastreio/services/user_service.dart';
import 'package:meurastreio/widgets/label.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late UserService _userService;

  late FocusNode _emailFocusNode;
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (_emailFocusNode.hasPrimaryFocus) {
        return;
      }
      _emailFocusNode.canRequestFocus = false;
    });
  }

  void _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    bool success = await _userService.login(email, password);
    if (success) {
      context.go('/orders');
    } else {
      const snackBar = SnackBar(
        content: Text('Email ou senha inválidos'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    _emailFocusNode = FocusNode();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode.requestFocus();
    _userService = UserService();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(29.0),
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/box.png'),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text('Meu Rastreio',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w600)),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 35),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Label(text: "Email"),
                          const SizedBox(height: 7),
                          TextFormField(
                            controller: _emailController,
                            focusNode: _emailFocusNode,
                            autofocus: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Informe o email';
                              }

                              String regexExpression =
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                              final RegExp pattern = RegExp(regexExpression);
                              RegExp regex = RegExp(pattern.pattern);
                              if (!regex.hasMatch(value)) {
                                return 'Informe um email válido';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff0F172A), width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(203, 213, 225, 1),
                                      width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              // prefixIcon: Icon(Icons.email, size: 24),
                              hintText: "Informe seu email",
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Label(text: "Senha"),
                          const SizedBox(height: 7),
                          TextFormField(
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _obscured,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Informe a senha';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              isDense: true,
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff0F172A), width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(203, 213, 225, 1),
                                      width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              /* prefixIcon:
                                  const Icon(Icons.lock_rounded, size: 24),*/
                              suffixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                child: GestureDetector(
                                  onTap: _toggleObscured,
                                  child: Icon(
                                    _obscured
                                        ? Icons.visibility_rounded
                                        : Icons.visibility_off_rounded,
                                    size: 24,
                                  ),
                                ),
                              ),
                              hintText: "Informe sua senha",
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 19.0),
                        child: SizedBox(
                          width: double.infinity, // Largura 100%
                          height: 50, // Altura de 50
                          child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0xff0F172A)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ))),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _login();
                              }
                            },
                            child: const Text("LOGIN",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20)),
                          ),
                        ))
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
