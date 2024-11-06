# UnitConversion
Natural unit systems are measurement systems with selected physical constants set to 1, a practice that has proven useful in physics research. The Mathematica package “UnitConversion” is designed for unit conversion within customizable
 natural unit systems. The package includes predefined units and parameters commonly used in particle physics and cosmology, enabling efficient and flexible calculations across various physical systems. The default natural unit system is the one with $c=\hbar=\varepsilon_0=k_\mathrm{B}=1$ (light speed = reduced Planck constant = vacuum permittivity = Boltzmann constant = 1).

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

**Note:** If the installation/update fails, please try again or check your internet connection by following the guide [Troubleshooting Internet Connectivity Problems](https://reference.wolfram.com/language/tutorial/TroubleshootingInternetConnectivity.html).

## Tutorial
Please follow the Mathematica notebook [Get started on UnitConversion.nb](https://github.com/hongyi18/UnitConversion/blob/main/Get%20started%20on%20UnitConversion.nb) for a 3-minute tutorial. There is also useful information about customizing the package in the 2-page note [arXiv: ]().

## Cheatsheet
- `Join[$BaseUnits, Keys@$Units]`: Print the full list of the symbols of named units.
- `?H0`: Check if the unit symbol `H0` is supported; the meaning of the symbol will be printed if it is supported.
- `UnitList[]`: Print the full list of named units and their meanings.
- `NaturalUnitInfo[]`: Information about the current natural unit system.
- `UC[quantity]`: Automatically simplify the quantity in terms of the SI base units.
- `UC[quantity, targetunit]`: Convert the quantity in terms of the target unit.
- `SetNaturalUnit[DefiningConstants->{c==1, GN==1}]`: Use the natural system with the defining constant $c=G_\mathrm{N}=1$ (geometrized units).

## Basic info about the package
The values of constants are taken based on [Particle Physics Booklet](https://pdg.lbl.gov/2024/download/db2024.pdf) by Particle Data Group and the wikipedia page [International System of Units](https://en.wikipedia.org/wiki/International_System_of_Units).

Only named units and parameters are supported. The current list of named units include five SI base units $\\{ \mathrm{s}, \mathrm{m}, \mathrm{kg}, \mathrm{A}, \mathrm{K} \\}$, their derived units, and some useful constants and parameters in particle physics and cosmology. The other two SI base units $\\{ \mathrm{mol}, \mathrm{cd} \\}$ and their derived units are not supported yet.

## Contact
If you find any bugs or would like to make suggestions for its improvement, please contact me via the email address displayed on [my website](https://hongyi18.github.io/).
