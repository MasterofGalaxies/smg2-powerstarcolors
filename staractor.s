.section .text
staractor:
/*
 * Set the color of the Power Star object seen in normal
 * gameplay. This code gets run for every Star object
 * in a scene at the time of the scene being loaded.
 */

bl getCurrentStageName__2MRFv
lwz 4, 0x90 (30)
bl getstarcolor

cmpwi 3, -1
beq- originalcolor_staractor
stw 3, 0x130 (30)
lwz 30, 0x8 (1)
lwz 31, 0xC (1)
lwz 0, 0x14 (1)
mtlr 0
addi 1, 1, 0x10
blr

originalcolor_staractor:
/*
 * Fallback to the code that sets the Star's color to green
 * if its object name is "GreenStar" or gold otherwise.
 */
lbz 0, 0x135 (30)
b initMapToolInfo__9PowerStarFRC12JMapInfoIter + 0xD0
