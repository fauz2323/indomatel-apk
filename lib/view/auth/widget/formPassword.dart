import 'package:flutter/material.dart';
import 'package:indomartel/controller/auth/daftarController.dart';
import 'package:get/get.dart';

class FormPassword extends StatelessWidget {
  final DaftarController _daftarController = Get.put(DaftarController());
  final TextEditingController usernameController;
  final label;
  final lock;
  final IconData icon;
  FormPassword(
      {Key? key,
      required this.usernameController,
      this.label,
      required this.icon,
      this.lock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => TextFormField(
            obscureText: _daftarController.lock.value,
            controller: usernameController,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.all(4),
                child: Icon(icon),
              ),
              labelText: label,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(96, 239, 255, 1), width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(0, 255, 135, 1), width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.all(4),
                child: Obx(
                  () => IconButton(
                      icon: (_daftarController.lock.value)
                          ? Icon(Icons.remove_red_eye)
                          : Icon(Icons.remove_red_eye_outlined),
                      onPressed: () {
                        _daftarController.lock.value =
                            !_daftarController.lock.value;
                      }),
                ),
              ),
            ),
          ),
        ));
  }
}
