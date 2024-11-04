# UnitConversion
UnitConversion is a Mathematica package devoted to converting quantities between units in a specified unit system, including the natural units frequently used in the field of cosmology and high-energy physics. The default natural unit system is the one with $c=\hbar=k_\mathrm{B}=\varepsilon_0=1$ (i.e., with light speed, reduced Planck constant, Boltzmann constant, and vacuum permittivity being unity). Custom natural systems are supported.

## Installation/update

**Method 1:** One can directly import the package from the web every time, using
```
Import["https://raw.githubusercontent.com/hongyi18/UnitConversion/main/UnitConversion.wl"]
```

**Method 2:** Download the package to the Applications subdirectory of $UserBaseDirectory, using
```
URLDownload["https://raw.githubusercontent.com/hongyi18/UnitConversion/main/UnitConversion.wl", FileNameJoin[{$UserBaseDirectory, "Applications", "UnitConversion.wl"}]]
```
To load the package, simply run
```
<<UnitConversion`
```

**Note:** If the installation/update fails, please check your internet connection by following the guide [Troubleshooting Internet Connectivity Problems](https://reference.wolfram.com/language/tutorial/TroubleshootingInternetConnectivity.html).

## Tutorial
Please follow the Mathematica notebook [Get started on UnitConversion.nb](https://github.com/hongyi18/UnitConversion/blob/main/Get%20started%20on%20UnitConversion.nb) for a 3-minute tutorial.

## Cheatsheet
- `Join[$BaseUnits, Keys@$Units]`: Print the full list of the symbols of named units.
- `?H0`: Check if the unit symbol `H0` is supported; the meaning of the symbol will be printed if it is supported.
- `UnitList[]`: Print the full list of named units and their meanings.
- `NaturalUnitInfo[]`: Information about the current natural unit system and the preferred units (which will be preferably used in outputs if no target unit is given).
- `UC[quantity]`: Automatically simplify the quantity.
- `UC[quantity, targetunit]`: Express the quantity with the target unit.
- `SetNaturalUnit[DefiningConstants->{c==1, GN==1}, PreferredUnits->{km}]`: Use the natural system with the defining constant $c=G_\mathrm{N}=1$ (geometrized units), with the preferred unit $\mathrm{km}$.

## Basic info about the package
The values of constants are taken based on reviews by Particle Data Group, [Physical Constants](https://pdg.lbl.gov/2024/reviews/rpp2024-rev-phys-constants.pdf) and [Astrophysical Constants and Parameters](https://pdg.lbl.gov/2024/reviews/rpp2024-rev-astrophysical-constants.pdf), and the wikipedia page [International System of Units](https://en.wikipedia.org/wiki/International_System_of_Units).

The current list of named units incorporates the SI base units $\\{ \mathrm{s}, \mathrm{m}, \mathrm{kg}, \mathrm{A}, \mathrm{K} \\}$, their derived units, and some useful constants in physics and cosmology. The other two SI base units $\\{ \mathrm{mol}, \mathrm{cd} \\}$ and their derived units are not included for now.

## Contact
If you find any bugs or would like to make suggestions for its improvement, please contact me via the email address displayed on [my website](https://hongyi18.github.io/).
