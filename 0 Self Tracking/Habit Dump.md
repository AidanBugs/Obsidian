---
date: 01/01/25
tags:
  - "#Meta"
links: 
deadline: 
status:
---
# Habit Tracker
```dataviewjs
let calendarData = {
	year: 2025,
	intensityScaleStart: 0,
	intensityScaleEnd: 1,
	showCurrentDayBorder: false,
	defaultEntryIntensity: 0,
	entries: [],
	colors: {
		blue: ["#46919e","#4da1b0","#5eabb8","#70b4c0","#82bdc8","#93c7d0","#a5d0d7"].reverse(),
		orange: ["#bc3c43","#c64c53","#cc6065","#d27378","#d88688","#de9a9d","#e5adb0"].reverse(),
		purple: ["#6a3fa1","#7746b3","#8456bd","#9168c4","#9e7acb","#ac8dd2","#b99fd9"].reverse(),
		transparent: ["#e8d7ba"]
	}
} 
let workoutEntries = []
let waterEntries = []
let stretchingEntries = []
let journalEntries = []
for(let page of dv.pages('"2) 2nd Brain/Daily"')){
	let path = page.file.path.split("/");
	let year = path[2]
	let month = path[3].split(")")[0]
	let day = path[4].split(" ")[0]
	let beautifuldate = ""+year+"-"+month+"-"+day;
	if (page.Workout != null && page.Workout != 0) {
	workoutEntries.push({
		date: beautifuldate,
		intensity: page.Workout,
		color: "orange"
	})}
	if (page.Water != null && page.Water != 0) {
	waterEntries.push({
		date: beautifuldate,
		intensity: page.Water,
		color: "blue"
	})}
	if (page.Stretch != null  && page.Stretch != 0) {
	stretchingEntries.push({
		date: beautifuldate,
		intensity: page.Stretch,
		color: "purple"
	})}
	if (page.Write != null  && page.Write != 0) {
	journalEntries.push({
		date: beautifuldate,
		intensity: page.Write,
		content: await dv.span(`[](<${page.file.name}>)`),
		color: "transparent"
	})}
	let num = calendarData.entries.length;
}
let today = new Date();
let year = today.getFullYear();
let start = 2025
for (let i = 0; i <= year-start; i++){
	calendarData.year = start+i
	dv.span("## "+calendarData.year)
	calendarData.entries = workoutEntries
	dv.span("**Workout**").style.color = "#d27378"
	renderHeatmapCalendar(this.container, calendarData)
	calendarData.entries = waterEntries
	dv.span("**Water**").style.color = "#d27378"
	renderHeatmapCalendar(this.container, calendarData)
	calendarData.entries = stretchingEntries
	dv.span("**Stretching**").style.color = "#d27378"
	renderHeatmapCalendar(this.container, calendarData)
	calendarData.entries = journalEntries
	dv.span("**Journal**").style.color = "#d27378"
	renderHeatmapCalendar(this.container, calendarData)
}
```
