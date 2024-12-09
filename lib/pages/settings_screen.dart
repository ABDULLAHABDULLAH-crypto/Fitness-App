import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Settings Screen
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    bool isArabic = _selectedLanguage == "Arabic";

    return Scaffold(
      backgroundColor: const Color(0xFF12192B), // Matches screen color
      appBar: AppBar(
        toolbarHeight: 0, // Hides the AppBar (no title)
        backgroundColor: const Color(0xFF12192B),
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xFF12192B), // Matches entire screen background
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildField(label: isArabic ? 'الاسم' : 'Name'),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: _buildField(
                          label: isArabic ? 'العمر' : 'Age',
                          maxLength: 3,
                          inputType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _buildField(label: isArabic ? 'فصيلة الدم' : 'Blood'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildField(label: isArabic ? 'الوزن' : 'Body Weight'),
                  const SizedBox(height: 20),
                  _buildField(
                    label: isArabic ? 'أيام التمارين' : 'Days For Exercises',
                    maxLength: 1,
                    inputType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    isArabic ? 'اللغة' : 'Language',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _buildLanguageButton('Arabic', isSelected: isArabic),
                      const SizedBox(width: 10),
                      _buildLanguageButton('English', isSelected: !isArabic),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _submitForm();
                      },
                      child: Text(isArabic ? 'إرسال' : 'Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required String label,
    int? maxLength,
    TextInputType inputType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: TextField(
              maxLength: maxLength,
              keyboardType: inputType,
              inputFormatters: inputFormatters,
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '', // Hides the counter text for maxLength
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageButton(String text, {required bool isSelected}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedLanguage = text;
          });
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    String message = _selectedLanguage == "Arabic"
        ? 'تم إرسال النموذج'
        : 'Form submitted!';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}