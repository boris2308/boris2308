
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pro/model/question.dart';
import 'package:pro/util/hexcolor.dart';


class MovieListView extends StatelessWidget {


  final List movies = [
        "Titanic",
        "Blade Runner",
        "Rambo",
        "The Avengers",
        "Avatar",
        "I am Legend",
        "The 300",
        "The wolf of wall Street",
        "Interstellar",
        "Game of Trones",
        "Vikings",
        "Vikings",
        "Vikings",
        "Vikings",
        "Vikings",
        "Vikings",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index){
        return Card(
          elevation: 4.5,
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              child: Container(
                decoration: BoxDecoration(
                  //color: Colors.blue,
                  borderRadius: BorderRadius.circular(13.9)
                ),
                child: Text("B"),
              ) ,
            ),
            trailing: Text("..."),
            title: Text(movies[index]),
            subtitle: Text("sub"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  MovieListViewDetails(movieName: movies.elementAt(index),)));
            },
            //onTap: () => debugPrint("Movie name: ${movies.elementAt(index)}"),
          ),
        );
      }),

    );
  }
}

// New route ( screen or page )
class MovieListViewDetails extends StatelessWidget {


  final String movieName;

  const MovieListViewDetails({Key? key, required this.movieName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,

      ),
      body: Center(
        child: Container(
          // ignore: deprecated_member_use
          child: ElevatedButton(
            child: Text("Go Back ${this.movieName}"),
            onPressed: () {
              Navigator.pop(context);
            },

          ),
        ),
      ),
    );
  }
}




class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  int _currentQuestionIndex = 0;

  List questionBAnk = [
    
    Question.name("the U.S Declaration of Independence was adopted in 1776.", true),
    Question.name("the U.S Declaration of Independence was adopted in 1745.", false),
    Question.name("the U.S Declaration of Independence was adopted in 1776.", true),
    Question.name("the U.S Declaration of Independence was adopted in 1999.", false),
    Question.name("the U.S Declaration of Independence was adopted in 1820.", false),
    Question.name("the U.S Declaration of Independence was adopted in 2000.", false),
    Question.name("T**********he U.S Declaration of Independence was adopted in 1776.", false)
  ];

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,

      // We use [Builder] here to use a [context] that is a descendent of [ Scaffold]
      // or else[Scaffold.of] will return null
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset("images/boris.JPG" ,
                width: 250,
                height: 180,),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                      color: Colors.blueGrey.shade400, style: BorderStyle.solid
                    )
                  ),
                  height: 120.0,
                   child: Center(child: Padding(padding: const EdgeInsets.all(8.0),

                   child: Text(questionBAnk[_currentQuestionIndex].questionText, style: TextStyle(
                     fontSize: 15.9,
                     color: Colors.white
                   ),),
                   )),
                ),
              ),
              Wrap(

                children: <Widget>[

                  // ignore: deprecated_member_use
                  RaisedButton(onPressed: () => _prevQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(Icons.arrow_back, color: Colors.white,),),


                  // ignore: deprecated_member_use
                  RaisedButton(onPressed: () => _checkAnswer(true, context),
                  color: Colors.blueGrey.shade900,
                  child: Text("TRUE", style: TextStyle(color: Colors.white),),),


                  // ignore: deprecated_member_use)))), deprecated_member_use
                  RaisedButton(onPressed: () => _checkAnswer(false, context),
                    color: Colors.blueGrey.shade900,
                    child: Text("FALSE", style: TextStyle(color: Colors.white),),),


                  // ignore: deprecated_member_use
                  RaisedButton(onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(Icons.arrow_forward, color: Colors.white,),),



                ],
              ),
              Spacer(),
            ],
          ),
        ),
      )
    );
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBAnk.length;
      debugPrint("index: $_currentQuestionIndex");
    });
  }
  _checkAnswer(bool userChoise, BuildContext context){
    if (userChoise == questionBAnk[_currentQuestionIndex].isCorrect){

      final snackbar = SnackBar(
        backgroundColor: Colors.green,
          duration: Duration(microseconds: 500),
          content: Text("Correct!"));
      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(snackbar);


     setState(() {
       _currentQuestionIndex++;

       _updateQuestion();
     });
    }else{
      debugPrint("Incorrect");
      final snackbar = SnackBar(
        backgroundColor: Colors.redAccent,
          duration: Duration(microseconds: 500),
          content: Text("Incorrect!"));
      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(snackbar);

      _updateQuestion();
    }
  }

  _updateQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBAnk.length;
  });



  }

  _nextQuestion() {
    _updateQuestion();
  }



  }


