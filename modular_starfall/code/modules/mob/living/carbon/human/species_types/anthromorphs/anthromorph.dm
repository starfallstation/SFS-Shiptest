/datum/species/anthromorph
	name = "\improper Anthromorph"
	id = SPECIES_ANTHROMORPH
	default_color = "FFFFFF"
	species_traits = list(MUTCOLORS,MUTCOLORS_SECONDARY,HAIR,FACEHAIR,LIPS,SCLERA,EMOTE_OVERLAY,HAS_FLESH,HAS_BONE)
	default_features = list("mcolor" = "FFF", "tail_human" = "None", "ears" = "None", "wings" = "None", "horns" = "None", "body_markings" = "None", "face_markings" = "None")
	mutant_bodyparts = list("ears", "tail_human","horns","body_markings","face_markings")
	use_skintones = FALSE
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = GROSS | RAW | CLOTH
	liked_food = JUNKFOOD | FRIED | SUGAR
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP
	loreblurb = "Various genetically modified humans, Anthromorphs are the result of a bodymodding fad gone to it's extremes. Resembling multitudes of species, both real and imagined, Anthromorphs are humans who were, for one reason or another, unsatisfied with their existence as baseline humans."
	species_language_holder = /datum/language_holder/human

	species_robotic_limbs = list(
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/robot/human,
		BODY_ZONE_HEAD = /obj/item/bodypart/head/robot/human,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/robot/surplus/human,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/robot/surplus/human,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/robot/surplus/human,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/robot/surplus/human,
	)

	robotic_eyes = /obj/item/organ/eyes/robotic

/datum/species/anthromorph/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load)
	switch(C.dna.features["ears"])
		if("Elf")
			mutantears = /obj/item/organ/ears/elf
		if("Cat")
			mutantears = /obj/item/organ/ears/cat
		if("Dog")
			mutantears = /obj/item/organ/ears/dog
		if("Fox")
			mutantears = /obj/item/organ/ears/fox
		if("Rabbit")
			mutantears = /obj/item/organ/ears/rabbit
		if("Bent Rabbit")
			mutantears = /obj/item/organ/ears/rabbit/bent
		if("Floppy Rabbit")
			mutantears = /obj/item/organ/ears/rabbit/floppy
		if("Horse")
			mutantears = /obj/item/organ/ears/horse
	switch(C.dna.features["tail_human"])
		if("Cat")
			mutant_organs |= /obj/item/organ/tail/cat
		if("Dog")
			mutant_organs |= /obj/item/organ/tail/dog
		if("Fox")
			mutant_organs |= /obj/item/organ/tail/fox
		if("Fox 2")
			mutant_organs |= /obj/item/organ/tail/fox/alt
		if("Rabbit")
			mutant_organs |= /obj/item/organ/tail/rabbit
		if("Horse")
			mutant_organs |= /obj/item/organ/tail/horse

	return ..()

/datum/species/anthromorph/spec_death(gibbed, mob/living/carbon/human/H)
	if(H)
		stop_wagging_tail(H)

/datum/species/anthromorph/spec_stun(mob/living/carbon/human/H,amount)
	if(H)
		stop_wagging_tail(H)
	. = ..()
