
func int Patch_BIT_TeachAttributePoints (var C_NPC slf, var C_NPC oth, var int attrib, var int points, var int teacherMAX)
{
	var string concatText;
	var int realAttr;
	var int attr;
	var int diff;

	if (Patch_BIT_Show_stats_when_training) {
		realAttr = Patch_BIT_GetRealAttribute (oth, attrib);
		attr = Patch_BIT_GetAttribute(oth, attrib);
		diff = realAttr - attr;
	};

	if (!Patch_BIT_trainer_max_on_effective) {
		// reduce the real value to the trained to pass the teacher max check
		Patch_BIT_ModAttribute (oth, attrib, diff);
	};

    var int res;
    PassArgumentN (slf);
    PassArgumentN (oth);
    PassArgumentI (attrib);
    PassArgumentI (points);
    PassArgumentI (teacherMAX);
    ContinueCall ();
    res = MEM_PopIntResult();

	if (!Patch_BIT_trainer_max_on_effective) {
		// restore the real value by adding the diff
		Patch_BIT_ModAttribute (oth, attrib, -diff);
	};

	if (res == FALSE) {
		return FALSE;
	};

    B_RaiseRealAttributeLearnCounter (oth, attrib, points);

	if (Patch_BIT_Show_stats_when_training) {
		concatText = ConcatStrings (Patch_BIT_AttributeToString(attrib), " trained:");
		concatText = ConcatStrings (concatText, IntToString (realAttr));
		concatText = ConcatStrings (concatText, "->");
		realAttr = Patch_BIT_GetRealAttribute (oth, attrib);
		concatText = ConcatStrings (concatText, IntToString (realAttr));
		concatText = ConcatStrings (concatText, " effective:");
		concatText = ConcatStrings (concatText, IntToString(attr));
		concatText = ConcatStrings (concatText, "->");
		attr = Patch_BIT_GetAttribute(oth, attrib);
		concatText = ConcatStrings (concatText, IntToString(attr));
		PrintScreen	(concatText, 5, 5, FONT_SCREEN, 5);
	};

    return res;
};
