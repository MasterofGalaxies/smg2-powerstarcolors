.section .text
staricon:
/*
 * Set the color of the Power Star icons displayed on the
 * World Map and in menus. This code gets run for every
 * non-Comet Star being displayed that has been reached
 * without the Cosmic Guide.
 */

stwu 1, -0x8 (1)
mflr 0
stw 0, 0xC (1)

mr 3, 27
mr 4, 31
bl getstarcolor

/* Bronze */
li 4, 0x72
cmpwi 3, 1
beq- done_staricon

/* Green */
li 4, 0x4F
cmpwi 3, 2
beq- done_staricon

/* Red */
li 4, 0x7E
cmpwi 3, 3
beq- done_staricon

/* Blue */
li 4, 0x7F
cmpwi 3, 4
beq- done_staricon

/* Gold */
li 4, 0x37

done_staricon:
lwz 3, 0xC (1)
addi 3, 3, 0x8
mtlr 3
addi 1, 1, 0x8
mr 3, 30
b addPictureFontCode__2MRFPwi
