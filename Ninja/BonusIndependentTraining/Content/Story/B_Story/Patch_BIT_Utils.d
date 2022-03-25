
func int Patch_BIT_GetRealFightTalentPercent (var C_NPC oth, var int talent)
{
	if 		(talent == NPC_TALENT_1H)		{ return oth.aivar[REAL_TALENT_1H];	      }
	else if (talent == NPC_TALENT_2H)		{ return oth.aivar[REAL_TALENT_2H];	      }
	else if (talent == NPC_TALENT_BOW)		{ return oth.aivar[REAL_TALENT_BOW];	  }
	else if (talent == NPC_TALENT_CROSSBOW)	{ return oth.aivar[REAL_TALENT_CROSSBOW]; }
    else                                    { return -1;                              };
};

func int Patch_BIT_GetHitChance (var C_NPC oth, var int talent)
{
	if 		(talent == NPC_TALENT_1H)		{ return oth.Hitchance[NPC_TALENT_1H];       }
	else if (talent == NPC_TALENT_2H)		{ return oth.Hitchance[NPC_TALENT_2H];       }
	else if (talent == NPC_TALENT_BOW)		{ return oth.Hitchance[NPC_TALENT_BOW];	     }
	else if (talent == NPC_TALENT_CROSSBOW)	{ return oth.Hitchance[NPC_TALENT_CROSSBOW]; }
    else                                    { return -1;                                 };
};

func int Patch_BIT_GetRealAttribute (var C_NPC oth, var int attrib)
{
	if      (attrib == ATR_STRENGTH)  { return oth.aivar[REAL_STRENGTH];  }
	else if (attrib == ATR_DEXTERITY) { return oth.aivar[REAL_DEXTERITY]; }
	else if (attrib == ATR_MANA_MAX)  { return oth.aivar[REAL_MANA_MAX];  }
	else                              { return -1;                        };
};

func int Patch_BIT_GetAttribute (var C_NPC oth, var int attrib)
{
	if      (attrib == ATR_STRENGTH)  { return oth.attribute[ATR_STRENGTH];  }
	else if (attrib == ATR_DEXTERITY) { return oth.attribute[ATR_DEXTERITY]; }
	else if (attrib == ATR_MANA_MAX)  { return oth.attribute[ATR_MANA_MAX];  }
	else                              { return -1;                           };
};

func string Patch_BIT_TalentToString (var int talent)
{
	if 		(talent == NPC_TALENT_1H)		{ return "One-Handed"; }
	else if (talent == NPC_TALENT_2H)		{ return "Two-Handed"; }
	else if (talent == NPC_TALENT_BOW)		{ return "Bow";        }
	else if (talent == NPC_TALENT_CROSSBOW)	{ return "Crossbow";   }
    else 								    { return "Unknown";    };
};

func string Patch_BIT_AttributeToString (var int attrib)
{
	if      (attrib == ATR_STRENGTH)  { return "Strength";  }
	else if (attrib == ATR_DEXTERITY) { return "Dexterity"; }
	else if (attrib == ATR_MANA_MAX)  { return "Mana";      }
	else                              { return "Unknown";   };
};

func int Patch_BIT_TeachFightTalentPercent_Wrapper (var C_NPC slf, var C_NPC oth, var int talent, var int percent, var int teacherMAX)
{
	var string concatText;
	var string realTalent; realTalent = IntToString ( Patch_BIT_GetRealFightTalentPercent (oth, talent) );
	var string fightSkill; fightSkill = IntToString ( Patch_BIT_GetHitChance (oth, talent) );

    var int res;
    PassArgumentN (slf);
    PassArgumentN (oth);
    PassArgumentI (talent);
    PassArgumentI (percent);
    PassArgumentI (teacherMAX);
    ContinueCall ();
    res = MEM_PopIntResult();
    
    B_RaiseRealFightTalentPercent (oth, talent, percent);

	concatText = ConcatStrings(Patch_BIT_TalentToString(talent), " trained:");
	concatText = ConcatStrings (concatText, realTalent);
	concatText = ConcatStrings (concatText, "->");
	realTalent = IntToString ( Patch_BIT_GetRealFightTalentPercent (oth, talent) );
	concatText = ConcatStrings (concatText, realTalent );
	concatText = ConcatStrings (concatText, " real:");
	concatText = ConcatStrings (concatText, fightSkill);
	concatText = ConcatStrings (concatText, "->");
	fightSkill = IntToString ( Patch_BIT_GetHitChance(oth, talent) );
	concatText = ConcatStrings (concatText, fightSkill );
	PrintScreen	(concatText, 5, 5, FONT_SCREEN, 2);

    return res;
};

func int Patch_BIT_TeachAttributePoints_Wrapper (var C_NPC slf, var C_NPC oth, var int attrib, var int points, var int teacherMAX)
{
	var string concatText;
	var string realAttr; realAttr = IntToString ( Patch_BIT_GetRealAttribute (oth, attrib) );
	var string attr; attr = IntToString ( Patch_BIT_GetAttribute(oth, attrib) );

    var int res;
    PassArgumentN (slf);
    PassArgumentN (oth);
    PassArgumentI (attrib);
    PassArgumentI (points);
    PassArgumentI (teacherMAX);
    ContinueCall ();
    res = MEM_PopIntResult();
    
    B_RaiseRealAttributeLearnCounter (oth, attrib, points);

	concatText = ConcatStrings (Patch_BIT_AttributeToString(attrib), " trained:");
	concatText = ConcatStrings (concatText, realAttr);
	concatText = ConcatStrings (concatText, "->");
	realAttr = IntToString ( Patch_BIT_GetRealAttribute (oth, attrib) );
	concatText = ConcatStrings (concatText, realAttr );
	concatText = ConcatStrings (concatText, " real:");
	concatText = ConcatStrings (concatText, attr);
	concatText = ConcatStrings (concatText, "->");
	attr = IntToString ( Patch_BIT_GetAttribute(oth, attrib) );
	concatText = ConcatStrings (concatText, attr );
	PrintScreen	(concatText, 5, 5, FONT_SCREEN, 2);

    return res;
};