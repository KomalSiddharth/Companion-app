class Mood {
  final String label;
  final String emoji;
  final String description;

  const Mood({
    required this.label,
    required this.emoji,
    required this.description,
  });
}

const List<Mood> moods = [
  Mood(label: 'Happy', emoji: '😊', description: 'Feeling joyful and positive'),
  Mood(label: 'Calm', emoji: '😌', description: 'Feeling peaceful and relaxed'),
  Mood(label: 'Down', emoji: '😔', description: 'Feeling a bit low or sad'),
  Mood(
    label: 'Energetic',
    emoji: '😤',
    description: 'Ready to take on the world',
  ),
  Mood(
    label: 'Curious',
    emoji: '🤔',
    description: 'Wanting to explore and learn',
  ),
  Mood(
    label: 'Anxious',
    emoji: '😰',
    description: 'Feeling a bit uneasy or nervous',
  ),
];
