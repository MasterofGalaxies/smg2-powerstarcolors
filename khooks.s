.section .kamek
_kHook0:
.long 0x2
.long 0x3
.int initMapToolInfo__9PowerStarFRC12JMapInfoIter + 0xCC
.long staractor

_kHook1:
.long 0x2
.long 0x3
.int FUN_802DF0C0 + 0x30
.long resultsequence

_kHook2:
.long 0x2
.long 0x4
.int appear__18ScenarioSelectStarFv + 0x40
.long starselect

_kHook3:
/* This branch occurs upon displaying the icon for a normal Power Star... */
.long 0x2
.long 0x4
.int FUN_80041D60 + 0xC8
.long staricon

_kHook4:
/* ...whereas this branch occurs upon displaying the icon for a Hidden Star. */
.long 0x2
.long 0x4
.int FUN_80041D60 + 0x1E0
.long staricon

_kHook5:
.long 0x2
.long 0x3
.int FUN_80041D60 + 0x1A4
.long cometstaricon


/*
 * PowerStar::initMapToolInfo() saves a number 0 - 4 representing
 * which texture to use, which is read by PowerStar::initModel().
 * PowerStar::initMapToolInfo() and PowerStar::initModel() use 4 to
 * represent a clear Power Star; however, this is the number of the
 * new blue texture, so we need to change the value that these
 * functions use to represent clear Stars.
 */
_kHook6:
.long 0x3
.long 0x1
.long 0x2
.int initMapToolInfo__9PowerStarFRC12JMapInfoIter + 0x110
li 0, 5

_kHook7:
.long 0x3
.long 0x1
.long 0x2
.int initModel__9PowerStarFv + 0x8C
subi 0, 4, 5

_kHook8:
.long 0x3
.long 0x1
.long 0x2
.int initModel__9PowerStarFv + 0x110
subi 0, 4, 5
