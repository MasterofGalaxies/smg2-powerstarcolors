# An extension to the code of Super Mario Galaxy 2 providing for custom Power Star colors

This is what the custom Power Star color functionality in the [Super Mario Galaxy 2 *Project Template*](https://github.com/SunakazeKun/SMG2-Project-Template) is based on.

## Building

If you have not done so already, install a bare metal PowerPC toolchain, make, and [Kamek](https://github.com/Treeki/Kamek). Once these dependencies are satisfied, run `make`. This will create the file starcolorpatch.xml containing a memory patch in the form of a Riivolution XML.

## Usage

Change the value at the intersection of the `PowerStarType` column and the row of the desired Power Star in the ScenarioData.bcsv file in the ScenarioData.arc archive of the desired galaxy to one of the following:

* Gold
* Bronze
* Green
* Red
* Blue

The significance of setting a Star's type to 'Gold' is that this takes precedence over the Star's object name being 'GreenStar', allowing the sound effect otherwise only present in green Power Stars to exist in gold Power Stars as well.

The file in the Fonts directory corresponding to the language that the game will be utilizing needs to be available to the game at /LocalizeData/*Language*/LayoutData/Font.arc; otherwise, the game will use the font icon of the Nunchuk's joystick as the font icon of all red and blue Power Stars.

Additionally, the file PowerStar.arc in this repository needs to be available to the game at /ObjectData/PowerStar.arc; otherwise, Power Stars \(except their font icons\) will appear gold where they should appear blue.

## Credits

Credit to Zyphro for porting the blue Power Star texture from Super Mario Galaxy 1 to Super Mario Galaxy 2, and credit to Evanbowl for adding the red and blue Power Star font icons.

## License

With the exception of PowerStar.arc and the files in the Fonts directory, I dedicate the contents of this repository to the public domain via Creative Commons CC0 1.0 Universal \(a copy of which can be found in LICENSE.txt\).
