// check whether a task may wait for its period before starting to execute activities

// if this property is false for any task, then it is sufficient to say either R1 or R2 is violated


A[] not Man_scan_roblaser.error

A[] not Man_fuse_robmap.error

A[] not Man_plan_robmotion.error

A[] not Man_odo_robloco.error

A[] not Man_track_robloco.error


// if all the above is true, further analysis is required. Schedulability (must check first that locations ask and manage in each manager are reachable): 



A[] (not Man_scan_roblaser.start imply not tick_scan_roblaser)


A[] (not Man_fuse_robmap.start imply not tick_fuse_robmap)


A[] (not Man_track_robloco.start imply not tick_track_robloco)


A[] (not Man_odo_robloco.start imply not tick_odo_robloco)


A[] (not Man_plan_robmotion.start imply not tick_plan_robmotion)


// if schedulability is satisfied for track (R1) but not for some other task, we look for the bound of the total execution time (waiting + execution of activities): 


sup{Man_fuse_robmap.manage}: Man_fuse_robmap.x

sup{Man_scan_roblaser.manage}: Man_scan_roblaser.x

sup{Man_plan_robmotion.manage}: Man_plan_robmotion.x

sup{Man_odo_robloco.manage}: Man_odo_robloco.x




