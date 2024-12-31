---
date: 12/31/24
tags:
  - "#Meta"
links: 
deadline: 
status:
---
# Not Started
```dataview
table status, deadline
from "2) 2nd Brain/Reading" where status = 0 or status = null
sort deadline
```
# In Progress / Watched Video
```dataview
table status, deadline
from "2) 2nd Brain/Reading" where status != 0 and status != null and status != 1
sort deadline
```
# Remove
```dataview
table status, deadline
from "2) 2nd Brain/Reading" where status = 1
sort deadline
```
 