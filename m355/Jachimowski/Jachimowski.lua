-- Author: Patrick Fogg
-- Date: 2021-07-06


-- 2021-07-14: RG - Units of C changed from cal to kelvin

-- Ref: 
-- Casimir J Jachimowski, J. C. (1988) 
-- An analytical study of the hydrogen-air reaction mechanism with application to scramjetcombustion.
-- National Aeronautics and Space Administration, Scientific and Technical Information Division 

R_u_cal = 1.987

options = {
	REDUCED=false,
	ORIGINAL=true
	}
-- user defined
model = 'ORIGINAL'

Config{
   odeStep = {method='alpha-qss'},
   tightTempCoupling = true
}

Reaction{
	'H2 + O2 <=> OH + OH',
	fr={'Arrhenius', A=1.70e13, n=0.0, C=48000/R_u_cal},
	label= 'r1'
}

Reaction{
	'H + O2 <=> OH + O',
	fr={'Arrhenius', A=2.60e14, n=0.0, C=16800/R_u_cal},
	label= 'r2'
}

Reaction{
	'O + H2 <=> OH + H',
	fr={'Arrhenius', A=1.80e10, n=1.0, C=8900/R_u_cal},
	label= 'r3'
}

Reaction{
	'OH + H2 <=> H2O + H',
	fr={'Arrhenius', A=2.20e13, n=0.0, C=5150/R_u_cal},
	label= 'r4'
}

Reaction{
	'OH + OH <=> H2O + O',
	fr={'Arrhenius', A=6.30e12, n=0.0, C=1090/R_u_cal},
	label= 'r5'
}

Reaction{
	'H + OH + M <=> H2O + M',
	fr={'Arrhenius', A=2.20e22, n=-2.0, C=0.0/R_u_cal},
	efficiencies={H2O=6.0},
	label= 'r6'
}

Reaction{
	'H + H + M <=> H2 + M',
	fr={'Arrhenius', A=6.40e17, n=-1.0, C=0.0/R_u_cal},
	efficiencies={H2=2.0, H2O=6.0},
	label= 'r7'
}

Reaction{
	'H + O + M <=> OH + M',
	fr={'Arrhenius', A=6.0e16, n=-0.6, C=0.0/R_u_cal},
	efficiencies={H2O=5.0},
	label= 'r8'
}

Reaction{
	'H + O2 + M <=> HO2 + M',
	fr={'Arrhenius', A= 2.10e15, n=0.0, C=-1000/R_u_cal},
	efficiencies={H2=2.0, H2O=16.0},
	label= 'r9'
}

Reaction{
	'HO2 + H <=> H2 + O2',
	fr={'Arrhenius', A= 1.30e13, n=0.0, C=0.0/R_u_cal},
	label= 'r10'
}

Reaction{
	'HO2 + H <=> OH + OH',
	fr={'Arrhenius', A=1.40e14, n=0.0, C=1080/R_u_cal},
	label= 'r11'
}

Reaction{
	'HO2 + H <=> H2O + O',
	fr={'Arrhenius', A=1.0e13, n=0.0, C=1080/R_u_cal},
	label= 'r12'
}

Reaction{
	'HO2 + O <=> O2 + OH',
	fr={'Arrhenius', A=1.5e13, n=0.0, C=950/R_u_cal},
	label= 'r13'
}

Reaction{
	'HO2 + OH <=> H2O + O2',
	fr={'Arrhenius', A=8.0e12, n=0.0, C=0.0/R_u_cal},
	label= 'r14'
}

Reaction{
	'HO2 + HO2 <=> H2O2 + O2',
	fr={'Arrhenius', A=2.0e12, n=0.0, C=0.0/R_u_cal},
	label= 'r15'
}

Reaction{
	'H + H2O2 <=> H2 + HO2',
	fr={'Arrhenius', A=1.4e12, n=0.0, C=3600/R_u_cal},
	label= 'r16'
}

Reaction{
	'O + H2O2 <=> OH + HO2',
	fr={'Arrhenius', A=1.4e13, n=0.0, C=6400/R_u_cal},
	label= 'r17'
}

Reaction{
	'OH + H2O2 <=> H2O + HO2',
	fr={'Arrhenius', A=6.1e12, n=0.0, C=1430/R_u_cal},
	label= 'r18'
}

Reaction{
	'M + H2O2 <=> OH + OH + M',
	fr={'Arrhenius', A=1.2e17, n=0.0, C=45500/R_u_cal},
	efficiencies={H2O=15.0},
	label= 'r19'
}

Reaction{
	'O + O +M <=> O2 + M',
	fr={'Arrhenius', A=6.0e17, n=0.0, C=-1800/R_u_cal},
	label= 'r20'
}

Reaction{
	'N + N + M <=> N2 + M',
	fr={'Arrhenius', A=2.8e17, n=-0.75, C=0.0/R_u_cal},
	label= 'r21'
}

Reaction{
	'N + O2 <=> NO + O',
	fr={'Arrhenius', A=6.4e9, n=1.0, C=6300/R_u_cal},
	label= 'r22'
}

Reaction{
	'N + NO <=> N2 + O',
	fr={'Arrhenius', A=1.6e13, n=0.0, C=0.0/R_u_cal},
	label= 'r23'
}

Reaction{
	'N + OH <=> NO + H',
	fr={'Arrhenius', A=6.3e11, n=0.5, C=0.0/R_u_cal},
	label='r24'
}

Reaction{
	'H + NO + M <=> HNO + M',
	fr={'Arrhenius', A=5.4e15, n=0.0, C=-600/R_u_cal},
	label= 'r25'
}

Reaction{
	'H + HNO <=> NO + H2',
	fr={'Arrhenius', A=4.8e12, n=0.0, C=0.0/R_u_cal},
	label= 'r26'
}

Reaction{
	'O + HNO <=> NO + OH',
	fr={'Arrhenius', A=5.0e11, n=0.5, C=0.0/R_u_cal},
	label= 'r27'
}

Reaction{
	'OH + HNO <=> NO + H2O', 
	fr={'Arrhenius', A=3.6e13, n=0.0, C=0.0/R_u_cal},
	label= 'r28'
}

Reaction{
	'HO2 + HNO <=> NO + H2O2',
	fr={'Arrhenius', A=2.0e12, n=0.0, C=0.0/R_u_cal},
	label= 'r29'
}

Reaction{
	'HO2 + NO <=> NO2 + OH',
	fr={'Arrhenius', A=3.4e12, n=0.0, C=-260/R_u_cal},
	label= 'r30'
}

Reaction{
	'H + NO2 <=> NO + OH',
	fr={'Arrhenius', A=3.5e14, n=0.0, C=1500/R_u_cal},
	label= 'r31'
}

Reaction{
	'O + NO2 <=> NO + O2',
	fr={'Arrhenius', A=1.0e13, n=0.0, C=600/R_u_cal},
	label= 'r32'
}

Reaction{
	'M + NO2 <=> NO + O + M',
	fr={'Arrhenius', A=1.16e16, n=0.0, C=66000/R_u_cal},
	label= 'r33'
}

reactionList = {}

if model == REDUCED then
	reactionList = {}
end

if model == ORIGINAL then
   selectOnlyReactionsWithLabel(reactionList)
end
