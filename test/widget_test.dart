import 'package:flutter_test/flutter_test.dart';
import 'package:interncircle_profile_card/main.dart';

void main() {
  testWidgets('profile screen shows profile and project details', (tester) async {
    await tester.pumpWidget(const ProfileCardApp());

    expect(find.text('MM'), findsOneWidget);
    expect(find.text('Mugunthan M.'), findsOneWidget);
    expect(find.text('Rajalakshmi Institute of Technology'), findsOneWidget);
    expect(find.text('Web Development Intern'), findsOneWidget);
    expect(find.text('Achieved 2 prizes'), findsOneWidget);
    expect(find.text('Java'), findsOneWidget);
    expect(find.text('Cybersecurity'), findsOneWidget);
  });
}
