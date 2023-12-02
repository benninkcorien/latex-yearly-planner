package icaldata

import (
	"bufio"
	"fmt"
	"os"
	"strings"
	"time"
)

type Event struct {
	Date    string
	Summary string
}

func readICSFile(filePath string) (map[string]string, error) {
	file, err := os.Open("verjaardagen.ics") 
	if err != nil {
		fmt.Println("Error opening file:", err)
		return nil, err
	}
	defer file.Close()

	var allEvents []Event
	scanner := bufio.NewScanner(file)
	var dateStr, summary string

	// Read the file line by line
	for scanner.Scan() {
		line := scanner.Text()

		if strings.HasPrefix(line, "DTSTART") {
			dateStr = strings.Split(line, ":")[1]
		} else if strings.HasPrefix(line, "SUMMARY") {
			summary = strings.Split(line, ":")[1]

			// Parse and format the date
			parsedDate, err := time.Parse("20060102T150405", dateStr)
			if err != nil {
				
				parsedDate, err = time.Parse("20060102", dateStr)
				if err != nil {
					fmt.Println("Error parsing date:", err)
					continue
				}
			}
			formattedDate := parsedDate.Format("01-02")
			// Add event to the slice
			allEvents = append(allEvents, Event{Date:formattedDate, Summary: summary})
		}
	}

	

	EventMap := make(map[string]string)
	for _, event := range allEvents { 
		EventMap[event.Date] = event.Summary
	}

	fmt.Println("EventMap:", EventMap)

	return EventMap, nil
}

func main() {
	// Specify the path to your ICS file
	filePath := "verjaardagen.ics"

	// Call the readICSFile function with the file path
	eventMap, err := readICSFile(filePath)
	if err != nil {
		fmt.Println("Error:", err)
		return
	}

	// Print the event map
	fmt.Println("EventMap:", eventMap)
}