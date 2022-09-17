
func int Patch_BIT_TeachFightTalentPercent (var C_NPC slf, var C_NPC oth, var int talent, var int percent, var int teacherMAX)
{
	var string concatText;
	var int realTalent; realTalent = Patch_BIT_GetRealFightTalentPercent (oth, talent);
	var int fightSkill;
	var int diff;

	if (Patch_BIT_Show_stats_when_training) {
		fightSkill = Patch_BIT_GetHitChance (oth, talent);
		diff = realTalent - fightSkill;
	};

	if (!Patch_BIT_trainer_max_on_effective) {
		// reduce the real value to the trained to pass the teacher max check
		B_AddFightSkill (oth, talent, diff);
	};

    var int res;
    PassArgumentN (slf);
    PassArgumentN (oth);
    PassArgumentI (talent);
    PassArgumentI (percent);
    PassArgumentI (teacherMAX);
    ContinueCall ();
    res = MEM_PopIntResult();

	if (!Patch_BIT_trainer_max_on_effective) {
		// restore the real value by adding the diff
		B_AddFightSkill (oth, talent, -diff);
	};

	if (res == FALSE) {
		return FALSE;
	};

	// FIX: every attribute should start at least at 10
	var int raiseTo; raiseTo = percent;
	if (realTalent < 10) {
		raiseTo = 10 - realTalent + percent;
	};
    B_RaiseRealFightTalentPercent (oth, talent, raiseTo);

	if (Patch_BIT_Show_stats_when_training) {
		concatText = ConcatStrings(Patch_BIT_TalentToString(talent), " trained:");
		concatText = ConcatStrings (concatText, IntToString (realTalent));
		concatText = ConcatStrings (concatText, "->");
		realTalent = Patch_BIT_GetRealFightTalentPercent (oth, talent);
		concatText = ConcatStrings (concatText, IntToString (realTalent) );
		concatText = ConcatStrings (concatText, " effective:");
		concatText = ConcatStrings (concatText, IntToString (fightSkill) );
		concatText = ConcatStrings (concatText, "->");
		fightSkill = Patch_BIT_GetHitChance(oth, talent);
		concatText = ConcatStrings (concatText, IntToString (fightSkill) );
		PrintScreen	(concatText, 5, 5, FONT_SCREEN, 5);
	};

    return res;
};
