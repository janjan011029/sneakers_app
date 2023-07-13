import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sneakers_app/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:sneakers_app/features/auth/presentation/pages/login.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const Login()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/welcome.png',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, authState) {
        final status = authState.authStatus;

        if (status == AuthStatus.authenticated) {
          print("tang ina gumagana");
        }
      },
      child: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.white,
        allowImplicitScrolling: true,
        autoScrollDuration: 3000,
        // globalHeader: Align(
        //   alignment: Alignment.topRight,
        //   child: SafeArea(
        //     child: Padding(
        //       padding: const EdgeInsets.only(top: 16, right: 16),
        //       child: _buildImage('flutter.png', 100),
        //     ),
        //   ),
        // ),
        // globalFooter: SizedBox(
        //   width: double.infinity,
        //   height: 60,
        //   child: RoundedButton(
        //     color: Colors.black87,
        //     title: 'Skip',
        //     onPressed: () => _onIntroEnd(context),
        //   ),
        // ),
        pages: [
          PageViewModel(
            title: "Welcome",
            body: "Buy a sneakers you want with easy tap.",
            image: _buildImage('welcome.png'),
            decoration: pageDecoration.copyWith(
              bodyFlex: 2,
              imageFlex: 4,
              bodyAlignment: Alignment.center,
              imageAlignment: Alignment.center,
            ),
          ),
          PageViewModel(
            title: "Payment",
            body: "Puchasing a product with online payment with security.",
            image: _buildImage('background.png'),
            decoration: pageDecoration.copyWith(
              bodyFlex: 2,
              imageFlex: 4,
              bodyAlignment: Alignment.center,
              imageAlignment: Alignment.center,
            ),
          ),
          PageViewModel(
            title: "More Rewards and Promos",
            body: '',
            image: _buildImage('rewards_and_promos.jpg'),
            decoration: pageDecoration.copyWith(
              bodyFlex: 2,
              imageFlex: 4,
              bodyAlignment: Alignment.center,
              imageAlignment: Alignment.center,
            ),
          ),
          PageViewModel(
            title: "Choose wisely",
            body:
                "Choose the shoes and size that you feel you'are comfortable.",
            image: _buildImage('basketball.png'),
            decoration: pageDecoration.copyWith(
              imageFlex: 3,
            ),
          ),
          PageViewModel(
            title: "Kids and teens",
            body:
                "Kids and teens can track their stocks 24/7 and place trades that you approve.",
            image: _buildImage('running.png'),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        skipOrBackFlex: 0,
        nextFlex: 0,
        // showBackButton: true,
        //rtl: true, // Display as right-to-left
        back: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        skip: const Text('Skip',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            )),
        next: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        done: const Text('Done',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            )),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          activeColor: Colors.white,
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          color: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
