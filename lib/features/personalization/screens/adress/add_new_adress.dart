import 'package:flutter/material.dart';
import 'package:shinex/common/widgets/appbar/appbar.dart';
import 'package:shinex/utils/constants/sizes.dart';

class AddNewAdressScreen extends StatelessWidget {
  const AddNewAdressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppbar(
        showBackArrow: true,
        title: Text('Yeni Adres Ekle'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultspace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.person), labelText: 'İsim'),
                ),
                const SizedBox(height: TSizes.spacebtwinputfields),
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.phone), labelText: 'Telefon Numarası'),
                ),
                const SizedBox(height: TSizes.spacebtwinputfields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(prefixIcon: Icon(Icons.build), labelText: 'Sokak'),
                      ),
                    ),
                    const SizedBox(height: TSizes.spacebtwinputfields),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(prefixIcon: Icon(Icons.code), labelText: 'Posta Kodu'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spacebtwinputfields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(prefixIcon: Icon(Icons.build), labelText: 'Şehir'),
                      ),
                    ),
                    const SizedBox(height: TSizes.spacebtwinputfields),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(prefixIcon: Icon(Icons.local_activity), labelText: 'Durum'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spacebtwinputfields),
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.web), labelText: 'Ülke'),
                ),
                const SizedBox(height: TSizes.defaultspace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Kaydet'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
