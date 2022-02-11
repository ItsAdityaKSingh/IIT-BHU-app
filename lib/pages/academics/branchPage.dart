import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iit_app/model/appConstants.dart';
import 'package:iit_app/pages/academics/branch.dart';
import 'package:iit_app/ui/snackbar.dart';

// ignore: must_be_immutable
class BranchPage extends StatefulWidget {
  //const BranchPage({ Key? key }) : super(key: key);
  final Branch branch;
  BranchPage(this.branch);

  @override
  _BranchPageState createState() => _BranchPageState(branch);
}

class _BranchPageState extends State<BranchPage> {
  final Branch branch;
  _BranchPageState(this.branch);
  Color primaryColor = Color(0xFF176EDE);
  Color bgColor = Color(0xFFFFFFFF);
  Color secondaryColor = Color(0xFFBBD9FF);
  Color containerColor = Color(0xFFF3F9FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(),
            InkWell(
                onTap: () {
                  showSnackBar(
                      context,
                      'This feature is currently under development',
                      primaryColor,
                      secondaryColor);
                },
                splashColor: primaryColor,
                borderRadius: BorderRadius.circular(15),
                child: academicInfo(
                    'Study Materials', 'assets/academics/studyMaterials.png')),
            SizedBox(
              height: 40,
            ),
            InkWell(
                onTap: () {
                  showSnackBar(
                      context,
                      'This feature is currently under development',
                      primaryColor,
                      secondaryColor);
                },
                splashColor: primaryColor,
                borderRadius: BorderRadius.circular(15),
                child: academicInfo('Academic Schedule',
                    'assets/academics/academicShedule.png')),
            SizedBox(
              height: 40,
            ),
            InkWell(
                onTap: () {
                  showSnackBar(
                      context,
                      'This feature is currently under development',
                      primaryColor,
                      secondaryColor);
                },
                splashColor: primaryColor,
                borderRadius: BorderRadius.circular(15),
                child: academicInfo(
                    'Profs and H.O.D.s', 'assets/academics/profs.png')),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios_rounded),
        color: secondaryColor,
        iconSize: 30,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            branch.branchName,
            style: TextStyle(
              color: secondaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 23,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Container(
            padding: EdgeInsets.all(8),
            height: 35.0,
            width: 35.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: (AppConstants.currentUser == null ||
                        AppConstants.isGuest == true ||
                        AppConstants.currentUser.photo_url == '')
                    ? AssetImage('assets/guest.png')
                    : NetworkImage(AppConstants.currentUser.photo_url),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(color: Colors.blueGrey, width: 2.0),
            ),
          )
        ],
      ),
    );
  }

  // PreferredSize customAppBar(BuildContext context) {
  //   return PreferredSize(
  //     preferredSize: MediaQuery.of(context).size*0.3,
  //     child: Container(
  //       height: MediaQuery.of(context).size.height*0.15,
  //       color: primaryColor,
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Row(
  //           crossAxisAlignment: CrossAxisAlignment.end,
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Row(
  //               children: [
  //                 IconButton(
  //                   onPressed: (){
  //                     Navigator.of(context).pop();
  //                   },
  //                   icon: Icon(Icons.arrow_back_ios_rounded),
  //                   color: secondaryColor,
  //                   iconSize: 30,
  //                 ),
  //                 SizedBox(width: 1,),
  //                 Padding(
  //                   padding: const EdgeInsets.only(bottom: 0),
  //                   child: Text(branch.branchName,
  //                     style: TextStyle(
  //                       color: secondaryColor,
  //                       fontWeight: FontWeight.w500,
  //                       fontSize:23,
  //                     ),),
  //                 )
  //               ],
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(bottom: 5),
  //               child: Container(
  //                 height: 35.0,
  //                 width: 35.0,
  //                 decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                     image: (AppConstants.currentUser == null ||
  //                         AppConstants.isGuest == true ||
  //                         AppConstants.currentUser.photo_url == '')
  //                         ? AssetImage('assets/guest.png')
  //                         : NetworkImage(
  //                         AppConstants.currentUser.photo_url),
  //                     fit: BoxFit.fill,
  //                   ),
  //                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
  //                   border: Border.all(color: Colors.blueGrey, width: 2.0),
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  Container academicInfo(String reqInfo, String img) {
    return Container(
      color: bgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Material(
            elevation: 3,
            shadowColor: containerColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.17,
              width: MediaQuery.of(context).size.height * 0.17,
              decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset(
                img,
                scale: 0.5,
              ),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            reqInfo,
            style: GoogleFonts.lato(
                color: primaryColor, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
