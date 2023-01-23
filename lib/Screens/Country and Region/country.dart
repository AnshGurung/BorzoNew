import 'package:borzo_app/Screens/Country%20and%20Region/Model/country_model.dart';
import 'package:borzo_app/WelcomePages/welcome_to_borzo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Country extends StatefulWidget {
  Country({
    super.key,
    this.countryIndex = 0,
    required this.isProfile,
  });

  int? countryIndex;
  bool isProfile;
  @override
  State<Country> createState() => _CountryState();
}

class _CountryState extends State<Country> {
  int? lastCountryIndex;
  List<CountryModel> countriesList = [
    CountryModel(
      flag: 'assets/flags/india.png',
      country: 'India',
      text: 'Are you in ',
      welcomeText: 'Welcome to Borzo!',
      yes: 'Yes',
    ),
    CountryModel(
        flag: 'assets/flags/brazil.png',
        country: 'Brazil',
        text: 'Você esta no ',
        welcomeText: 'Seja bem-vindo a Borzo!',
        yes: 'Sim'),
    CountryModel(
        flag: 'assets/flags/indonesia.png',
        country: 'Indonesia',
        text: 'Kamu ada di ',
        welcomeText: 'Selamat datang di Borzo!',
        yes: 'Ya'),
    CountryModel(
        flag: 'assets/flags/malaysia.png',
        country: 'Malaysia',
        text: 'Are you in ',
        welcomeText: 'Welcome to Borzo!',
        yes: 'Yes'),
    CountryModel(
        flag: 'assets/flags/mexico.png',
        country: 'Mexico',
        text: '¿Estás en ',
        welcomeText: '¡Bienvenido a Borzo!',
        yes: 'Si'),
    CountryModel(
        flag: 'assets/flags/philippines.png',
        country: 'Philippines',
        text: 'Are you in ',
        welcomeText: 'Welcome to Borzo!',
        yes: 'Yes!'),
    CountryModel(
        flag: 'assets/flags/south_korea.png',
        country: 'South Korea',
        text: 'Are you in ',
        welcomeText: 'Welcome to Borzo!',
        yes: 'Yes'),
    CountryModel(
        flag: 'assets/flags/vietnam.png',
        country: 'Vietnam',
        text: 'Bạn đang ở ',
        welcomeText: 'Chào mừng đến với Borzo!',
        yes: 'tiếp tục')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Choose your country',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: countriesList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  lastCountryIndex = widget.countryIndex;
                  widget.countryIndex = index;
                });
                widget.isProfile
                    ?
                    //ALERT DIALOG BOX (SWTICH COUNTRY)
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 15, left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Change country?',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Expanded(
                                          child: Text(
                                            'You\'ll have a separate account and order history in the new country.',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        borderRadius: BorderRadius.circular(10),
                                        onTap: () async {
                                          final pref = await SharedPreferences
                                              .getInstance();
                                          pref.setBool('showCreateOrder', false);
                                          // ignore: use_build_context_synchronously
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    WelcomeToBorzo(
                                                  countryName:
                                                      countriesList[index]
                                                          .country,
                                                  currentIndex: index,
                                                  flagImage:
                                                      countriesList[index].flag,
                                                  question:
                                                      countriesList[index].text,
                                                  welcome: countriesList[index]
                                                      .welcomeText,
                                                  answer:
                                                      countriesList[index].yes,
                                                ),
                                              ),
                                              (route) => false);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Center(
                                              child: Text(
                                                'Switch country',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xff0048ff),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          onTap: () {
                                            setState(() {
                                              widget.countryIndex =
                                                  lastCountryIndex;
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Center(
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                    : Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomeToBorzo(
                            countryName: countriesList[index].country,
                            currentIndex: index,
                            flagImage: countriesList[index].flag,
                            question: countriesList[index].text,
                            welcome: countriesList[index].welcomeText,
                            answer: countriesList[index].yes,
                          ),
                        ),
                        (route) => false);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 18,
                          width: 23,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                countriesList[index].flag!,
                                fit: BoxFit.cover,
                              )),
                        ),
                        Text(countriesList[index].country!),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: widget.countryIndex == index
                          ? const Icon(
                              Icons.done,
                              color: Color(0xffe84780),
                              size: 23,
                            )
                          : const SizedBox(),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
