![Logo](MolniyaLogo.png)

# Molniya

A simple bash script for creating and reviewing flashcards in your terminal.

## Features

- **Simple Interface**: Easy-to-use menu system
- **Custom Flashcards**: Add your own questions and answers
- **Randomized Review**: Cards shuffle automatically for better learning
- **Persistent Storage**: Flashcards save to a text file between sessions
- **Lightweight**: No dependencies beyond standard bash utilities

## Installation

1. Copy the script to a file named `molniya.sh`
2. Make it executable:
   ```bash
   chmod +x molniya.sh
   ```

## Usage

Run the script:
```bash
./molniya.sh
```

### Menu Options

1. **Review flashcards**: Study your cards in random order
   - Press Enter to reveal answer
   - Press Enter again to continue to next card
   - Press 'q' then Enter to quit early

2. **Add new flashcard**: Create new study cards
   - Enter your question and answer when prompted

3. **View all flashcards**: See all your cards in order
   - Displays in a clean table format

4. **Exit**: Quit the program

## File Format

Flashcards are stored in `flashcards.txt` with this simple format:
```
question|answer
another question|another answer
```

Lines starting with `#` are treated as comments.

## Customization

You can:
- Edit `flashcards.txt` directly to add/remove cards
- Modify the script to change behavior (like review order)
- Add more features by editing the bash script

## Requirements

- Bash shell (Linux/macOS/WSL)
- Standard GNU core utilities (shuf, grep, etc.)

## Troubleshooting

If you get "No flashcards found":
- Make sure you've added cards first
- Check that `flashcards.txt` exists and contains properly formatted entries
