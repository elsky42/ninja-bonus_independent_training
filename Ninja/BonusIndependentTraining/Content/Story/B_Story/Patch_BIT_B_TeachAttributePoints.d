
func int Patch_BIT_TeachAttributePoints (var C_NPC slf, var C_NPC oth, var int attrib, var int points, var int teacherMAX)
{
	var string concatText;
	var int realAttr; realAttr = Patch_BIT_GetRealAttribute (oth, attrib);
	var int attr; attr = Patch_BIT_GetAttribute(oth, attrib);
	var int diff; diff = realAttr - attr;

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

	var int s; s = SB_New();
	SB(Patch_BIT_AttributeToString(attrib));
	SB(" trained:"); SBi(realAttr); SB("->"); SBi(Patch_BIT_GetRealAttribute (oth, attrib));
	SB(" effective:"); SBi(attr); SB("->"); SBi(Patch_BIT_GetAttribute(oth, attrib));
	var string ret; ret = SB_ToString();
	SB_Destroy();
	MEM_Info(ret);

	if (Patch_BIT_Show_stats_when_training) {
		PrintScreen	(ret, 5, 5, FONT_SCREEN, 5);
	};

    return res;
};
