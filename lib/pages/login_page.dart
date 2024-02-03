import 'package:flutter/material.dart';
import 'package:kuebalok/providers/auth_provider.dart';
import 'package:kuebalok/providers/transaction_provider.dart';
import 'package:kuebalok/theme.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);

    return Scaffold(
      backgroundColor: bgGrey,
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 90,
        ),
        child: Column(
          children: [
            Text(
              "Silahkan Login!",
              style: blackTextStyle.copyWith(
                fontSize: 24,
              ),
            ),
            // Text Form Fiel Email
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: blackColor),
                    ),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Masukan Email",
                        hintStyle: greyTextStyle,
                        fillColor: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: blackColor),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Masukan Password",
                        hintStyle: greyTextStyle,
                        fillColor: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Button Login
            isLoading
                ? Container(
                    margin: EdgeInsets.only(
                      top: defaultMargin,
                    ),
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    width: double.infinity,
                    height: 50,
                    margin: EdgeInsets.only(
                      top: defaultMargin,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: primaryColor,
                    ),
                    child: TextButton(
                      onPressed: () async {
                        if (emailController.text == '' &&
                            passwordController.text == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: alertColor,
                              content: Text(
                                "Email dan Password Harus di isi!",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          if (await authProvider.login(
                            email: emailController.text,
                            password: passwordController.text,
                          )) {
                            if (authProvider.user.roles == 'PELANGGAN')
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/main-page',
                                (route) => false,
                              );
                            else {
                              await transactionProvider
                                  .getTransactionOnProgress(
                                      authProvider.user.token.toString());
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/main-page-driver',
                                (route) => false,
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: alertColor,
                                content: Text(
                                  "Gagal Login!",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                          // getTransaction
                          print(authProvider.user.token);
                          transactionProvider.getransactions(
                              authProvider.user.token.toString());

                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      child: Text(
                        "Login",
                        style: whiteTextStyle,
                      ),
                    ),
                  ),
            // Button Buat Akun Baru
            isLoading
                ? SizedBox()
                : Container(
                    width: double.infinity,
                    height: 50,
                    margin: EdgeInsets.only(
                      top: defaultMargin,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: greyColor,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        "Buat Akun Baru",
                        style: whiteTextStyle,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
