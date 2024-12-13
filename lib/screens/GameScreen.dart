import 'package:appone/widgets/OwnColor.dart';
import 'package:appone/widgets/TextStyleOwn.dart';
import 'package:flutter/material.dart';

class Gamescreen extends StatefulWidget {
  const Gamescreen({super.key});

  @override
  State<Gamescreen> createState() => _GamescreenState();
}

class _GamescreenState extends State<Gamescreen> {
  int _playeroneCount = 0;
  int _playertwoCount = 0;
  List<String> displayXo = ["", "", "", "", "", "", "", "", ""];
  bool isPlayerTurn = true;

  @override
  Widget build(BuildContext context) {
    final Map<String, TextEditingController> controllers =
        ModalRoute.of(context)!.settings.arguments
            as Map<String, TextEditingController>;
    final TextEditingController playerone = controllers['playerone']!;
    final TextEditingController playetwo = controllers['playetwo']!;
    void update(int index) {
      setState(() {
        if (displayXo[index] == "") {
          displayXo[index] = isPlayerTurn ? "X" : "O";
        }
        isPlayerTurn = !isPlayerTurn;
      });
    }

    void reset() {
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          displayXo = ["", "", "", "", "", "", "", "", ""];
        });
      });
    }

    void checkwinner(
        TextEditingController playerone, TextEditingController playertwo) {
      final WinnerXsnackbar = SnackBar(
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Owncolor.maincolor,
        padding: EdgeInsets.all(5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        content: Text(
          "Player ${playerone.text} (X) wins!",
          style: Textstyleown.snaktext,
        ),
        backgroundColor: Colors.white,
      );

      final WinnerOsnackbar = SnackBar(
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Owncolor.maincolor,
        padding: EdgeInsets.all(5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        content: Text(
          "Player ${playetwo.text} (O) wins!",
          style: Textstyleown.snaktext,
        ),
        backgroundColor: Colors.white,
      );

      final Drawsnackbar = SnackBar(
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Owncolor.maincolor,
        padding: EdgeInsets.all(5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        content: Text(
          "It's a Draw!",
          style: Textstyleown.snaktext,
        ),
        backgroundColor: Colors.yellow,
      );

      List<List<int>> winninglogic = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
      ];

      for (var combination in winninglogic) {
        String a = displayXo[combination[0]];
        String b = displayXo[combination[1]];
        String c = displayXo[combination[2]];

        if (a != "" && a == b && b == c) {
          if (a == "X") {
            _playeroneCount++;
            ScaffoldMessenger.of(context).showSnackBar(WinnerXsnackbar);
          } else {
            _playertwoCount++;
            ScaffoldMessenger.of(context).showSnackBar(WinnerOsnackbar);
          }
          reset();
          return;
        }
      }
      if (!displayXo.contains("")) {
        ScaffoldMessenger.of(context).showSnackBar(Drawsnackbar);
        reset();
      }
    }

    return SafeArea(
        child: Center(
      child: Scaffold(
          backgroundColor: Owncolor.maincolor,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          playerone.text,
                          style: Textstyleown.gametext,
                        ),
                        Text(
                          _playeroneCount.toString(),
                          style: Textstyleown.pointtext,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(playetwo.text, style: Textstyleown.gametext),
                        Text(_playertwoCount.toString(),
                            style: Textstyleown.pointtext),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: displayXo.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        update(index);
                        checkwinner(playerone, playetwo);
                      },
                      child: Card(
                        elevation: 20,
                        color: Colors.yellow,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          displayXo[index],
                          style: TextStyle(
                              fontFamily: 'Lili',
                              fontSize: 60,
                              color: Owncolor.maincolor),
                        )),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    reset();
                  },
                  child: Text("Reset"))
            ],
          )),
    ));
  }
}
