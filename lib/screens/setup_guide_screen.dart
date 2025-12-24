import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SetupGuideScreen extends StatelessWidget {
  const SetupGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup Guide'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.rocket_launch,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      size: 32,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Getting Started with Termux',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Follow these steps to set up Termux properly',
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
            const SizedBox(height: 24),
            _buildStepCard(
              context,
              stepNumber: '1',
              title: 'Download & Install',
              content:
                  'Download Termux from F-Droid or GitHub. Avoid outdated Play Store version.',
              icon: Icons.download,
              commands: [
                'F-Droid: https://f-droid.org/packages/com.termux/',
                'GitHub: https://github.com/termux/termux-app/releases',
              ],
            ),
            _buildStepCard(
              context,
              stepNumber: '2',
              title: 'First Launch Setup',
              content: 'When you first open Termux, it will set up the environment automatically. Wait for the initial setup to complete.',
              icon: Icons.settings,
            ),
            _buildStepCard(
              context,
              stepNumber: '3',
              title: 'Update Package Lists',
              content: 'Update the package repository to get the latest package information.',
              icon: Icons.refresh,
              commands: ['pkg update && pkg upgrade'],
            ),
            _buildStepCard(
              context,
              stepNumber: '4',
              title: 'Grant Storage Permission',
              content: 'Allow Termux to access your device storage for file operations.',
              icon: Icons.folder,
              commands: ['termux-setup-storage'],
              note: 'Accept the permission prompt that appears',
            ),
            _buildStepCard(
              context,
              stepNumber: '5',
              title: 'Install Essential Packages',
              content: 'Install commonly used packages for development and productivity.',
              icon: Icons.extension,
              commands: [
                'pkg install git',
                'pkg install nano',
                'pkg install python',
                'pkg install nodejs',
                'pkg install openssh',
              ],
            ),
            _buildStepCard(
              context,
              stepNumber: '6',
              title: 'Configure Text Editor',
              content: 'Set up a text editor like Nano or Vim for editing files.',
              icon: Icons.edit,
              commands: [
                'nano ~/.bashrc',
                'Add your custom aliases and settings',
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Essential Commands',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            _buildCommandCard(
              context,
              category: 'Navigation',
              commands: [
                {'cmd': 'ls', 'desc': 'List files and directories'},
                {'cmd': 'cd <directory>', 'desc': 'Change directory'},
                {'cmd': 'pwd', 'desc': 'Print working directory'},
                {'cmd': 'mkdir <name>', 'desc': 'Create directory'},
              ],
            ),
            _buildCommandCard(
              context,
              category: 'File Operations',
              commands: [
                {'cmd': 'touch <file>', 'desc': 'Create empty file'},
                {'cmd': 'cp <source> <dest>', 'desc': 'Copy file'},
                {'cmd': 'mv <source> <dest>', 'desc': 'Move/rename file'},
                {'cmd': 'rm <file>', 'desc': 'Remove file'},
                {'cmd': 'cat <file>', 'desc': 'Display file content'},
              ],
            ),
            _buildCommandCard(
              context,
              category: 'System',
              commands: [
                {'cmd': 'clear', 'desc': 'Clear terminal screen'},
                {'cmd': 'exit', 'desc': 'Exit Termux'},
                {'cmd': 'whoami', 'desc': 'Show current user'},
                {'cmd': 'uname -a', 'desc': 'Show system information'},
              ],
            ),
            const SizedBox(height: 24),
            _buildTroubleshootingSection(context),
            const SizedBox(height: 24),
            _buildTipsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStepCard(
    BuildContext context, {
    required String stepNumber,
    required String title,
    required String content,
    required IconData icon,
    List<String>? commands,
    String? note,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      stepNumber,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (commands != null) ...[
              const SizedBox(height: 12),
              ...commands.map((cmd) => _buildCommandChip(context, cmd)),
            ],
            if (note != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.lightbulb,
                      size: 20,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        note,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSecondaryContainer,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCommandChip(BuildContext context, String command) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {
          Clipboard.setData(ClipboardData(text: command));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Copied: $command'),
              duration: const Duration(seconds: 2),
            ),
          );
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  command,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Icon(
                Icons.copy,
                size: 16,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommandCard(
    BuildContext context, {
    required String category,
    required List<Map<String, String>> commands,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            ...commands.map((cmd) => _buildCommandItem(
                  context,
                  command: cmd['cmd']!,
                  description: cmd['desc']!,
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildCommandItem(
    BuildContext context, {
    required String command,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {
          Clipboard.setData(ClipboardData(text: command));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Copied: $command'),
              duration: const Duration(seconds: 2),
            ),
          );
        },
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Icon(
                Icons.terminal,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      command,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontFamily: 'monospace',
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.copy,
                size: 14,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTroubleshootingSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.build,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Text(
                  'Troubleshooting',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildTroubleshootItem(
              context,
              problem: 'Packages won\'t install',
              solution: 'Run: pkg update && pkg upgrade',
            ),
            _buildTroubleshootItem(
              context,
              problem: 'Storage permission denied',
              solution: 'Run: termux-setup-storage and grant permission',
            ),
            _buildTroubleshootItem(
              context,
              problem: 'Command not found',
              solution: 'Install the package: pkg install <package-name>',
            ),
            _buildTroubleshootItem(
              context,
              problem: 'Terminal frozen',
              solution: 'Press Ctrl+C to stop current process',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTroubleshootItem(
    BuildContext context, {
    required String problem,
    required String solution,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.error_outline,
                size: 18,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  problem,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 26),
            child: Text(
              solution,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipsSection(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.tertiaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.tips_and_updates,
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                ),
                const SizedBox(width: 12),
                Text(
                  'Pro Tips',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildTipItem(
              context,
              'Use Tab key for auto-completion of commands and file names',
            ),
            _buildTipItem(
              context,
              'Press Volume Up + Q to show extra keys bar',
            ),
            _buildTipItem(
              context,
              'Long press on terminal to paste text',
            ),
            _buildTipItem(
              context,
              'Use "history" command to see previous commands',
            ),
            _buildTipItem(
              context,
              'Install "termux-api" for device hardware access',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipItem(BuildContext context, String tip) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            size: 18,
            color: Theme.of(context).colorScheme.onTertiaryContainer,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              tip,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
