---
date: 12/21/24
tags:
  - "#Meta"
links: 
deadline: 2025-01-01
status: 1
---
# List
```dataview
table status, deadline
from #Goal
sort deadline
```

# Heatmap
```dataviewjs
dv.span("**Workout**")
const calendarData = {
intensityScaleStart: 1,
intensityScaleEnd: 10,
colors: {
red: ["#ff9e82","#ff7b55","#ff4d1a","#e73400","#bd2a00",]
},
entries: []
} 
for(let page of dv.pages('"2) 2nd Brain/Daily"').where(p=>p.Workout)){ calendarData.entries.push({
date: page.file.name,
intensity: page.Workout,
content: await dv.span(`[](${page.file.name})`),
//for hover preview
})}
renderHeatmapCalendar(this.container, calendarData)
```
