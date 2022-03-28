
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

func void Patch_BIT_ModAttribute (var C_NPC oth, var int attrib, var int points)
{
	if      (attrib == ATR_STRENGTH)  { oth.attribute[ATR_STRENGTH]  = oth.attribute[ATR_STRENGTH] + points;  }
	else if (attrib == ATR_DEXTERITY) { oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] + points; }
	else if (attrib == ATR_MANA_MAX)  { oth.attribute[ATR_MANA_MAX]  = oth.attribute[ATR_MANA_MAX] + points;  };
};
