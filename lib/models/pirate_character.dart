/// Characters in the Pirate Financial Trail game
class PirateCharacter {
  final String name;
  final String role;
  final List<String> dialogues;
  final String imageAsset;

  const PirateCharacter({
    required this.name,
    required this.role,
    required this.dialogues,
    this.imageAsset = '',
  });
}

/// Captain character (the main guide)
const captain = PirateCharacter(
  name: 'Captain Morgan',
  role: 'Financial Navigator',
  dialogues: [
    "Ahoy there, matey! I be Captain Morgan, and I'll guide ye on this financial voyage!",
    "Thar be treasure ahead if ye follow the path of wise investing!",
    "Avast! Don't be puttin' all yer doubloons in one chest. Diversify yer investments!",
    "A good sailor plans for storms! Build yer emergency fund, ye scallywag!",
    "Debt be like a leaky ship - patch it quick before ye sink!",
    "Compound interest be the wind in yer sails! Start early and sail far!",
    "Shiver me timbers! Have ye checked yer credit score lately?",
    "Navigatin' taxes be tricky waters. Use them tax-advantaged accounts!",
    "Even pirates need to save for retirement! Start yer 401(k) early!",
  ],
);

/// Parrot character (sidekick and comic relief)
const hank = PirateCharacter(
  name: 'Hank',
  role: 'Financial Advisor Parrot',
  dialogues: [
    "SQUAWK! Save more! SQUAWK!",
    "Polly wants a pension plan! SQUAWK!",
    "Budget! Budget! SQUAWK!",
    "Low-cost index funds! SQUAWK!",
    "Emergency fund! Six months! SQUAWK!",
    "SQUAWK! Debt snowball method! SQUAWK!",
    "Tax-advantaged! SQUAWK! Accounts!",
    "SQUAWK! Dollar-cost averaging!",
    "Pay yourself first! SQUAWK!",
    "SQUAWK! Diversify! Diversify!",
  ],
);

/// Returns a random dialogue from the character's list
String getRandomDialogue(PirateCharacter character) {
  if (character.dialogues.isEmpty) {
    return "...";
  }
  
  final randomIndex = DateTime.now().millisecondsSinceEpoch % character.dialogues.length;
  return character.dialogues[randomIndex];
}