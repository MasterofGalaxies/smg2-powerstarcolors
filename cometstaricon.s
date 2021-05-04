.section .text
cometstaricon:
/*
 * Set the color of the Comet Power Star icons displayed
 * on the World Map and in menus. This code gets run for
 * every Comet Star being displayed that has been reached
 * without the Cosmic Guide.
 */

mr 3, 27
mr 4, 31
bl getstarcolor

/* Bronze */
li 4, 0x7D
cmpwi 3, 1
beq- done_cometstaricon

/* Green */
li 4, 0x4F
cmpwi 3, 2
beq- done_cometstaricon

/* Red */
li 4, 0x80
cmpwi 3, 3
beq- done_cometstaricon

/* Blue */
li 4, 0x81
cmpwi 3, 4
beq- done_cometstaricon

/* Gold */
li 4, 0x65

done_cometstaricon:
mr 3, 30
b FUN_80041D60 + 0x1AC
