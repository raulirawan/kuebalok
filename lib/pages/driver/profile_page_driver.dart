import 'package:flutter/material.dart';
import 'package:kuebalok/providers/auth_provider.dart';
import 'package:kuebalok/theme.dart';
import 'package:provider/provider.dart';

class ProfilePageDriver extends StatefulWidget {
  const ProfilePageDriver({Key? key}) : super(key: key);

  @override
  _ProfilePageDriverState createState() => _ProfilePageDriverState();
}

class _ProfilePageDriverState extends State<ProfilePageDriver> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 117,
                padding: EdgeInsets.only(
                  left: defaultMargin,
                  right: defaultMargin,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/img-profile.png',
                      width: 64,
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    Text(
                      "Halo, ${authProvider.user.name}",
                      style: blackTextStyle.copyWith(
                        fontSize: 22,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 36,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account",
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (await authProvider
                            .logout(authProvider.user.token.toString())) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/login',
                            (route) => false,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: alertColor,
                              content: Text(
                                "Gagal Logout!",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Logout",
                              style: greyTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/arrow-right.png',
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
