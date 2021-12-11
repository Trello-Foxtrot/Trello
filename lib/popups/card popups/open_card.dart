import 'package:flutter/material.dart';

class OpenCardDialog extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 900,
        height: MediaQuery.of(context).size.height * 0.98,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title',
                      // style: GoogleFonts.robotoSlab(
                      //     textStyle: TextStyle(
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.bold
                      //     )
                      // ),
                    ),
                    Text("Card's Title",
                      // style: GoogleFonts.robotoSlab(
                      //   textStyle: TextStyle(
                      //   ),
                      // ),
                    ),
                    Text('Description',
                      // style: GoogleFonts.robotoSlab(
                      //     textStyle: TextStyle(
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.bold
                      //     )
                      // ),
                    ),
                    Text("Card's description Card's description Card's description\nCard's description Card's description Card's\n descriptionCard's description",
                      // style: GoogleFonts.robotoSlab(
                      //   textStyle: TextStyle(
                      //   ),
                      // ),
                    ),
                    Text('Attachments',
                      // style: GoogleFonts.robotoSlab(
                      //     textStyle: TextStyle(
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.bold
                      //     )
                      // ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text("image.jpg",
                              // style: GoogleFonts.robotoSlab(
                              //   textStyle: TextStyle(
                              //   ),
                              // ),
                            ),
                            SizedBox(width: 445,),
                            Icon(Icons.close,color: Colors.grey,)
                          ],
                        ),
                        Row(
                          children: [
                            Text("image.png",
                              // style: GoogleFonts.robotoSlab(
                              //   textStyle: TextStyle(
                              //   ),
                              // ),
                            ),
                            SizedBox(width: 440,),
                            Icon(Icons.close,color: Colors.grey,)
                          ],
                        ),
                        Row(
                          children: [
                            Text("qwert.file",
                              // style: GoogleFonts.robotoSlab(
                              //   textStyle: TextStyle(
                              //   ),
                              // ),
                            ),
                            SizedBox(width: 445,),
                            Icon(Icons.close,color: Colors.grey,)
                          ],
                        ),
                      ],
                    ),
                    Text('Comments',
                      // style: GoogleFonts.robotoSlab(
                      //     textStyle: TextStyle(
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.bold
                      //     )
                      // ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("111@gmail.com",
                          // style: GoogleFonts.robotoSlab(
                          //   textStyle: TextStyle(
                          //   ),
                          // ),
                        ),
                        Container(
                          height: 50,
                          width: 550,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 50,
                                  width: 500,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade200,
                                    borderRadius: BorderRadius.circular(8),
                                  ),

                                  child: Text('Text Text Text Text Text TextText Text Text Text Text Text Text Text Text Text\n Text Text Text Text Text v')),

                              SizedBox(width: 8,),
                              Icon(Icons.close,color: Colors.grey,),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("113@gmail.com",
                          // style: GoogleFonts.robotoSlab(
                          //   textStyle: TextStyle(
                          //   ),
                          // ),
                        ),
                        Container(
                          height: 100,
                          width: 550,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 50,
                                  width: 500,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade200,
                                    borderRadius: BorderRadius.circular(8),
                                  ),

                                  child: Text('Text Text Text Text Text TextText Text Text Text Text Text Text Text Text Text\n Text Text Text Text Text Text Text Text Text Text Text Text')),

                              SizedBox(width: 8,),
                              Icon(Icons.close,color: Colors.grey,),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("121@gmail.com",
                          // style: GoogleFonts.robotoSlab(
                          //   textStyle: TextStyle(
                          //   ),
                          // ),
                        ),
                        Container(
                          height: 35,
                          width: 550,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 35,
                                  width: 500,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade200,
                                    borderRadius: BorderRadius.circular(8),
                                  ),

                                  child: Text('Text Text Text Text Text TextText Text ')),

                              SizedBox(width: 8,),
                              Icon(Icons.close,color: Colors.grey,),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(icon: Icon(Icons.close,color: Colors.grey,size: 30,),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 35,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey
                      ),
                      child: Center(
                        child: Text('Delete the card',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 35,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey
                      ),
                      child: Center(
                        child: Text('Change the title',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 35,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey
                      ),
                      child: Center(
                        child: Text('Change the description',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 35,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey
                      ),
                      child: Center(
                        child: Text('Add an attachment',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 35,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey
                      ),
                      child: Center(
                        child: Text('Write a comment',
                          style: TextStyle(color: Colors.white),
                        ),
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
