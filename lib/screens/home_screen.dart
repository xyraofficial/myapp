import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Termux Information'),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.themeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () => themeProvider.toggleTheme(),
            tooltip: 'Toggle Theme',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(
                      Icons.terminal,
                      size: 80,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Termux',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 36,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Terminal Emulator for Android',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildInfoSection(
              context,
              title: 'What is Termux?',
              content:
                  'Termux is a powerful terminal emulator and Linux environment app for Android that works directly with no rooting or setup required. It combines powerful terminal emulation with an extensive Linux package collection.',
              icon: Icons.info,
            ),
            const SizedBox(height: 16),
            _buildInfoSection(
              context,
              title: 'Key Features',
              icon: Icons.star,
              children: [
                _buildFeatureItem(context, 'Access to Linux command-line shell'),
                _buildFeatureItem(context, 'Extensive package management with APT'),
                _buildFeatureItem(context, 'Support for Python, Ruby, Node.js, and more'),
                _buildFeatureItem(context, 'SSH client for remote server access'),
                _buildFeatureItem(context, 'Text editors like Vim, Emacs, and Nano'),
                _buildFeatureItem(context, 'Git version control system'),
                _buildFeatureItem(context, 'Development tools and compilers'),
                _buildFeatureItem(context, 'No root access required'),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoSection(
              context,
              title: 'System Requirements',
              icon: Icons.phone_android,
              children: [
                _buildFeatureItem(context, 'Android 7.0 (API 24) or higher'),
                _buildFeatureItem(context, 'At least 200 MB free storage'),
                _buildFeatureItem(context, 'ARM, ARM64, x86, or x86_64 processor'),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoSection(
              context,
              title: 'Use Cases',
              icon: Icons.work,
              children: [
                _buildFeatureItem(context, 'Learn Linux command-line'),
                _buildFeatureItem(context, 'Programming and development on mobile'),
                _buildFeatureItem(context, 'System administration tasks'),
                _buildFeatureItem(context, 'Running scripts and automation'),
                _buildFeatureItem(context, 'Educational purposes'),
                _buildFeatureItem(context, 'Penetration testing and security research'),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoSection(
              context,
              title: 'Important Notes',
              icon: Icons.warning_amber,
              content:
                  'Termux is not officially available on Google Play Store. Download it from F-Droid or GitHub releases. Always verify the source before installation to ensure security.',
            ),
            const SizedBox(height: 24),
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.link,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Official Resources',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'GitHub: termux/termux-app',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                                ),
                          ),
                          Text(
                            'Wiki: wiki.termux.com',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(
    BuildContext context, {
    required String title,
    String? content,
    List<Widget>? children,
    required IconData icon,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (content != null)
              Text(
                content,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            if (children != null) ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            size: 20,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
