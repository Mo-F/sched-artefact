----------------------------
1- Repository Contents 
----------------------------

- The GenoM3 specification of the functional components of a variation of the RobNav terrestrial navigation developed at LAAS. There are 4  subfolders, each containing a .gen specification for a component. Some services are commented because they are not used in this application.

- The all.gen file #includes all the .gen specification files.

- The UPPAAL (.xta) specifications. The body of the "client" process is adapted manually according to the application. 

	- robnav-artefact-edf: the basic file, automatically generated from the GenoM3 counterpart, as extended with an EDF, using the search technique, over four cores.
	- robnav-artefact-edf-suspension: robnav-artefact-edf optimized with suspension delays in task "plan".

	- robnav-artefact-edf-classic: the counting-based UPPAAL model equivalent to robnav-artefact-edf.

- The UPPAAL (.ugi) graphical files.

- The query file (.q) for verifying the properties of interest.

- The .csv file with the results of varying "sd" in robnav-artefact-edf-suspension. 


----------------------------
2- Requirements
----------------------------

- The .xta files can be used directly to verify the properties and evaluate schedulability (see below)

- Otherwise, in order to reproduce the transformation chain (generate the .xta automatically), it is required to have installed:

	- GenoM3: clone from git://redmine.laas.fr/laas/users/felix/genom3-fiacre/genom3-wcet.git

	- GenoM3->UPPAAL template (extended with schedulers): clone from git://redmine.laas.fr/laas/users/mfoughal/uppaal_schedulers.git

	- UPPAAL 4.1.23: available on www.uppaal.org -> downloads

- This artefact has been tested with UPPAAL 4.1.23 on Mac OS High Sierra. If you encounter any issue with any other UPPAAL or OS version, please report the bug to UPPAAL developers at bug-uppaal@list.it.uu.se
 
----------------------------
3- How to
----------------------------
a- modeling

- Use directly the .xta files provided (in which the graphics have been enhanced for your conveniece). You can thus skipe to step (b).

- Otherwise, if you would like to (re)generate the UPPAAL models from the GenoM3 specifications:

	- First, install GenoM3 and the UPPAAL template extended with schedulers using the git links above:

		- Clone the git repository.
		- Enter the following commands:
			$ cd genom3-wcet (respect. cd uppaal_schedulers)
			$ autoreconf -vif
			$ mkdir build && cd build
			$ ../configure --prefix=/YOUR_INSTALLATION_PATH
			$ make install
		- Go to the repository where you cloned the case study and run: genom3 uppaal/model -sched=xy all.gen where you replace:
			- x with the type of scheduler: 1 for HRRN and 2 for cooperative EDF
			- y with the number of cores on the platform (a natural between 0 and 9) 
		- The .xta file will be generated in the model/ repository.
	- Adapt the "client" behavior according to your needs. Use the client behavior provided in robnav-artefact-edf.xta (process client) for reproducing the same experiment.

b- Verification. 

        - Load the .xta and .q files using UPPAAL 4.1.23 and you are all set :)

	- For the basic model robnav-artefact-edf: you may modify the value of "nc" and verify "SP" (requirement "R1"). It holds as soon as nc=4. You may then verify "UEP". You may also  compute the Maximum Response Time MRT for each task (requirement MRT). For "R3" and "R4" (liveness and leadsto), make sure you comment the priority in the .xta first (line 26 "chan priority default < up < insert;").

	- For the suspension-based model robnav-artefact-edf-suspension: the number of cores is already equal to 4. You may vary "sd" by changing the invariant on location "delay" and the guard on its outgoing edge in the manager of task plan (process Manager_plan_robmotion). The effect on the MRTs is given in the file res.csv.

	- For the classical model robnav-artefact-edf-classic: you may verify the properties and compare the verification cost to that with robnav-artefact-edf. The UPPAAL verifier shows the verification time and memory consumption on the go, and reports it at the end of verifying each property. If you want to verify the MRTs, change the "x" in the formula to "y" (for example sup{Man_fuse_robmap.manage}: Man_fuse_robmap.y). This is because, in the classical model, clock "x" is reset at each time unit to count the waiting time and can thus not be used to track the MRT, so a clock "y" is introduced to do that that.
    

	- The .q file is sufficiently commented to guide you through the verification process (the comments will not show in UPPAAL, so you may simply open it using any text editor if you want to read the comments).  

---------------------------- 
4- Contact
----------------------------

Please do not hesitate to drop me a line at mohammed.foughali@univ-grenoble-alpes.fr for any questions, inquiries or suggestions.
