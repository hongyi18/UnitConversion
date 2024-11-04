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
- `NaturalUnitInfo[]`: Information about the current natural unit system and the preferred units (which will be preferably used in outputs).
- `UC[quantity]`: Automatically simplify the quantity.
- `UC[quantity, targetunit]`: Express the quantity with the target unit.
- `SetNaturalUnit[DefiningConstants->{c==1, GN==1}, PreferredUnits->{km}]`: Use the natural system with the defining constant $c=G_\mathrm{N}=1$ (geometrized units), with the preferred unit $\mathrm{km}$.
