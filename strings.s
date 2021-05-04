.section .rodata
/*
 * Kamek seems to have a bug where it throws an error about a
 * string's name being undefined when it is referenced in the
 * same translation unit where it is defined, so define all
 * the strings we need here in a dedicated file.
 */
powerstartype:
	.string "PowerStarType"
gold:
	.string "Gold"
bronze:
	.string "Bronze"
green:
	.string "Green"
red:
	.string "Red"
blue:
	.string "Blue"
