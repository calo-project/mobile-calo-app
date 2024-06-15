part of 'widget.dart';

class RecommendationCard extends StatelessWidget {
  final String imageUrl;
  final String eventName;
  final String eventLocation;
  final String eventDate;

  const RecommendationCard({
    super.key,
    required this.imageUrl,
    required this.eventName,
    required this.eventLocation,
    required this.eventDate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                eventName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                eventLocation,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
              Text(
                eventDate,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
