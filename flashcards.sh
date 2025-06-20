#!/bin/bash

FLASHCARDS_FILE="flashcards.txt"

# Initialize empty file with just comments
initialize_file() {
    if [ ! -f "$FLASHCARDS_FILE" ]; then
        echo "# Flashcard format: question|answer" > "$FLASHCARDS_FILE"
        echo "# Add your questions below, one per line" >> "$FLASHCARDS_FILE"
    fi
}

add_flashcard() {
    echo "Adding new flashcard (Ctrl+C to cancel)"
    read -p "Enter question: " question
    read -p "Enter answer: " answer
    echo "$question|$answer" >> "$FLASHCARDS_FILE"
    echo "Flashcard added successfully!"
    sleep 1
}

shuffle_flashcards() {
    # Load flashcards and shuffle (empty if none exist)
    grep -v "^#" "$FLASHCARDS_FILE" | shuf
}

review_flashcards() {
    clear
    echo "=== Flashcard Review ==="
    
    # Check if any flashcards exist (fixed this check)
    if ! grep -q -v "^#" "$FLASHCARDS_FILE"; then
        echo "No flashcards found! Add some first."
        sleep 2
        return
    fi
    
    echo "Press Enter to reveal answer and move to next card"
    echo "Press 'q' then Enter to quit"
    echo "======================="
    echo
    
    # Get shuffled flashcards
    mapfile -t cards < <(shuffle_flashcards)
    
    for card in "${cards[@]}"; do
        IFS="|" read -r question answer <<< "$card"
        
        # Show question
        echo "Q: $question"
        read -p "[Press Enter to reveal answer] " -r
        
        # Show answer
        echo "A: $answer"
        echo
        
        # Wait for next command
        read -p "[Press Enter to continue or 'q' to quit] " -r command
        
        if [[ "$command" == "q" ]]; then
            echo -e "\nEnding review session."
            break
        fi
        
        echo -e "\n-----------------------"
    done
    
    echo "Review complete!"
    sleep 1
}

# Main menu
main() {
    initialize_file
    
    while true; do
        clear
        echo "Flashcard System"
        echo "1. Review flashcards"
        echo "2. Add new flashcard"
        echo "3. View all flashcards"
        echo "4. Exit"
        read -p "Choose an option (1-4): " choice
        
        case $choice in
            1) review_flashcards ;;
            2) add_flashcard ;;
            3) 
                clear
                echo "=== All Flashcards ==="
                grep -v "^#" "$FLASHCARDS_FILE" | column -t -s "|" || echo "No flashcards found"
                echo
                read -p "Press Enter to return to menu..."
                ;;
            4) exit 0 ;;
            *) 
                echo "Invalid option"
                sleep 1 
                ;;
        esac
    done
}

main
