	object_const_def ; object_event constants
	const PALLETTOWN_OAK	
	const PALLETTOWN_TEACHER
	const PALLETTOWN_FISHER

PalletTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_PALLETTOWN_NOTHING
	scene_script .DummyScene1 ; SCENE_PALLETTOWN_OAKSTOPSYOU	

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	
.DummyScene0:
	end

.DummyScene1:
	end	

.FlyPoint:
	setflag ENGINE_FLYPOINT_PALLET
	return

PalletTownOakScene1:
	opentext
	writetext PalletTownOakText1
	waitbutton
	closetext
    turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	appear PALLETTOWN_OAK
	applymovement PALLETTOWN_OAK, PalletTownOakApproachMovement1
	end

PalletTownOakScene2:
    turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext PalletTownOakText1
	waitbutton
	closetext
	appear PALLETTOWN_OAK
	end	

PalletTownTeacherScript:
    disappear PALLETTOWN_OAK
	setscene SCENE_PALLETTOWN_OAKSTOPSYOU
	jumptextfaceplayer PalletTownTeacherText

PalletTownFisherScript:
	jumptextfaceplayer PalletTownFisherText

PalletTownSign:
	jumptext PalletTownSignText

RedsHouseSign:
	jumptext RedsHouseSignText

OaksLabSign:
	jumptext OaksLabSignText

BluesHouseSign:
	jumptext BluesHouseSignText
	
PalletTownOakApproachMovement1:
    slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

PalletTownTeacherText:
	text "I'm raising #-"
	line "MON too."

	para "They serve as my"
	line "private guards."
	done

PalletTownFisherText:
	text "Technology is"
	line "incredible!"

	para "You can now store"
	line "and recall items"
	cont "and #MON"
	cont "as data via PC."
	done

PalletTownSignText:
	text "PALLET TOWN"

	para "Sbades of your"
	line "journey await!"
	done

RedsHouseSignText:
	text "<PLAYER>'S HOUSE"
	done

OaksLabSignText:
	text "OAK #MON"
	line "RESEARCH LAB"
	done

BluesHouseSignText:
	text "<RIVAL>'S HOUSE"
	done
	
PalletTownOakText1:
    text "OAK: Hey! Wait!"
    line "Don't go out!"
	done

PalletTown_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  5, REDS_HOUSE_1F, 1
	warp_event 13,  5, BLUES_HOUSE, 1
	warp_event 12, 11, OAKS_LAB, 1

	db 2 ; coord events
	coord_event 10,  1, SCENE_PALLETTOWN_OAKSTOPSYOU, PalletTownOakScene1
	coord_event 11,  1, SCENE_PALLETTOWN_OAKSTOPSYOU, PalletTownOakScene2
	
	db 4 ; bg events
	bg_event  7,  9, BGEVENT_READ, PalletTownSign
	bg_event  3,  5, BGEVENT_READ, RedsHouseSign
	bg_event 13, 13, BGEVENT_READ, OaksLabSign
	bg_event 11,  5, BGEVENT_READ, BluesHouseSign

	db 3 ; object events
	object_event  9,  5, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_OAK_PALLET_TOWN	
	object_event  3,  8, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalletTownTeacherScript, -1
	object_event 11, 14, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PalletTownFisherScript, -1
	