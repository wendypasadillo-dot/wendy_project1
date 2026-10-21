import 'package:flutter/material.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

enum ReportUiState { idle, loading, success, empty, error }

class ReportFormScreen extends StatefulWidget {
  const ReportFormScreen({super.key});

  @override
  State<ReportFormScreen> createState() => _ReportFormScreenState();
}

class _ReportFormScreenState extends State<ReportFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  ReportUiState _uiState = ReportUiState.idle;
  String _errorMessage = '';
  bool _simulateFailure = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> submitReport() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _uiState = ReportUiState.loading);

    try {
      await Future<void>.delayed(const Duration(seconds: 3));

      if (_simulateFailure) {
        throw Exception('Network failure (simulated)');
      }

      if (!mounted) return;
      setState(() => _uiState = ReportUiState.success);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = e.toString();
        _uiState = ReportUiState.error;
      });
    }
  }

  void _retry() {
    setState(() {
      _simulateFailure = false;
      _uiState = ReportUiState.idle;
    });
    submitReport();
  }

  void _resetForm() {
    _titleController.clear();
    _descriptionController.clear();
    setState(() => _uiState = ReportUiState.idle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Report')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextField(
                controller: _titleController,
                label: 'Report Title',
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Title is required' : null,
              ),
              const SizedBox(height: 12),
              AppTextField(
                controller: _descriptionController,
                label: 'Description',
                maxLines: 3,
                validator: (v) =>
                    (v == null || v.trim().length < 10)
                        ? 'Description must be at least 10 characters'
                        : null,
              ),
              const SizedBox(height: 16),
              AppButton(
                label: 'Submit Report',
                onPressed: _uiState == ReportUiState.loading ? null : submitReport,
              ),
              const SizedBox(height: 12),
              SwitchListTile(
                title: const Text('Simulate Failure (for demo)'),
                value: _simulateFailure,
                onChanged: (v) => setState(() => _simulateFailure = v),
              ),
              const SizedBox(height: 24),
              TextButton(
  onPressed: () {
    // Kini maoy mo-trigger sa empty state
    setState(() => _uiState = ReportUiState.empty); 
  },
  child: const Text('View Reports (Empty preview)'),
),
              _buildStatePanel(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatePanel() {
    switch (_uiState) {
      case ReportUiState.idle:
        return const SizedBox.shrink();

      case ReportUiState.loading:
        return const Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 8),
            Text('Submitting your report...'),
          ],
        );

      case ReportUiState.success:
        return Card(
          color: Colors.green.shade50,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 48),
                const SizedBox(height: 8),
                const Text('Report submitted successfully!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: _resetForm,
                  child: const Text('Create Another Report'),
                ),
              ],
            ),
          ),
        );

      case ReportUiState.empty:
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Icon(Icons.inbox, size: 48, color: Colors.grey),
                const SizedBox(height: 8),
                const Text('No reports found.'),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: _resetForm,
                  child: const Text('Create First Report'),
                ),
              ],
            ),
          ),
        );

      case ReportUiState.error:
        return Card(
          color: Colors.red.shade50,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Icon(Icons.error, color: Colors.red, size: 48),
                const SizedBox(height: 8),
                Text('Submission failed: $_errorMessage'),
                const SizedBox(height: 8),
                ElevatedButton(onPressed: _retry, child: const Text('Retry')),
              ],
            ),
          ),
        );
    }
  }
}