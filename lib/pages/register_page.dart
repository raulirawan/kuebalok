import 'package:flutter/material.dart';
import 'package:kuebalok/providers/auth_provider.dart';
import 'package:kuebalok/theme.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController phoneNumberController = TextEditingController(text: '');
  TextEditingController addressController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgGrey,
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            top: 50,
          ),
          child: Column(
            children: [
              Text(
                "Buat Akun Baru!",
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
              // Text Form Fiel Nama
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama",
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
                        controller: nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Masukan Nama",
                          hintStyle: greyTextStyle,
                          fillColor: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Text form Field Email
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 16,
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
              // Text Form Field No Hp
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nomor Handphone",
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
                        controller: phoneNumberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Masukan Nomor Handphone",
                          hintStyle: greyTextStyle,
                          fillColor: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Text Form Field Alamat
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Alamat",
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
                        controller: addressController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Masukan Alamat",
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
                        top: 50,
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
                          if (nameController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              passwordController.text.isEmpty ||
                              phoneNumberController.text.isEmpty ||
                              addressController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: alertColor,
                                content: Text(
                                  "Isi Field Yang Kosong!",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          } else {
                            setState(() {
                              isLoading = true;
                            });

                            if (await authProvider.register(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phoneNumber:
                                  int.parse(phoneNumberController.text),
                              address: addressController.text,
                            )) {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/main-page',
                                (route) => false,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: alertColor,
                                  content: Text(
                                    "Gagal Register!",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            }
                          }
                        },
                        child: Text(
                          "Buat Akun Baru",
                          style: whiteTextStyle,
                        ),
                      ),
                    ),
              //
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
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          "Punya Akun ? Login",
                          style: whiteTextStyle,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
