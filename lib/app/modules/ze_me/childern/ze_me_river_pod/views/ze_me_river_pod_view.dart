import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:get/get.dart';

import '../controllers/ze_me_river_pod_controller.dart';
import 'theme.dart';
import 'theme_provider.dart';

class ZeMeRiverPodView extends ConsumerStatefulWidget {
  const ZeMeRiverPodView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ZeMeRiverPodViewState();
}

class _ZeMeRiverPodViewState extends ConsumerState<ZeMeRiverPodView> {

  final controller = Get.put(ZeMeRiverPodController());

  final tfController = useTextEditingController(text: 'initial text');
@override
  void dispose() {
    Get.delete<ZeMeRiverPodController>();
    super.dispose();
  }

  void _showThemeDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Light Theme'),
                onTap: () {
                  ref.read(themeNotifierProvider.notifier).setTheme(AppThemes.lightTheme);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Dark Theme'),
                onTap: () {
                  ref.read(themeNotifierProvider.notifier).setTheme(AppThemes.darkTheme);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Blue Theme'),
                onTap: () {
                  ref.read(themeNotifierProvider.notifier).setTheme(AppThemes.blueTheme);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Green Theme'),
                onTap: () {
                  ref.read(themeNotifierProvider.notifier).setTheme(AppThemes.greenTheme);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZeMeRiverPodView'),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ZeMeRiverPodView is working',
              style: TextStyle(fontSize: 20),
            ),
            ListTile(
              title: const Text('Light Theme'),
              onTap: () {
                ref.read(themeNotifierProvider.notifier).setTheme(AppThemes.lightTheme);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Dark Theme'),
              onTap: () {
                ref.read(themeNotifierProvider.notifier).setTheme(AppThemes.darkTheme);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Blue Theme'),
              onTap: () {
                ref.read(themeNotifierProvider.notifier).setTheme(AppThemes.blueTheme);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Green Theme'),
              onTap: () {
                ref.read(themeNotifierProvider.notifier).setTheme(AppThemes.greenTheme);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

