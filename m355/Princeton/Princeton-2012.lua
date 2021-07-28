-- Author: Patrick Fogg
-- Date: 2021-05-29
--
-- Reference:
-- Burke. M., Chaos. M., Ju. Y., Dryer. F. and Klippenstein. S. (2012)
-- Comprehensive H2/O2 Kinetic Model for High-Pressure Combustion
-- International journal of chemical kinetics,44, pp. 444--474
--
--
--
-- 2021-06-02 PF: Ar, He and all Carbonacous Compunds removed from scheme 
-- 2021-07-20 PF: Units of C changed from cal to kelvin using R_u_cal const.

R_u_cal = 1.987

Config{
	odeStep = {method='alpha-qss'},
	--   tightTempCoupling = true
}

Reaction{
	'H + O2 <=> O + OH',
	fr={'Arrhenius', A= 1.04e14, n=0.0, C=1.531e04/R_u_cal},
	label='r1'
}

Reaction{
	'O + H2 <=> H + OH',
	fr={'Arrhenius', A= 3.82e12, n=0.0, C=7.948e3/R_u_cal},
	label='r2a'
}

Reaction{
	'O + H2 <=> H + OH',
	fr={'Arrhenius', A= 8.79e14, n=0.0, C=1.917e04/R_u_cal},
	label='r2b'
}

Reaction{
	'H2 + OH <=> H2O + H',
	fr={'Arrhenius', A= 2.16e8, n= 1.51, C= 3.430e03/R_u_cal},
	label='r3'
}

Reaction{
	'OH + OH <=> O + H2O',
	fr={'Arrhenius', A= 3.34e4, n= 2.42, C= -1.930e03/R_u_cal},
	label='r4'
}

Reaction{
	'H2 (+ M) <=> H + H (+ M)',
	fr={'Arrhenius', A= 4.58e19, n=-1.4, C= 1.040e5/R_u_cal},
	efficiencies={H2=2.5, H2O=12.0},
	label='r5a'
}

r5b = 'H2 + Ar <=> H + H + Ar'

r5c = 'H2 + He <=> H + H + He'


Reaction{
	'O + O (+ M) <=> O2 (+ M)',
	fr={'Arrhenius', A= 6.16e15, n=-0.5, C= 0.0},
	efficiencies={H2=2.5, H2O=12.0},
	label='r6a'
}

r6b = 'O + O + Ar <=> O2 + Ar'

r6c = 'O + O + He <=> O2 + He'

Reaction{
	'O + H (+ M) <=> OH (+ M)',
	fr={'Arrhenius', A= 4.71e18, n= -1.0, C= 0.0},
	efficiencies={H2=2.5, H2O=12.0},
	label='r7'
}

Reaction{
	'H2O (+ M) <=> H + OH (+ M)',
	fr={'Arrhenius', A= 6.06e27, n=-3.32, C= 1.208e5/R_u_cal},
	efficiencies={H2=3.0, H2O=0.0, O2=1.5, N2=2.0, H2=1.1},
	label='r8a'
}

Reaction{
	'H2O + H2O <=> H + OH + H2O',
	fr={'Arrhenius', A= 1.01e26, n= -2.44, C= 1.202e5/R_u_cal},
	label='r8b'
}

Reaction{
	'H + O2 (+ M) <=> HO2 (+ M)',
	fr={'pressure dependent',
	kInf={A= 4.65e12, n= 0.44, C= 0.0},
	k0={A= 6.37e20, n= -1.72, C=5.25e2/R_u_cal},
	Troe={F_cent=0.5}
	},
	efficiencies={H2=2.0, H2O=14.0, O2=0.78},
	label='r9a'
}

Reaction{
	'H + O2 (+ M) <=> HO2 (+ M)',
	fr={'pressure dependent',
	kInf={A= 4.65e12, n= 0.44, C= 0.0},
	k0={A= 9.04e19, n= -1.5, C= 4.92e2/R_u_cal},
	Troe={F_cent=0.5},
	},
	efficiencies={H2=3.0, H2O=21.0, O2=1.1, N2=1.5},
	label='r9b'
}

Reaction{
	'HO2 + H <=> H2 + O2',
	fr={'Arrhenius', A= 2.75e06, n= 2.09, C= -1.451e3/R_u_cal},
	label='r10'
}

Reaction{
	'HO2 + H <=> OH + OH',
	fr={'Arrhenius', A= 7.08e13, n= 0.0, C= 2.95e2/R_u_cal},
	label='r11'
}

Reaction{
	'HO2 + O <=> O2 + OH',
	fr={'Arrhenius', A= 2.85e10, n= 1.0, C= -7.239e02/R_u_cal},
	label='r12'
}

Reaction{
	'HO2 + OH <=> H2O + O2',
	fr={'Arrhenius', A= 2.89e13, n= 0.0, C= -4.97e2/R_u_cal},
	label='r13'
}

Reaction{
	'HO2 + HO2 <=> H2O2 + O2',
	fr={'Arrhenius', A= 4.2e14, n= 0.0, C= 1.2e4/R_u_cal},
	label='r14a'
}

Reaction{
	'HO2 + HO2 <=> H2O2 + O2',
	fr={'Arrhenius', A= 1.3e11, n= 0.0, C= -1.63e3/R_u_cal},
	label='r14b'
}

Reaction{
	'H2O2 (+ M) <=> OH + OH (+ M)',
	fr={'pressure dependent',
	kInf={A= 2.0e12, n= 0.9, C= 4.875e4/R_u_cal},
	k0={A= 2.49e24, n= -2.3, C= 4.875e4/R_u_cal},
	Troe={F_cent=0.42}
	},
	efficiencies={H2O=7.5, H2O2=7.7, O2=1.2, N2=1.5, H2=3.7},
	label='r15'
}

Reaction{
	'H2O2 + H <=> H2O + OH',
	fr={'Arrhenius', A= 2.41e13, n= 0.0, C= 3.97e3/R_u_cal},
	label='r16'
}

Reaction{
	'H2O2 + H <=> HO2 + H2',
	fr={'Arrhenius', A= 4.82e13, n= 0.0, C= 7.95e3/R_u_cal},
	label='r17'
}

Reaction{
	'H2O2 + O <=> OH + HO2',
	fr={'Arrhenius', A= 9.55e06, n= 2.0, C= 3.97e3/R_u_cal},
	label='r18'
}

Reaction{
	'H2O2 + OH <=> HO2 + H2O',
	fr={'Arrhenius', A= 1.74e12, n= 0.0, C= 3.18e02/R_u_cal},
	label='r19a'
}

Reaction{
	'H2O2 + OH <=> HO2 + H2O',
	fr={'Arrhenius', A= 7.59e13, n= 0.0, C= 7.27e03/R_u_cal},
	label='r19b'
}
