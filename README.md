# Bonus Independent Training Mod for Gothic 2 NotR

This is a Gothic 2 mod that changes the way training works such that only "trained points" for a specific skill/stat count toward the LP cost for further training. Other bonuses such as equipment or permanent bonuses (e.g. permanent stat increase potions) won't count.

The main effect of this mod is that you can use the permanent bonuses whenever you want.

This mod also adds a new command `BIT getcharactervalues` that prints to console the trained and effective values of each
attribute and skill.

Optionally, this mod also alters the character menu to show the trained values together with the effective values.

## Install

1. Requires Gothic 2 with [Ninja 2+](https://github.com/szapp/Ninja)
2. Download BonusIndependentTraining.vdf from a [release assets](https://github.com/elsky42/ninja-bonus_independent_training/releases)
3. Copy BonusIndependentTraining.vdf to the Data directory of your installation
    - e.g. if you installed Gothic 2 inside the directory _gothic II_ then you need to copy the file to _gothic II/Data/BonusIndependentTraining.vdf_

## Uninstall

Just remove BonusIndependentTraining.vdf from your installation Data directory. Note that existing saves will retain the changes made by the mod even after you uninstall it.

## Configuration

You can edit the configuration in _gothic II/system/gothic.ini_. This is an example:

```
[NINJA_BONUS-INDEPENDENT-TRAINING]

; shows a message with the trained and effective stat when you train
show_stats_when_training=false

; whether the trainer max attr/skill check is done against the
; trained or the effective value of that attr/skill.
;
; e.g. say that the bow level is 70 = 54 trained + 16 from bonuses
; and there is a trainer with max training at 70. If this is true
; then the trainer won't be able to train you anymore, otherwise the
; trainer will be able to train you for 16 more points.
trainer_max_against_effective=true

; shows the trained stat in the char menu on the left of the effective stat
; e.g. Strength 10 25 means that the hero has 10 trained strength
; and 25 effective
show_real_stats_in_char_menu=true
```

## Commands

A new console command `BIT getcharactervalues` is available to check the trained and effective values.
This is useful for when `show_real_stats_in_char_menu` is `false`.

## Compatibility

This mod creates hooks around the functions `B_TeachFightTalentPercent`, `B_TeachAttributePoints`, `B_RaiseFightTalent`, `B_RaiseAttribute` and `B_BlessAttribute` to prevent them from changing the real attributes or fight talents. Therefore this mod should be highly compatible with other mods unless they require the real attributes or fight talents to be changed by the functions mentioned.

## Thanks

- Gothic 2 devs
- Gothic 2 community
- Ninja devs
- [manareg](https://github.com/kirides/ninja-manareg) dev from which I ~~stole~~copied the github setup of this repository