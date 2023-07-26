import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff171918),
          borderRadius: BorderRadius.circular(40 * fem),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  EdgeInsets.fromLTRB(14 * fem, 7 * fem, 16 * fem, 34 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        2 * fem, 0 * fem, 166 * fem, 0 * fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 3 * fem, 0 * fem, 0 * fem),
                            child: Text(
                              'UserName:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.4 * ffem / fem,
                                letterSpacing: 0.200000003 * fem,
                                color: Color(0xff27ae60),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Other elements go here...
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        7 * fem, 0 * fem, 11 * fem, 0 * fem),
                    width: double.infinity,
                    height: 58 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xff27ae60),
                      borderRadius: BorderRadius.circular(100 * fem),
                    ),
                    child: Center(
                      child: Center(
                        child: Text(
                          'change informations',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.3999999762 * ffem / fem,
                            letterSpacing: 0.200000003 * fem,
                            color: Color(0xffffffff),
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
  }
}
