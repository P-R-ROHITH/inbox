enum SpecialMessageType { appointmentConfirmed, consultationFinished, followUp }

class SpecialMessage {
  final SpecialMessageType type;
  final String doctorName;
  final String facility;
  final String date;
  final String? bookingId;
  final String? followUpDate;

  SpecialMessage({
    required this.type,
    required this.doctorName,
    required this.facility,
    required this.date,
    this.bookingId,
    this.followUpDate,
  });
}