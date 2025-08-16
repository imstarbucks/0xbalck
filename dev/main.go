package main

import (
	"fmt"
	"os"

	tea "github.com/charmbracelet/bubbletea"
)

var choices = []string{
	"npm-lsp-checker",
	"npm-lsp-checker2",
}

type menuModel struct {
	cursor int
	choice string
}

func (m menuModel) View() string {
	s := "Choose a tool:\n\n"
	for i, choice := range choices {
		cursor := "  "
		if m.cursor == i {
			cursor = "o"
		}
		s += fmt.Sprintf("%s %s\n", cursor, choice)
	}
	s += "\nUse ↑/↓ or j/k to navigate, Enter to select, q or ctr+c to quit."
	return s
}

func (m menuModel) Init() tea.Cmd { return nil }

func (m menuModel) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
	switch msg := msg.(type) {

	// Is it a key press?
	case tea.KeyMsg:

		// Cool, what was the actual key pressed?
		switch msg.String() {

		// These keys should exit the program.
		case "ctrl+c", "q":
			return m, tea.Quit

		// The "up" and "k" keys move the cursor up
		case "up", "k":
			if m.cursor > 0 {
				m.cursor--
			}

		// The "down" and "j" keys move the cursor down
		case "down", "j":
			if m.cursor < len(m.choice)-1 {
				m.cursor++
			}

		// The "enter" key and the spacebar (a literal space) toggle
		// the selected state for the item that the cursor is pointing at.
		case "enter":
			m.choice = choices[m.cursor]
			switch m.choice {
			case "npm-lsp-checker":
				fmt.Println("You have choosen npm-lsp-checker")
			}
		}
	}

	// Return the updated model to the Bubble Tea runtime for processing.
	// Note that we're not returning a command.
	return m, nil
}

func main() {
	if err := tea.NewProgram(menuModel{}).Start(); err != nil {
		fmt.Println("Error:", err)
		os.Exit(1)
	}
}
