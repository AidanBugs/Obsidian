---
date: 12/19/24
tags:
  - "#Meta"
links: 
deadline:
---
# Not Started
```dataview
table status, deadline
from #HW where status = 0 or status = null
sort deadline
```
# In Progress
```dataview
table status, deadline
from #HW where status != 0 and status != null and status != 1
sort deadline
```
# Completed
```dataview
table status, deadline
from #HW where status = 1
sort deadline desc
```