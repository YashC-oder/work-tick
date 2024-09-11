import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih_1707/controllers/LocationController/LocationController.dart';
import 'package:sih_1707/views/EmployeeDetail/components/CheckInStatus.dart';

class EmployeeDetail extends ConsumerStatefulWidget {
  const EmployeeDetail({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmployeeDetailState();
}

class _EmployeeDetailState extends ConsumerState<EmployeeDetail> {
  bool? isCheckedIn;
  final LocationController _locationController = LocationController();

  @override
  void initState() {
    super.initState();
    _checkLocation(); 
  }

  Future<void> _checkLocation() async {
    double targetLatitude = 28.7041;
    double targetLongitude = 77.1025;

    bool result = await _locationController.isWithinRange(targetLatitude, targetLongitude);
    setState(() {
      isCheckedIn = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          Material(
            elevation: 2,
            color: const Color.fromARGB(255, 240, 240, 240),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.white,
                            child: const Center(
                              child: Icon(Icons.person, size: 60, color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'John Doe',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Age: 30',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Employee ID: E12345',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 1, color: Colors.grey),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDetailRow('Company :', 'Tech Innovations Inc.', context),
                        const SizedBox(height: 8),
                        _buildDetailRow('Department :', 'Software Engineering', context),
                        const SizedBox(height: 8),
                        _buildDetailRow('Designation :', 'Senior Developer', context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
          // Check-in status displayed with FutureBuilder
          if (isCheckedIn != null)
            CheckInStatus(isCheckedIn: isCheckedIn!),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: style,
        ),
        Text(
          value,
          textAlign: TextAlign.end,
          style: style,
        ),
      ],
    );
  }
}