class BillSplitter extends StatefulWidget {
  const BillSplitter({Key? key}) : super(key: key);

  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {

  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount= 0.0;

  Color _purple = HexColor("6988D6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        margin: EdgeInsets.only(top: MediaQuery.of (context ).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.6),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _purple.withOpacity(0.1),//Colors.purpleAccent.shade100,
                borderRadius: BorderRadius.circular(12.0),

              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Total Person", style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0,
                        color: _purple,
                    ),),
                    Text(" \$123"),
                  ],
                ),
              ) ,
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey.shade100,
                  style: BorderStyle.solid
                ),
                  borderRadius: BorderRadius.circular(12.5)
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: _purple),
                    decoration: InputDecoration(
                      prefixText: "Bill Amount",
                      prefixIcon: Icon(Icons.attach_money)
                    ),
                    onChanged: (String value){
                      try {
                        _billAmount = double.parse(value);


                      }catch(exception){
                        _billAmount = 0.0;
                      }
                    },
                  ),

                  Wrap(

                      children: <Widget>[
                        Text("Split", style: TextStyle(
                          color: Colors.grey.shade700,

                        ),),
                        Wrap(
                          children: <Widget>[
                            InkWell(
                              onTap: (){
                                setState(() {
                                  if (_personCounter > 1){
                                    _personCounter--;
                                  }else{
                                    // do nothing
                                  }
                                });
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color:_purple.withOpacity(0.1)
                                ),
                                child: Center(
                                  child: Text(
                                    "-", style: TextStyle(
                                    color: _purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                  ),
                                ),
                              ),
                            ),
                            Text("$_personCounter", style: TextStyle(
                              color: _purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            ),),

                            InkWell(
                              onTap: (){
                              setState((){
                                _personCounter++;
                              });
                              },
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: _purple.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(7.0)
                                  ),
                                  child: Center(
                                    child: Text("+", style: TextStyle(
                                      color: _purple,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold
                                    ) ,),
                                  ),
                                ) ,
                              ),

                          ],
                        ),
                        //Tip
                        Wrap(
                          children: <Widget>[
                            Text("Tip", style: TextStyle(
                                color: Colors.grey.shade400
                            ),),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text("\$ ${calculateTotalTip(_billAmount,
                                  _personCounter, _tipPercentage)}", style: TextStyle(
                                color: _purple,
                                  fontWeight: FontWeight.bold,
                                fontSize: 17.0
                              ),),
                            )
                          ],
                        ),
                        // slider
                        Column(
                          children: <Widget>[
                            Text("$_tipPercentage%", style: TextStyle(
                              color: _purple,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold

                            ),),
                            Slider(
                              min: 0,
                              max: 100,
                              activeColor: _purple,
                              inactiveColor: Colors.grey,
                              divisions: 10, //optional
                              value: _tipPercentage.toDouble(),
                               onChanged: (double newValue){
                                    setState(() {
                                      _tipPercentage = newValue.round();
                                    });
                               })
                          ],
                        )

                      ],
                    ),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
  calculateTotalPerson(double billAmount, int splitBy, int tipPercentage){
    var totalPerson = ( calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount ) / splitBy;

    return totalPerson.toStringAsFixed(2);

  }
  calculateTotalTip(double billAmount, int splitBy, int tipPercentage){
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null){
      //no got!

    }else {
      totalTip = (billAmount *  tipPercentage) / 100;
    }
    return totalTip.toStringAsFixed(2);
  }

}


class Wisdom extends StatefulWidget {
  const Wisdom({Key? key}) : super(key: key);

  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "The analyzer produces this diagnostic when a method or ",
        "function invocation has a named argument, but the method",
        "or function being invoked",
        "doesn’t define a parameter with the same name.",
    "The analyzer produces this diagnostic when a method or ",
    "function invocation has a named argument, but the method",
    "or function being invoked",
    "doesn’t define a parameter with the same name.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                  width: 350,
                  height: 200,
                  margin: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.5)),
                  child: Center(
                      child: Text(quotes[_index % quotes.length],
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontStyle: FontStyle.italic,
                        fontSize: 12.5
                      ),))),
            ),
          ),
          // ignore: deprecated_member_use
          Divider(
            thickness: 1.3,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            // ignore: deprecated_mem ber_use, deprecated_member_use
            child: FlatButton.icon(
                onPressed: _showQuote,
                color: Colors.greenAccent.shade700,
                icon: Icon(Icons.wb_sunny),
                label: Text(
                  "Inspire me!",
                  style: TextStyle(
                    fontSize: 18.8,
                    color: Colors.white,
                  ),
                )),
          ),
          Spacer()
        ],
      ),
    ));
  }

  void _showQuote() {
    //increment our index/counter by 1
    setState(() {
      _index += 1;
    });
  }
}

class BizCard extends StatelessWidget {
  const BizCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BizCard"),
        centerTitle: true,
      ),
      backgroundColor: Colors.redAccent.shade200,
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[_getCard(), _getAvatar()],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(40.0),
      decoration: BoxDecoration(
          color: Colors.pinkAccent, borderRadius: BorderRadius.circular(14.6)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Boris_Becker",
            style: TextStyle(
                fontSize: 20.9,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          Text("borisdjiongo.com")
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Icon(Icons.person_outline),
          //     Text("T: @buildappswithme")
          //   ],
          // )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.redAccent, width: 1.2),
          image: DecorationImage(
              image: NetworkImage("https://picsum.photos/300/300"),
              fit: BoxFit.cover)),
    );
  }
}

class ScaffoldExample extends StatelessWidget {
  _tapButton() {
    debugPrint("Tapped button");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application Boris"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade200,
        actions: <Widget>[
          IconButton(
              onPressed: () => debugPrint("Email"), icon: Icon(Icons.email)),
          IconButton(onPressed: _tapButton, icon: Icon(Icons.access_alarms)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen,
          child: Icon(Icons.call_missed),
          onPressed: () => debugPrint("Hello")),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("compte")),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text("indice")),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarms), title: Text("alarm")),
        ],
        onTap: (int index) => debugPrint("Tapped item: ]$index"),
      ),
      backgroundColor: Colors.blueAccent.shade700,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton()
            //   InkWell(
            //     child: Text("tape mi!",
            //       style: TextStyle(fontSize: 30),),
            //
            //       onTap: () => debugPrint("tapped..."),
            // ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text("Hello mi"),
          backgroundColor: Colors.amberAccent.shade700,
        );
        // ignore: deprecated_member_use
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.pinkAccent, borderRadius: BorderRadius.circular(8.0)),
        child: Text("Button"),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green,
      child: Center(
          child: Text(
        "Hello flutter",
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 30,
            fontStyle: FontStyle.italic),
      )),
    );
    // return Center (
    //   child: Text("Hello Flutter",
    //     textDirection: TextDirection.ltr,),
    // );
  }
}
