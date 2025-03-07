import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hiteshsapra/theme/image_assets.dart';
import 'package:hiteshsapra/widget/custom_button.dart';
import 'package:hiteshsapra/widget/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactTab extends StatefulWidget {
  const ContactTab({super.key});

  @override
  _ContactTabState createState() => _ContactTabState();
}

class _ContactTabState extends State<ContactTab> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

Future<void> _sendEmail(Uri mailtoUrl) async {
      if (await canLaunchUrl(mailtoUrl)) {
        await launchUrl(mailtoUrl);
      } else {
        throw 'Could not send email';
      }
    }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);

    final contactItems = [
      {
        "icon": Icons.location_on,
        "iconColor": Colors.orange,
        "title": "Address",
        "subtitle": "Bangalore, India",
      },
      {
        "icon": Icons.email,
        "iconColor": Colors.green,
        "title": "Email",
        "subtitle": "tanmaymishra0108@gmail.com",
        "url": "mailto:tanmaymishra0108@gmail.com"
      },
      {
        "icon": Icons.phone,
        "iconColor": Colors.purple,
        "title": "Phone",
        "subtitle": "+91 9958301087",
        "url": "tel:+919958301087"
      },
    ];

    InputDecoration inputDecoration(String labelText) {
      return InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: theme.primaryColor),
        ),
      );
    }

    Widget buildContactItem(Map<String, dynamic> item) {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: item["iconColor"],
              child: Icon(item["icon"], color: Colors.white),
            ),
            const SizedBox(width: 20),
            TextButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
              ),
              onPressed: () async {
                if (item["url"] != null) {
                  final url = Uri.parse(item["url"]!);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item["title"]!,
                    style: theme.textTheme.titleSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item["subtitle"]!,
                    style: theme.textTheme.titleSmall!
                        .copyWith(color: theme.primaryColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget buildContactForm() {
      return Column(
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: nameController,
                  decoration: inputDecoration('Your Name'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: emailController,
                  decoration: inputDecoration('Your Email'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: phoneController,
                  decoration: inputDecoration('Your Phone'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: subjectController,
                  decoration: inputDecoration('Subject'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: messageController,
            maxLines: 5,
            decoration: inputDecoration('Write your message here'),
          ),
          const SizedBox(height: 16),
          CustomButton(
            onPressed: () {
              final name = nameController.text;
              final email = emailController.text;
              final phone = phoneController.text;
              final subject = subjectController.text;
              final message = messageController.text;

              final mailtoUrl = Uri(
                scheme: 'mailto',
                path: 'tanmaymishra0108@gmail.com',
                queryParameters: {
                  'subject': subject,
                  'body': 'Name: $name\nEmail: $email\nPhone: $phone\n\n$message',
                },
              );

              _sendEmail(mailtoUrl);
            },
            text: 'Submit Now',
            width: 200,
            height: 50,
            color: theme.primaryColor,
            backgroundColor: theme.primaryColor,
            borderColor: theme.primaryColor,
            borderWidth: 1.0,
            borderRadius: BorderRadius.circular(30),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            textStyle: theme.textTheme.titleSmall!.copyWith(fontSize: 16),
            animationDuration: const Duration(milliseconds: 300),
          )
        ],
      );
    }

    

    Widget buildHeading() {
      return Row(
        children: [
          if (!isMobile) const Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  'Contact Me',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall!
                      .copyWith(fontSize: 20 * 1.2, color: theme.primaryColor),
                ),
                if (!isMobile)
                  const SizedBox(
                    height: 20,
                  ),
                Text(
                  'I Want To Hear From You',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall!
                      .copyWith(fontSize: 20 * 2, color: theme.highlightColor),
                ),
                const SizedBox(height: 20),
                
                if (!isMobile)
                  const SizedBox(
                    height: 30,
                  ),
              ],
            ),
          ),
          if (!isMobile) const Expanded(flex: 1, child: SizedBox()),
        ],
      );
    }

    Widget buildMobileLayout() {
      return Column(
        children: [
          Stack(
            children: [
           
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    buildHeading(),
                    const SizedBox(height: 20),
                    ...contactItems.map(buildContactItem),
                    const SizedBox(height: 32),
                    buildContactForm(),
                  ],
                ),
              ),
            ],
          ),
          const Footer(),
        ],
      );
    }

    Widget buildTabletLayout() {
      return Column(
        children: [
          Stack(
            children: [
           
              Padding(
                padding: const EdgeInsets.only(
                    left: 150, right: 150, bottom: 150),
                child: Column(
                  children: [
                    buildHeading(),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children:
                                contactItems.map(buildContactItem).toList(),
                          ),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          child: buildContactForm(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Footer(),
        ],
      );
    }

    return Container(
      color: theme.scaffoldBackgroundColor,
      child: Responsive(
        mobile: buildMobileLayout(),
        tablet: buildTabletLayout(),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      color: theme.secondaryHeaderColor,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Developed with love by Tanmay Mishra',
                  style: theme.textTheme.titleSmall!
                      .copyWith(fontSize: 18, color: theme.hoverColor),
                ),
               
                TextSpan(
                  text: '© ${DateTime.now().year}',
                  style: theme.textTheme.titleSmall!
                      .copyWith(fontSize: 18, color: theme.hoverColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     TextButton(
          //       onPressed: () {},
          //       child: Text(
          //         'Terms & Condition',
          //         style: theme.textTheme.titleSmall!.copyWith(fontSize: 16),
          //       ),
          //     ),
          //     if (!isMobile) const SizedBox(width: 16),
          //     TextButton(
          //       onPressed: () {},
          //       child: Text(
          //         'Privacy Policy',
          //         style: theme.textTheme.titleSmall!.copyWith(fontSize: 16),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
