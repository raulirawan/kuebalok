import 'package:flutter/material.dart';
import 'package:kuebalok/pages/main_page.dart';
import 'package:kuebalok/providers/auth_provider.dart';
import 'package:kuebalok/theme.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController addressController = TextEditingController(text: '');
  TextEditingController phoneNumberController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
            ),
            TextFormField(
              controller: nameController,
              style: blackTextStyle,
              decoration: InputDecoration(
                hintText: authProvider.user.name,
                hintStyle: blackTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: blackColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget nohpInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nomor HP",
              style: blackTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: phoneNumberController,
              style: blackTextStyle,
              decoration: InputDecoration(
                hintText: authProvider.user.phoneNumber.toString(),
                hintStyle: blackTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: blackColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget alamatInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Alamat",
              style: blackTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: addressController,
              style: blackTextStyle,
              decoration: InputDecoration(
                hintText: authProvider.user.address,
                hintStyle: blackTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: blackColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        color: bgWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/img-profile.png',
                  ),
                ),
              ),
            ),
            nameInput(),
            nohpInput(),
            alamatInput(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: primaryColor,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => MainPage(
                    initialPage: 3,
                  ),
                ),
                (route) => false);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: blackTextStyle,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: primaryColor,
            ),
            onPressed: () async {
              setState(() {
                isLoading = true;
              });
              print(authProvider.user.token);
              if (nameController.text.isNotEmpty ||
                  phoneNumberController.text.isNotEmpty ||
                  addressController.text.isNotEmpty) {
                if (await authProvider.updateProfile(
                  name: nameController.text.isEmpty
                      ? authProvider.user.name
                      : nameController.text,
                  phoneNumber: phoneNumberController.text.isEmpty
                      ? authProvider.user.phoneNumber
                      : int.parse(phoneNumberController.text),
                  address: addressController.text.isEmpty
                      ? authProvider.user.address
                      : addressController.text,
                  token: authProvider.user.token,
                )) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(
                          initialPage: 3,
                        ),
                      ),
                      (route) => false);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: greenColor,
                      content: Text(
                        "Berhasil Update Profile!",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: alertColor,
                      content: Text(
                        "Gagal Update Profile!",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: alertColor,
                  content: Text(
                    "Anda Belum Edit Apapun!",
                    textAlign: TextAlign.center,
                  ),
                ));
              }
              setState(() {
                isLoading = false;
              });
            },
          )
        ],
      ),
      body: isLoading ? Center(child: CircularProgressIndicator()) : content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
