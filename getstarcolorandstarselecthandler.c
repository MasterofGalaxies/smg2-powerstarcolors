#include <stddef.h>
#include <string.h>

extern char *getCurrentStageName__2MRFv(void);
extern void *makeGalaxyStatusAccessor__2MRFPCc(const char *galaxyname);

// Reads a galaxy's ScenarioData.bcsv
extern void FUN_804CBB60(void *galaxystatusaccessor, const char *column,
                         int starnumber, char **valueptr);

/*
 * Checks if the Cosmic Guide was used to get a Star.
 * Of the multiple functions that are used for this purpose,
 * this is the one originally used by the Star Select code.
 */
extern int FUN_80024AE0(int starnumber);

/*
 * Kamek seems to have a bug where it throws an error about a
 * string's name being undefined when it is referenced in the
 * same translation unit where it is defined, so we have to
 * define these in another file (for which I used strings.s).
 */
extern const char powerstartype[];
extern const char gold[];
extern const char bronze[];
extern const char green[];
extern const char red[];
extern const char blue[];

int getstarcolor(char *galaxyname, int starnumber);

int starselect(int starnumber) {
	/*
	 * Set the color of the Stars that appear on the Star
	 * Select screen. This function gets run for every
	 * Star on the Star Select screen that isn't clear.
	 */

	if (FUN_80024AE0(starnumber))
		return 1;

	int starcolor = getstarcolor(getCurrentStageName__2MRFv(), starnumber);

	return starcolor == -1 ? 0 : starcolor;
}

int getstarcolor(char *galaxyname, int starnumber) {
	char *powerstartypevalue = NULL;

	FUN_804CBB60(makeGalaxyStatusAccessor__2MRFPCc(galaxyname),
	             powerstartype, starnumber, &powerstartypevalue);

	if (powerstartypevalue == NULL)
		return -1;

	if (strcmp(powerstartypevalue, gold) == 0)
		return 0;
	if (strcmp(powerstartypevalue, bronze) == 0)
		return 1;
	if (strcmp(powerstartypevalue, green) == 0)
		return 2;
	if (strcmp(powerstartypevalue, red) == 0)
		return 3;
	if (strcmp(powerstartypevalue, blue) == 0)
		return 4;

	return -1;
}
