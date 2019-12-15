// UEP

A[] not (Man_scan_roblaser.error or Man_fuse_robmap.error or Man_plan_robmotion.error or Man_odo_robloco.error or Man_track_robloco.error)


// SP (requirement R1)


A[] (not Man_track_robloco.start imply not tick_track_robloco)



// MRT (requirement R2) 


sup{Man_fuse_robmap.manage}: Man_fuse_robmap.x

sup{Man_scan_roblaser.manage}: Man_scan_roblaser.x

sup{Man_plan_robmotion.manage}: Man_plan_robmotion.x

sup{Man_odo_robloco.manage}: Man_odo_robloco.x

// leadsto and liveness: make sure to comment the priority before verification

// leadsto

CT_robloco.receive and cl.start --> CT_robloco.finish

// Liveness (example)

A<> TrackSpeedStart_1_robloco.start_
