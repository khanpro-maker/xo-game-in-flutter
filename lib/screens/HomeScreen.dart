import 'package:appone/widgets/CustomButtons.dart';
import 'package:appone/widgets/CustomTextField.dart';
import 'package:appone/widgets/OwnColor.dart';
import 'package:appone/widgets/TextStyleOwn.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final TextEditingController playerone = TextEditingController();
  final TextEditingController playetwo = TextEditingController();

  void onNavigate() {
    final snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      closeIconColor: Owncolor.maincolor,
      padding: EdgeInsets.all(5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      content: Text(
        "Enter players name to start playing",
        style: Textstyleown.snaktext,
      ),
      backgroundColor: Colors.white,
    );
    if (playerone.text.isNotEmpty && playetwo.text.isNotEmpty) {
      Navigator.pushNamed(context, '/GameScreen',
          arguments: {'playerone': playerone, 'playetwo': playetwo});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    playerone.dispose();
    playetwo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Owncolor.maincolor,
        appBar: AppBar(
          backgroundColor: Owncolor.maincolor,
          foregroundColor: Owncolor.textcolor,
          title: Text(
            "XO",
            style: Textstyleown.appbartext,
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  textController: playerone,
                  hintText: "Enter playerOne name",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  textController: playetwo,
                  hintText: "Enter playerTwo name",
                ),
                SizedBox(height: 10),
                Custombuttons(
                  btnText: "Play",
                  onTap: onNavigate,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
