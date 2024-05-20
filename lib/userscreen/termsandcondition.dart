// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TermsandCondition extends StatefulWidget {
  const TermsandCondition({Key? key}) : super(key: key);

  @override
  State<TermsandCondition> createState() => _TermsandConditionState();
}

class _TermsandConditionState extends State<TermsandCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 49, 83),
        title: Text('Terms & Condition'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            '''
            Welcome to QuickSpot!

            By using our application, you agree to abide by the following terms and conditions:

            1. Acceptance of Terms:
               - You must comply with and be bound by these terms while using QuickSpot.

            2. User Registration:
               - Provide accurate and current information during registration.
               - Maintain the confidentiality of your account and password.

            3. Parking Services:
               - QuickSpot provides a platform to find and reserve parking spaces.
               - Users must adhere to the rules and regulations of each parking facility.

            4. Payment and Fees:
               - Users may be required to pay fees for parking services through the App.
               - All payment information provided must be accurate and current.

            5. Cancellations and Refunds:
               - Users can cancel parking reservations subject to the cancellation policy of each parking facility.
               - Refund policies are determined by the specific terms of each transaction.

            6. User Conduct:
               - Users must not engage in any unlawful or prohibited activities while using the App.
               - QuickSpot reserves the right to suspend or terminate user accounts for violations.

            7. Privacy Policy:
               - QuickSpot's Privacy Policy outlines how user data is collected, used, and protected.

            8. Termination of Services:
               - QuickSpot reserves the right to modify or terminate the App and its services at any time without notice.

            9. Disclaimer of Warranties:
               - QuickSpot provides the App on an "as is" basis, and users use the App at their own risk.

            10. Governing Law:
                - These terms and conditions are governed by the laws of [Your Jurisdiction].

            11. Contact Information:
                - For any questions or concerns regarding these terms and conditions, please contact [Your Contact Information].
            ''',
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
