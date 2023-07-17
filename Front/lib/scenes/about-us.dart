import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About_Us extends StatelessWidget {
  const About_Us({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 42 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff171918),
          borderRadius: BorderRadius.circular(40 * fem),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                  197 * fem, 208.86 * fem, 48 * fem, 8 * fem),
              width: 643 * fem,
              height: 481 * fem,
              decoration: BoxDecoration(
                color: Color(0x9927ae60),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/page-1/images/morceaux-de-bois-hache-en-arriere-plan-photo-2-bg-mSw.png',
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 64.82 * fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 5.14 * fem, 276.22 * fem, 0 * fem),
                          width: 54.5 * fem,
                          height: 27 * fem,
                          child: Image.asset(
                            'assets/page-1/images/left-side-aHd.png',
                            width: 54.5 * fem,
                            height: 27 * fem,
                          ),
                        ),
                        // ... Rest of the children here
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        19 * fem, 0 * fem, 22 * fem, 9.82 * fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // ... Children here
                      ],
                    ),
                  ),
                  // ... Rest of the children here
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 12 * fem),
              padding:
                  EdgeInsets.fromLTRB(7 * fem, 33 * fem, 7 * fem, 12 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0, -1),
                  end: Alignment(0, 1),
                  colors: <Color>[Color(0x9927ae60), Color(0x99d9d9d9)],
                  stops: <double>[0, 1],
                ),
              ),
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.inter(
                    fontSize: 12 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2999999523 * ffem / fem,
                    color: Color(0xffffffff),
                  ),
                  children: [
                    TextSpan(
                      text: '   ',
                      style: GoogleFonts.urbanist(
                        fontSize: 12 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2999999523 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                    TextSpan(
                      text: 'About :',
                      style: GoogleFonts.urbanist(
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 0.7799999714 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ... Rest of the children here
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 19 * fem),
              width: 433 * fem,
              height: 332 * fem,
              child: Stack(
                children: [
                  Positioned(
                    left: 18 * fem,
                    top: 12 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 394 * fem,
                        height: 291 * fem,
                        child: Text(
                          'At Bricolini, we are passionate about sustainability and committed to transforming the way construction waste is handled. We specialize in collecting construction garbage from building sites and facilitating its efficient recycling and repurposing. Our mission is to minimize the environmental impact of construction projects while maximizing the value of discarded materials.',
                          style: GoogleFonts.urbanist(
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.2999999183 * ffem / fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 18 * fem,
                    top: 192 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 407 * fem,
                        height: 129 * fem,
                        child: Text(
                          'Join us at Bricolini as we lead the way in revolutionizing construction waste management. Together, we can create a greener, more sustainable future while unlocking the hidden value in discarded construction materials. Contact us today to explore how we can tailor our waste management solutions to meet your specific needs and contribute to a more circular economy.',
                          style: GoogleFonts.urbanist(
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.2999999183 * ffem / fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ... Rest of the Positioned children here
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(14 * fem, 0 * fem, 0 * fem, 0 * fem),
              width: 433 * fem,
              height: 85 * fem,
              decoration: BoxDecoration(
                color: Color(0xff333333),
                borderRadius: BorderRadius.circular(10 * fem),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              11 * fem, 0 * fem, 0 * fem, 0 * fem),
                          child: Text(
                            '30,000',
                            style: GoogleFonts.urbanist(
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.3 * ffem / fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        // ... Rest of the Text children here
                      ],
                    ),
                  ),
                  // ... Rest of the Row children here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
