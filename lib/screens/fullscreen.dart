import 'package:flutter/material.dart';

class FullScreen extends StatefulWidget {
  var link;
  FullScreen(this.link);

  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {




  var setwallRowOpened = false;

  @override
  Widget build(BuildContext context) {

    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [

        //  For full screen image
          Column(
            children: [
              Expanded(
               flex: 4,
               child: InkWell(
                 onTap: (){
                   setState(() {
                     setwallRowOpened = false;
                   });
                 },
                 child: Container(
                   width: double.infinity,
                   child: InteractiveViewer(
                     child: Image.network(
                       widget.link,
                       fit : BoxFit.fitWidth
                       )
                    ),
                 ),
               ),
         ),

           Expanded(
             flex: 1,
             child: SizedBox(height: 10,),)
            ],
          ),

      //  Functionalities Card
      Material(
        elevation: 20,
        child: Container(
          width: double.infinity,
          height: 140,
          child: Column(
            children: [
              SizedBox(height: 10,),

             setwallRowOpened == false ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: null,
                    icon: Icon(
                        Icons.file_download,
                        color: Colors.black,
                        size: 26,
                      )

                    ),

                  FilterChip(
                    label: Text('Set Wallpaper',style: TextStyle(color: Colors.black)),
                    onSelected: (bool value){
                      // open the set wallpaper options

                    setState(() {
                      setwallRowOpened = true;
                    });

                    },
                    backgroundColor: Colors.white,
                    avatar: Icon(Icons.color_lens)
                  ),


                 IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                        Icons.cancel,
                        color: Colors.black,
                        size: 26,
                      )
                    ),

                ],
              ):
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      // button for setting wallpaper at Homescreen

                      InkWell(
                        onTap: null,
                        child: Container(
                          height: 33,
                          alignment: Alignment.center,
                          width: width/3.5,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Text('HOMESCREEN',style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold
                           ),)
                        ),
                      ),

                      // Button for lockscreen
                      InkWell(
                        onTap: null,
                        child: Container(
                          height: 33,
                          alignment: Alignment.center,
                          width: width/3.5,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Text('LOCKSCREEN',style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold
                           ),)
                        ),
                      ),

                          // Button for both the screens
                          InkWell(
                          onTap: null,
                          child: Container(
                            height: 33,
                            alignment: Alignment.center,
                            width: width/3.5,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Text('BOTH',style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold
                            ),)
                          ),
                      )

                   ],

                ),
              ),

              // set wallpaper and download wallpaper progress indicator
              AnimatedContainer(
                duration: Duration(
                  milliseconds: 50,
                ),
                height: 50,
                width: width,
                color: Colors.cyan,
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: Text('Wallpaper set completed', style: TextStyle(
                      color: Colors.black

                      ),),
                  ),
                ),
              )

            ],
          ),
        )
      )

      ],),
    );
  }
}