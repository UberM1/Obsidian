layout: Basic 5e Layout
image: "[[Giant Spider.webp]]"
creature: Giant Spider
name: Giant Spider
ac: 14
hp: 4d10+4
cr: 1
size: Large
stats: [14, 16, 12, 2, 11, 4]
saves:
  - Stealth: 7
traits:
  - name: Spider Climb.
    desc: The spider can climb difficult surfaces, including upside down on ceilings, without needing to make an ability check.
  - name: Web Sense.
    desc: While in contact with a web, the spider knows the exact location of any other creature in contact with the same web.
  - name: Web Walker.
    desc: The spider ignores movement restrictions caused by webbing.
actions:
  - name: Bite.
    desc: "_Melee Weapon Attack:_ +5 to hit, reach 5 ft., one creature. _Hit:_ 7 (1d8 + 3) piercing damage. The target must make a DC 11 Constitution saving throw, taking the poison damage on a failed save, or half as much damage on a successful one. If the poison damage reduces the target to 0 hit points, the target is stable but poisoned for 1 hour, even after regaining hit points, and is paralyzed while poisoned in this way."
  - name: Web (Recharge 5-6).
    desc: "_Range Weapon Attack:_ +5 to hit, reach 30/60 ft., one creature. The target is restrained by webbing As an action, the restrained target can make a DC 12 Strength check, bursting the webbing on a success. The webbing can also be attacked and destroyed (AC 10; hp 5; vulnerability to fire damage; immunity to bludgeoning, poison, and psychic damage)."