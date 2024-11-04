(* ::Package:: *)

(* Mathematica Package *)
(* Title: UnitConversion *)
(* Author: Hong-Yi Zhang *)
(* Website: https://hongyi18.github.io *)
(* Package Version: 1.0 *)
(* Mathematica Version: 13.3.1 *)
(* Date: Nov 4, 2024 *)

BeginPackage["UnitConversion`"];
Print["UnitConversion 1.0 has been loaded."];
Print["Please consider citing ", Hyperlink["arXiv:123456", "https://github.com/hongyi18/UnitConversion"], " if you find this package helpful for your research."]


(* Public functions. *)
SetNaturalUnit::usage = "
SetNaturalUnit[DefiningConstants\[Rule]{c==1, \[HBar]==1, \[Epsilon]0==1, kB==1}, PreferredUnits\[Rule]{eV}] specifies the natural unit system for unit conversion.
Default natural unit system is the one with defining constants c=\[HBar]=\[Epsilon]0=kB=1; and results will be preferably expressed in terms of eV. 
If no defining constants or preferred units are desired, set DefiningConstant\[Rule]None or PreferredUnits\[Rule]None.
";

NaturalUnitInfo::usage = "
Information about the current natural unit system and preferred units.
";

UnitList::usage "
List all named units.
";

UC::usage = "
UC[quantity] automatically converts the input quantity in the current natural unit system.
UC[quantity, targetunit] converts the input quantity in terms of the target unit.
";


(* Error messages. *)
UC::wrongunit = "The input quantity `1` and the target unit `2` are not compatible.";


(* SI defining constants and coomon variations. *)
\[Nu]Cs::usage = "Hyperfine transition frequency of Cs.";
c::usage = "Speed of light.";
h::usage = "Planck constant.";
\[HBar]::usage = "Reduced Planck constant.";
e::usage = "Elementary charge.";
kB::usage = "Boltzmann constant.";

(* SI base units and common variations. Units are in the increasing order. *)
fs::usage = "Femtosecond."; (* Time. *)
ns::usage = "Nanosecond.";
\[Mu]s::usage = "Microsecond.";
ms::usgae = "Millisecond.";
s::usage = "Second."; 
min::usage = "Minute.";
hr::usage = "Hour.";
day::usage = "Day.";
yr::usage = "Julian year.";
kyr::usage = "Kiloyear.";
Gyr::usage = "Gigayear.";
fm::usage = "Femtometer."; (* Length. *)
\[Angstrom]::usage = "Angstrom.";
nm::usage = "Nanometer.";
\[Mu]m::usage = "Micron.";
mm::usage = "Millimeter.";
cm::usage = "Centimeter.";
in::usage = "Inch.";
dm::usage = "Decimeter.";
ft::usage = "Foot.";
m::usage = "Meter.";
km::usage = "Kilometer.";
au::usage = "Astronomical unit.";
ly::usage = "Light year.";
pc::usage = "Parsec.";
kpc::usage = "Kiloparsec.";
Mpc::usage = "Megaparsec.";
u::usage = "Unified atomic mass unit."; (* Mass. *)
mg::usage = "Milligram.";
g::usage = "Gram.";
kg::usage = "Kilogram.";
ton::usage = "Ton.";
mA::usage = "Milliampere."; (* Electric current. *)
A::usage = "Ampere.";
K::usage = "Kelvin."; (* Temperature. *)

(* SI derived units and variations. *)
nHz::usage = "Nanohertz.";
\[Mu]Hz::usage = "Microhertz.";
mHz::usage = "Millihertz.";
Hz::usage = "Hertz.";
kHz::usage = "Kilohertz.";
MHz::usage = "Megahertz.";
GHz::usage = "Gigahertz.";
N::usage = "Newton.";
Pa::usage = "Pascal.";
J::usage = "Joule.";
\[Mu]eV::usage = "Microelectronvolt.";
meV::usage = "Millielectronvolt.";
eV::usage = "Electronvolt.";
keV::usage = "Kiloelectronvolt.";
MeV::usage = "Megaelectronvolt.";
GeV::usage = "Gigaelectronvolt.";
TeV::usage = "Teraelectronvolt.";
PeV::usage = "Petaelectronvolt.";
erg::usage = "Erg in CGS units.";
W::usage = "Watt.";
kW::usage = "Kilowatt.";
C::usage = "Coulomb.";
mV::usage = "Millivolt.";
V::usage = "Volt.";
F::usage = "Farad.";
\[CapitalOmega]::usage = "Ohm.";
S::usage = "Siemens.";
Wb::usage = "Weber.";
T::usage = "Tesla.";
G::usage = "Gauss.";
H::usage = "Henry.";
barn::usage = "Barn.";
ml::usage = "Mililiter.";
L::usage = "Liter.";

(* Other physical constants. *)
GN::usage = "Gravitational constant.";
\[Mu]0::usage = "Vacuum permeability.";
\[Epsilon]0::usage = "Vacuum permittivity.";
ke::usage = "Coulomb constant.";
\[Alpha]::usage = "Fine-structure constant.";
mP::usage = "Planck mass.";
MP::usage = "Reduced Planck mass.";
tP::usage = "Planck time.";
TP::usage = "Planck temperature.";
lP::usage = "Planck length.";
EP::usage = "Planck energy.";
mProton::usage = "Proton mass.";
mNeutron::usage = "Neutron mass.";
mElectron::usage = "Electron mass.";
mWBoson::usage = "W boson mass.";
mZBoson::usage = "Z boson mass.";

(* Astrophysical/cosmological quantities. *)
MSun::usage = "Solar mass.";
MEarth::usage = "Earth mass.";
RSun::usage = "Nominal Solar equatorial radius.";
REarth::usage = "Nominal Earth equatorial radius.";
H0::usage = "Hubble parameter today (measured by CMB data).";
\[Rho]crit::usage = "Critical density of the universe.";
\[CapitalOmega]b::usage = "Fractional density of baryons.";
\[CapitalOmega]c::usage = "Fractional density of cold dark matter.";
\[CapitalOmega]m::usage = "Fractional density of pressureless matter.";
\[CapitalOmega]r::usage = "Fractional density of radiation.";
\[CapitalOmega]\[CapitalLambda]::usage = "Fractional density of dark energy.";
\[CapitalOmega]k::usage = "Fractional density of curvature.";
zeq::usage = "Redshift of matter-radiation equality.";
teq::usage = "Age at matter-radiation equality.";
TCMB::usage = "Present-day CMB temperature.";


(* Global variables. *)
$BaseUnits::usage = "The irreducible set of base units in the SI unit system.";
$Units::usage = "Definitions of units and quantities, except the base units.";


$BaseUnits = {s, m, kg, A, K};
$Units = (* Definition of units in order. Base units should not be redefined here. *)
<|
\[Nu]Cs -> 9192631770 Hz, (* Exact. *)
c -> 299792458 m/s, (* Exact. *)
h -> 6.62607015 10^-34 J s, (* Exact. *)
\[HBar] -> h/(2 \[Pi]),
e -> 1.602176634 10^-19 C, (* Exact. *)
kB -> 1.380649 10^-23 J/K, (* Exact. *)

fs -> 10^-15 s,
ns -> 10^-9 s,
\[Mu]s -> 10^-6 s,
ms -> 10^-3 s,
min -> 60 s,
hr -> 60 min,
day -> 24 hr,
yr -> 365.25 day, (* Julian year. *)
kyr -> 10^3 yr,
Gyr -> 10^9 yr,
fm -> 10^-15 m,
\[Angstrom] -> 10^-10 m,
nm -> 10^-9 m,
\[Mu]m -> 10^-6 m,
mm -> 10^-3 m,
cm -> 10^-2 m,
in -> 0.0254 m, (* Exact. *)
dm -> 10^-1 m,
ft -> 0.3048 m, (* Exact. *)
km -> 10^3 m,
au -> 149597870700 m, (* Exact. *)
ly -> c yr,
pc -> au 180 60 60/\[Pi], (* Exact. *)
kpc -> 10^3 pc,
Mpc -> 10^6 pc,
u -> 1.66053906660*10^-27 kg,
mg -> 10^-6 kg,
g -> 10^-3 kg,
ton -> 10^3 kg,
mA -> 10^-3 A,

nHz -> 10^-9 Hz,
\[Mu]Hz -> 10^-6 Hz,
mHz -> 10^-3 Hz,
Hz -> 1/s,
kHz -> 10^3 Hz,
MHz -> 10^6 Hz,
GHz -> 10^9 Hz,
N -> 10^3 g m/s^2,
Pa -> N/m^2,
J -> N m,
\[Mu]eV -> 10^-6 eV,
meV -> 10^-3 eV,
eV -> 1.602176634 10^-19 J, (* Exact. *)
keV -> 10^3 eV,
MeV -> 10^6 eV,
GeV -> 10^9 eV,
TeV -> 10^12 eV,
PeV -> 10^15 eV,
erg -> 10^-7 J,
W -> J/s,
kW -> 10^3 W,
C -> s A,
mV -> 10^-3 V,
V -> J/C,
F -> C/V,
\[CapitalOmega] -> V/A,
S -> 1/\[CapitalOmega],
Wb -> V s,
T -> Wb/m^2,
G -> 10^-4 T,
H -> Wb/A,
barn -> 10^-28 m^2,
ml -> cm^3,
L -> 10^3 ml,

GN -> 6.67430 10^-11 N m^2/(10^3 g)^2,
\[Mu]0 -> 1.00000000055 4 \[Pi] 10^-7 N/A^2,
\[Epsilon]0 -> 1/(\[Mu]0 c^2),
ke -> 1/(4 \[Pi] \[Epsilon]0),
\[Alpha] -> e^2/(4 \[Pi] \[Epsilon]0 \[HBar] c),
mP -> Sqrt[\[HBar] c/GN],
MP -> Sqrt[\[HBar] c/(8 \[Pi] GN)],
tP -> Sqrt[\[HBar] GN/c^5],
TP -> Sqrt[\[HBar] c^5/(GN kB^2)],
lP -> Sqrt[\[HBar] GN/c^3],
EP -> Sqrt[\[HBar] c^5/GN],
mProton -> 1.007276466621 u,
mNeutron ->  1.00866491595 u,
mElectron -> 0.51099895000 MeV/c^2,
mWBoson -> 80.3692 GeV/c^2,
mZBoson -> 91.1880 GeV/c^2,

MSun -> 1.98841 10^33 g,
MEarth -> 5.97217 10^27 g,
RSun -> 6.957 10^8 m,
REarth -> 6.3781 10^6 m,
H0 -> 100 0.674 km/s/Mpc, (* CMB data. *)
\[Rho]crit -> 3 H0^2/(8 \[Pi] GN),
\[CapitalOmega]b -> 0.0493,
\[CapitalOmega]c -> 0.265,
\[CapitalOmega]m -> 0.315,
\[CapitalOmega]r -> 5.38 10^-5,
\[CapitalOmega]\[CapitalLambda] -> 0.685,
\[CapitalOmega]k -> 0.0007,
zeq -> 3402,
teq -> 51.0 kyr,
TCMB -> 2.7255 K
|>;
$Units = Rationalize[#, 0]&/@$Units; (* Turn numerical values into exact numbers. *)


Begin["`Private`"];


(* Set the natural unit system. *)
$Assumptions = And@@Thread[Join[$BaseUnits, Keys[$Units]]>0];
$DefiningConstants = {c==1, \[HBar]==1, \[Epsilon]0==1, kB==1}; (* Default natural system. *)
$PreferredUnits = {eV}; (* Default preferred units for outputs. *)

Unprotect[SetNaturalUnit];
Options[SetNaturalUnit] = {DefiningConstants->$DefiningConstants, PreferredUnits->$PreferredUnits};
SyntaxInformation[SetNaturalUnit] = {"ArgumentsPattern"->{OptionsPattern[]}};
SetNaturalUnit[OptionsPattern[]] := 
Block[{},
	$DefiningConstants = OptionValue[DefiningConstants];
	$PreferredUnits = OptionValue[PreferredUnits];
	
	(* Given a unit system, solve units in terms of the base units. *)
	If[Head[$DefiningConstants]===List && Length@$DefiningConstants>=1,
		$UnitReplace = Association@Solve[$DefiningConstants//.$Units, $BaseUnits[[;;Length@$DefiningConstants]]],
		$UnitReplace = <||>
	];
	AssociateTo[$UnitReplace, $Units];
	$UnitReplace = Map[Simplify, $UnitReplace//.$UnitReplace];
	$UnitReplace = Map[N, $UnitReplace];
	
	(* Include powers of the preferred units from -8 to 8, which should be enough for most applications. *)
	If[Head[$PreferredUnits]===List && Length@$PreferredUnits>=1,
		$PreferredUnitsInternal = Flatten@Table[$PreferredUnits[[n]]^p, {n, 1, Length@$PreferredUnits}, {p, Join[Range[-8, -1], Range[1, 8]]}],
		$PreferredUnitsInternal = None
	]; 
];
Protect[SetNaturalUnit];

SetNaturalUnit[]


Unprotect[NaturalUnitInfo];
NaturalUnitInfo[] := Print["Defining constants are ", $DefiningConstants, ", preferred units are ", $PreferredUnits, "."];
Protect[NaturalUnitInfo]


Unprotect[UnitList];
UnitList[] := Scan[Function[x, Print[x, ": ", x::usage]], Join[$BaseUnits, Keys@$Units]];
Protect[UnitList]


Unprotect[UC];
UC[x_, unit_] := 
Block[{y},
	y = x/unit //.$UnitReplace//N;
	If[!NumericQ[y], Message[UC::wrongunit, x, unit]]; (* y should be dimensionless if units are compatible. *)
	
	(* Defer the unit if it contains numbers. *)
	(* Precision is \[Infinity] if the input unit does not contain any multiplication numbers. *)
	If[Precision[N[Rationalize[unit, 0]]]===\[Infinity], y unit, y Defer[Evaluate@Simplify[unit]]]
];

UC[x_] := 
Block[{yList, idx},
	If[Head[$PreferredUnitsInternal]===List && Length@$PreferredUnitsInternal>=1,
		(* If preferred units are given, try taking the best-matching unit. *)
		yList = Map[Function[unit, x/unit //.$UnitReplace//N], $PreferredUnitsInternal] //Quiet;
		idx = FirstPosition[NumericQ/@yList, True][[1]];
		If[IntegerQ[idx], UC[x, $PreferredUnitsInternal[[idx]]], x/.$UnitReplace//N],
		
		(* If no preferred units are given, simplify the quantity. *)
		x/.$UnitReplace//N
	]
];
Protect[UC];


End[];
EndPackage[];
