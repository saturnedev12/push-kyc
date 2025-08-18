class PhoneNumberUtils {
  static String formatPhoneNumber(String phoneNumber) {
    // Remove any existing spaces or special characters
    String cleaned = phoneNumber.replaceAll(RegExp(r'[\s\-\(\)]'), '');

    // If number starts with +225, add space after it
    if (cleaned.startsWith('+225')) {
      return '${cleaned.substring(0, 4)} ${cleaned.substring(4)}';
    }

    // If number doesn't have country code, add it with space
    if (!cleaned.startsWith('+')) {
      return '+225 $cleaned';
    }

    return cleaned;
  }
}
