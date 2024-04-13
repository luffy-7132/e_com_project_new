import 'package:e_com_project_new/custom/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import '../app_theme/theme.dart';

Padding textField(
    TextEditingController controller, String text, IconData iconData) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: text,
        prefixIcon: Icon(iconData),
      ),
    ),
  );
}

ElevatedButton elevatedButton(void Function()? onpressed,
    {is_text = true, text = 'login', IconData iconData = Icons.facebook}) {
  return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
          elevation: 8,
          minimumSize: Size(400, 50),
          backgroundColor: lightColorScheme.primary),
      child: is_text
          ? Text(
              text,
              style: mtextStyle18(),
            )
          : Icon(iconData));
}

TextFormField textFormField(
    String? Function(String?)? validator, String label_text, hint_text,
    {is_password = false, required TextEditingController controller}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    obscureText: is_password ? true : false,
    obscuringCharacter: is_password ? '*' : ' ',
    decoration: InputDecoration(
      label: Text(label_text),
      hintText: hint_text,
      hintStyle: const TextStyle(
        color: Colors.black26,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black12, // Default border color
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black12, // Default border color
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

custom_snakeBar(
    BuildContext context, String title, message, ContentType contentType) {
  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: contentType,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

custom_container(
    {IconData iconData = Bootstrap.dice_4,
    double height = 40,
    double width = 40,
    double size = 22,
    is_Image = false,
    String? url}) {
  return Container(
      height: height.h,
      width: width.h,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(50)),
      child: is_Image
          ? Image.network(url!)
          : Icon(
              iconData,
              color: Colors.black,
              size: size.sp,
            ));
}

custom_textfield(
    {IconData icon = Icons.search,
    void Function()? onPressed,
    String? hintText,
    TextEditingController? controller}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
    child: SizedBox(
      height: 40.h,
      width: double.infinity,
      child: TextField(
        controller: controller,
        style: mtextStyle15(),
        autocorrect: true,
        decoration: InputDecoration(
          hintText: hintText.toString(),
          prefix: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: Colors.black,
              size: 20.sp,
            ),
          ),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(40.sp),
          ),
        ),
      ),
    ),
  );
}
