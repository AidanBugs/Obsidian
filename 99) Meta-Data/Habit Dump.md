---
date: 01/01/25
tags:
  - "#Meta"
links: 
deadline: 
status:
---
# Habits 2024
```dataviewjs
dv.span("**Workout**").style.color = "#d27378"
let calendarData = {
	year: 2024,
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
for(let page of dv.pages('"2) 2nd Brain/Daily"').where(p=>p.Workout)){
	let mydate = new Date(page.file.cday);
	let beautifuldate = mydate.toISOString().split('T')[0]
	calendarData.entries.push({
		date: beautifuldate,
		intensity: page.Workout,
		color: "orange"
	})
	let num = calendarData.entries.length;
}
renderHeatmapCalendar(this.container, calendarData)
calendarData.entries = []
dv.span("**Water**").style.color = "#70b4c0"
for(let page of dv.pages('"2) 2nd Brain/Daily"').where(p=>p.Water)){ 
	let mydate = new Date(page.file.cday);
	let beautifuldate = mydate.toISOString().split('T')[0]
	calendarData.entries.push({
		date: beautifuldate,
		intensity: page.Water,
		color: "blue"
	})
	let num = calendarData.entries.length;
}
renderHeatmapCalendar(this.container, calendarData)
calendarData.entries = []
dv.span("**Stretching**").style.color = "#9168c4"
for(let page of dv.pages('"2) 2nd Brain/Daily"').where(p=>p.Stretch)){ 
	let mydate = new Date(page.file.cday);
	let beautifuldate = mydate.toISOString().split('T')[0]
	calendarData.entries.push({
		date: beautifuldate,
		intensity: page.Stretch,
		color: "purple"
	})
	let num = calendarData.entries.length;
}
renderHeatmapCalendar(this.container, calendarData)
```
# Habits 2025
```dataviewjs
dv.span("**Workout**").style.color = "#d27378"
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
for(let page of dv.pages('"2) 2nd Brain/Daily"').where(p=>p.Workout)){
	let mydate = new Date(page.file.cday);
	let beautifuldate = mydate.toISOString().split('T')[0]
	calendarData.entries.push({
		date: beautifuldate,
		intensity: page.Workout,
		color: "orange"
	})
	let num = calendarData.entries.length;
}
renderHeatmapCalendar(this.container, calendarData)
calendarData.entries = []
dv.span("**Water**").style.color = "#70b4c0"
for(let page of dv.pages('"2) 2nd Brain/Daily"').where(p=>p.Water)){ 
	let mydate = new Date(page.file.cday);
	let beautifuldate = mydate.toISOString().split('T')[0]
	calendarData.entries.push({
		date: beautifuldate,
		intensity: page.Water,
		color: "blue"
	})
	let num = calendarData.entries.length;
}
renderHeatmapCalendar(this.container, calendarData)
calendarData.entries = []
dv.span("**Stretching**").style.color = "#9168c4"
for(let page of dv.pages('"2) 2nd Brain/Daily"').where(p=>p.Stretch)){ 
	let mydate = new Date(page.file.cday);
	let beautifuldate = mydate.toISOString().split('T')[0]
	calendarData.entries.push({
		date: beautifuldate,
		intensity: page.Stretch,
		color: "purple"
	})
	let num = calendarData.entries.length;
}
renderHeatmapCalendar(this.container, calendarData)
calendarData.entries = []
dv.span("**Journal**")
for(let page of dv.pages('"2) 2nd Brain/Daily"').where(p=>p.Write)){ 
	let mydate = new Date(page.file.cday);
	let beautifuldate = mydate.toISOString().split('T')[0]
	calendarData.entries.push({
		date: beautifuldate,
		intensity: page.Write,
		content: await dv.span(`[](<${page.file.name}>)`),
		color: "transparent"
	})
	let num = calendarData.entries.length;
}
renderHeatmapCalendar(this.container, calendarData)
```