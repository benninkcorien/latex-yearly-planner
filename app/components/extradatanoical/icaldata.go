package icaldata

type IcalData string

import (
    "fmt"
    "io/ioutil"
    "strings"
    "text/template"
    "time"

    "github.com/rickb777/date/ical"
)


func main() {
    // Load and parse your iCal file
    iCalContent, err := ioutil.ReadFile("latex-yearly-planner/app/components/icaldata/verjaardagen.ics.ics")
    if err != nil {
        fmt.Println("Error reading iCal file:", err)
        return
    }

    cal, err := ical.ParseCalendar(strings.NewReader(string(iCalContent)))
    if err != nil {
        fmt.Println("Error parsing iCal:", err)
        return
    }

    // Find today's date
    today := time.Now().Truncate(24 * time.Hour)

    // Filter events for today
    var todayEvents []string

    for _, event := range cal.Events {
        if event.StartTime.Truncate(24*time.Hour).Equal(today) {
            todayEvents = append(todayEvents, event.Summary)
        }
    }

    // Prepare data for the template
    data := struct {
        Today       time.Time
        TodayEvents []string
    }{
        Today:       today,
        TodayEvents: todayEvents,
    }

    // Load and parse your Go template
    templateContent, err := ioutil.ReadFile("your_template.tmpl")
    if err != nil {
        fmt.Println("Error reading template file:", err)
        return
    }

    latexTemplate := template.Must(template.New("template").Parse(string(templateContent)))

    // Execute the template with the data
    err = latexTemplate.Execute(os.Stdout, data)
    if err != nil {
        fmt.Println("Error executing template:", err)
        return
    }
}