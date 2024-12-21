---
date: 12/19/24
tags:
  - "#Meta"
links: 
deadline: 
status: 1
---

# Not Started
```dataview
table status, deadline
from #TODO where status = 0 or status = null
sort deadline
```

# In Progress
```dataview
table status, deadline
from #TODO where status != 0 and status != null and status != 1
sort deadline
```

# Remove
```dataview
table status, deadline
from #TODO where status = 1
sort deadline
```

