var/datum/controller/subsystem/acid/SSacid

/datum/controller/subsystem/acid
	name = "Acid"
	priority = 40
	flags = SS_NO_INIT|SS_BACKGROUND

	var/list/currentrun = list()
	var/list/processing = list()

/datum/controller/subsystem/acid/New()
	NEW_SS_GLOBAL(SSacid)


/datum/controller/subsystem/acid/stat_entry()
	..("P:[processing.len]")


/datum/controller/subsystem/acid/fire(resumed = 0)
	if (!resumed)
		src.currentrun = processing.Copy()

	//cache for sanic speed (lists are references anyways)
	var/list/currentrun = src.currentrun

	while (currentrun.len)
		var/obj/O = currentrun[currentrun.len]
		currentrun.len--
		if (!O || QDELETED(O))
			processing -= O
			if (MC_TICK_CHECK)
				return
			continue

		if(O.acid_level && O.acid_processing())
		else
			O.cut_overlay(acid_overlay, TRUE)
			processing -= O

		if (MC_TICK_CHECK)
			return
