.section .text
resultsequence:
/*
 * Set the color of the Star that appears briefly on Starship Mario after
 * getting that Star in a galaxy. This code gets run the player's first
 * time getting that Star; it does not run if the Star is clear.
 */

li 28, 0

/*
 * This is how the function that this file modifies
 * checked if the Cosmic Guide was used to get a Star.
 */
bl FUN_804D6B40

cmpwi 3, 0
beq- possiblybronze_resultsequence
li 29, 1
b notbronze_resultsequence

possiblybronze_resultsequence:
mr 3, 31
mr 4, 30
bl FUN_80024D10
cmpwi 3, 0
beq- notbronze_resultsequence

/* The Cosmic Guide was used to get this Star. */
li 28, 1
b FUN_802DF0C0 + 0x80


notbronze_resultsequence:
mr 3, 31
mr 4, 30
bl getstarcolor
cmpwi 3, -1
beq- done_resultsequence
mr 28, 3
done_resultsequence:
b FUN_802DF0C0 + 0x80
