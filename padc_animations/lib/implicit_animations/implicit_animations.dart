import 'package:flutter/material.dart';
import 'package:padc_animations/utils/dimens.dart';

const kAnimationDuration = const Duration(milliseconds: 500);

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  bool isNewDimensions = false;
  bool isDescriptionShown = true;
  bool isChangeBackgroundColor = false;
  bool isChangeButtonsLayout = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: kAnimationDuration,
        color: (isChangeBackgroundColor) ? Colors.black : Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                width: (isNewDimensions) ? 300 : 200,
                height: (isNewDimensions) ? 300 : 200,
                duration: kAnimationDuration,
                curve: Curves.easeInCubic,
                child: Image.asset(
                  "assets/bird_image.png",
                  fit: BoxFit.cover,
                ),
              ),
              AnimatedSize(
                duration: kAnimationDuration,
                child: Container(
                  height: isDescriptionShown ? null : 0.0,
                  child: Column(
                    children: [
                      SizedBox(
                        height: kMarginMedium2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kMarginMedium2),
                        child: Text(
                          "Birds are vertebrates (animals with backbones) with wings and feathers. Most birds can fly, using powerful muscles to flap their wings. ... Birds' bodies are covered with a light, tough layer of feathers and they have very light skeletons. Instead of teeth, they have hornlike beaks, or bills.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isChangeBackgroundColor
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: kMarginMedium2),
              AnimatedSize(
                duration: kAnimationDuration,
                child: AnimatedSwitcher(
                  duration: kAnimationDuration,
                  child: (isChangeButtonsLayout)
                      ? Wrap(
                          alignment: WrapAlignment.center,
                          spacing: kMarginMedium2,
                          children: [
                            PrimaryButton(
                              onTap: () {
                                setState(() {
                                  isNewDimensions = !isNewDimensions;
                                });
                              },
                              label: "Change Dimensions",
                            ),
                            PrimaryButton(
                              onTap: () {
                                setState(() {
                                  isDescriptionShown = !isDescriptionShown;
                                });
                              },
                              label: (isDescriptionShown)
                                  ? "Hide Description"
                                  : "Show Description",
                            ),
                            PrimaryButton(
                              onTap: () {
                                setState(() {
                                  isChangeBackgroundColor =
                                      !isChangeBackgroundColor;
                                });
                              },
                              label: "Change Theme",
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            PrimaryButton(
                              onTap: () {
                                setState(() {
                                  isNewDimensions = !isNewDimensions;
                                });
                              },
                              label: "Change Dimensions",
                            ),
                            PrimaryButton(
                              onTap: () {
                                setState(() {
                                  isDescriptionShown = !isDescriptionShown;
                                });
                              },
                              label: (isDescriptionShown)
                                  ? "Hide Description"
                                  : "Show Description",
                            ),
                            PrimaryButton(
                              onTap: () {
                                setState(() {
                                  isChangeBackgroundColor =
                                      !isChangeBackgroundColor;
                                });
                              },
                              label: "Change Theme",
                            ),
                          ],
                        ),
                ),
              ),
              SizedBox(height: kMarginMedium2),
              PrimaryButton(
                onTap: () {
                  setState(() {
                    isChangeButtonsLayout = !isChangeButtonsLayout;
                  });
                },
                label: "Change Button Layout",
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final Function onTap;
  final String label;
  final Color color;

  PrimaryButton(
      {required this.onTap,
      required this.label,
      this.color = Colors.blueAccent});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onTap(),
      child: Text(label),
      textColor: Colors.white,
      color: color,
    );
  }
}
