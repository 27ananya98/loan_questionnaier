

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:loan_project/controller/home_controller.dart';
import 'package:loan_project/main.dart';
import 'package:loan_project/routes/RoutesClass.dart';

class HomeScreen extends ParentWidget{

  HomeController controller  = Get.put(HomeController());
  @override
  Widget buildingView(BuildContext context, double h, double w) {
   return Obx(() =>Container(
     height: h,
     // margin:  EdgeInsets.only(top: h*0.25),

       child : Column(
         crossAxisAlignment:  CrossAxisAlignment.start,

         children: [


           Container(
             margin: EdgeInsets.only(top: 80,bottom: 30,left: 10),
             child: Text(controller.questionModel.value.title??"",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
           ),
           Container(
             margin: EdgeInsets.symmetric(horizontal: 10.0),
             child: Row(
               children: List.generate(controller.questionModel.value.schema?.fields?.length??0, (parentIndex) => Expanded(
                 child: Container(
                   margin: EdgeInsets.symmetric(horizontal: 3.0),
                   height: 4,
                   color: controller.currentIndex.value==parentIndex?Colors.green:Colors.grey,



                 ),
               )),
             ),
           ),

           Container(
             margin: EdgeInsets.only(top: h*0.025 ,left: 20.0),
             child: Text(controller.questionModel.value.schema?.fields?[controller.currentIndex.value].schema?.label??'',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
           ),
           if(controller.questionModel.value.schema?.fields?[controller.currentIndex.value].type!="Section")
             GetBuilder<HomeController>(builder:(control) => ListView.builder(
               shrinkWrap: true,
               itemCount: control.questionModel.value.schema?.fields?[control.currentIndex.value].schema?.options?.length??0,
               itemBuilder:(context,index){
                 control.indexValue.add(false);
                 return GestureDetector(
                   onTap: (){
                     controller.handleSingleSelect(index);
                     print(control.selectedOptions);
                    // control.selectedOptions[control.currentIndex.value].add(control.questionModel.value.schema?.fields?[control.currentIndex.value].schema?.options?[index].value??'');
                   control.update();
                     },

                   child:  Container(
                     margin: EdgeInsets.symmetric(horizontal: 20.0 ,vertical: 10.0),
                     height: h*0.05,
                     width: w,
                     decoration: BoxDecoration(
                       border: Border.all(color: control.selectedOptions[control.currentIndex.value].contains(control.questionModel.value.schema?.fields?[control.currentIndex.value].schema?.options?[index].value) == true?Colors.deepOrangeAccent:Colors.grey),

                     ),
                     child: Row(
                       children: [
                         control.selectedOptions[control.currentIndex.value].contains(control.questionModel.value.schema?.fields?[control.currentIndex.value].schema?.options?[index].value) == true?
                         Container(
                           margin: EdgeInsets.symmetric(horizontal: 10.0),
                           height : 20,
                           width: 20,
                           child: Container(
                             height: 15,
                             width: 15,

                             margin: EdgeInsets.all(3),
                             decoration: BoxDecoration(
                                 color: Colors.deepOrange,
                                 shape: BoxShape.circle

                             ),
                           ),
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             border: Border.all(color: Colors.deepOrangeAccent),

                           ),
                         ):Container(
                           margin: EdgeInsets.symmetric(horizontal: 10.0),
                           height : 20,
                           width: 20,
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             border: Border.all(color: Colors.deepOrangeAccent),

                           ),
                         ),
                         Text(control.questionModel.value.schema?.fields?[control.currentIndex.value].schema?.options?[index].value??''),

                       ],
                     ) ,
                   ),
                 );

               }
           ))
           else
              GetBuilder<HomeController>(builder:(control) =>
              ListView.builder(
               shrinkWrap: true,
               itemCount: control.questionModel.value.schema?.fields?[controller.currentIndex.value].schema?.fields?.length??0,
               itemBuilder:(context,outerIndex){
                 controller.textFields.add(TextEditingController());

                 return GestureDetector(
                   child: Column(
                     children: [
                       Container(
                           child:Text(controller.questionModel.value.schema?.fields?[controller.currentIndex.value].schema?.fields?[outerIndex].schema?.label??"",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                       controller.questionModel.value.schema?.fields?[controller.currentIndex.value].schema?.fields?[outerIndex].type=="Numeric"||controller.questionModel.value.schema?.fields?[controller.currentIndex.value].schema?.fields?[outerIndex].type=="Label"?
                       Container(
                         height: 40,
                         width :w*0.7,

                         decoration: BoxDecoration(
                             border: Border.all(color: Colors.grey)
                         ),child: TextField(
                         controller: controller.textFields[outerIndex],
                         textAlign: TextAlign.left,
                         decoration: InputDecoration(
                           hintText: 'Enter Something',
                           contentPadding: EdgeInsets.all(3.0),
                         ),

                          keyboardType: controller.questionModel.value.schema?.fields?[controller.currentIndex.value].schema?.fields?[outerIndex].type=="Numeric"?TextInputType.number:TextInputType.text,
                         onSubmitted: (value){

                            },




                         onTap: (){
                           },
                       )
                       ):GetBuilder<HomeController>(builder:(control) =>
                            ListView.builder(
                               shrinkWrap: true,
                               itemCount: controller.questionModel.value.schema?.fields?[controller.currentIndex.value].schema?.fields?[outerIndex].schema?.options?.length??0,
                               itemBuilder:(context,innerIndex){

                             return GestureDetector(
                               onTap: (){
                                 if(control.selectedOptions[control.currentIndex.value].length>outerIndex)
                                 control.selectedOptions[control.currentIndex.value][outerIndex]=controller.questionModel.value.schema?.fields?[controller.currentIndex.value].schema?.fields?[outerIndex].schema?.options?[innerIndex].value??"";
                                 else
                                 control.selectedOptions[control.currentIndex.value].add(controller.questionModel.value.schema?.fields?[controller.currentIndex.value].schema?.fields?[outerIndex].schema?.options?[innerIndex].value??"");

                                 print(control.selectedOptions);
                                 control.update();
                               },
                               child: Container(
                                 margin: EdgeInsets.symmetric(horizontal: 20.0 ,vertical: 10.0),
                                 height: h*0.05,
                                 width: w,
                                 decoration: BoxDecoration(
                                   border: Border.all(color:control.selectedOptions[control.currentIndex.value].contains(controller.questionModel.value.schema?.fields?[controller.currentIndex.value].schema?.fields?[outerIndex].schema?.options?[innerIndex].value??"")==true?Colors.deepOrangeAccent:Colors.grey

                                 )),
                                 child: Row(
                                   children: [
                                     control.selectedOptions[control.currentIndex.value].contains(controller.questionModel.value.schema?.fields?[controller.currentIndex.value].schema?.fields?[outerIndex].schema?.options?[innerIndex].value??"")==true?
                                     Container(
                                       margin: EdgeInsets.symmetric(horizontal: 10.0),
                                       height : 20,
                                       width: 20,
                                       child: Container(
                                         height: 15,
                                         width: 15,

                                         margin: EdgeInsets.all(3),
                                         decoration: BoxDecoration(
                                             color: Colors.deepOrange,
                                             shape: BoxShape.circle

                                         ),
                                       ),
                                       decoration: BoxDecoration(
                                         shape: BoxShape.circle,
                                         border: Border.all(color: Colors.deepOrangeAccent),

                                       ),
                                     ):Container(
                                       margin: EdgeInsets.symmetric(horizontal: 10.0),
                                       height : 20,
                                       width: 20,
                                       decoration: BoxDecoration(
                                         shape: BoxShape.circle,
                                         border: Border.all(color: Colors.deepOrangeAccent),

                                       ),
                                     ),
                                     Text(controller.questionModel.value.schema?.fields?[controller.currentIndex.value].schema?.fields?[outerIndex].schema?.options?[innerIndex].value??''),

                                   ],
                                 ) ,
                               ),
                             );
                           }
                       ))

                     ],
                   ),
                 );
               }
           )),
           Spacer(),
           Row(
             children: [
               if(controller.currentIndex.value!=0)
               GestureDetector(
                 onTap: ()=>controller.prevQuestion(),
                 child: Container(

                   margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                   child: Text("< Back",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                 ),
               ),
               Spacer(),
               GestureDetector(
                 onTap:() {
                   if(controller.currentIndex.value+1==controller.questionModel.value.schema?.fields?.length) {
                     print('GestureDetector tapped');
                     controller.gotoSumitScreen();
                   }else{
                     if (controller.currentIndex.value == 2) {
                       // Handle the special case when the current index is 2
                       controller.selectedOptions[controller.currentIndex.value] = [
                         controller.textFields[0].text,
                         controller.textFields[1].text,
                       ];
                     }
                       // Handle the normal case for other indices
                       controller.nextQuestion();

                   }



                 // if(controller.currentIndex.value==controller.questionModel.value.schema?.fields?.length-1){

                 // }



                 },
                 child: Center(
                   child: Container(
                     height: 50,
                     width: 50,
                     margin: EdgeInsets.symmetric(horizontal: 10.0),
                     decoration: BoxDecoration(
                       color: Colors.deepOrange,
                       shape: BoxShape.circle
                     ),
                     child: Icon(Icons.arrow_forward_ios,size: 24,color: Colors.white,)
                   ),
                 ),
               ),
             ],
           ),
           SizedBox(height: 50,)
         ],
       )

   ));
  }
  
}