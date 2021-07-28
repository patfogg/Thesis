species = {[0]='H2', [1]='O2', [2]='H2O', [3]='HO2', [4]='H2O2', [5]='OH', [6]='O', [7]='H', [8]='N2', }
config = {
  tempLimits = {lower=300.000000, upper=50000.000000},
  odeStep = {method='alpha-qss', eps1= 1.000000e-03, eps2= 5.000000e-04, delta= 1.000000e-10, maxIters=10},
  tightTempCoupling = false,
  maxSubcycles = 10000,
  maxAttempts = 4
}

reaction = {}
reaction[1] = {
  equation = "H + O2 <=> OH + O",
  type = "elementary",
  frc = {model='Arrhenius', A=1.040000000000e+08, n=0.000000, C=7.693004529441e+03, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 1, 7,},
  reacCoeffs = { 1.000000e+00, 1.000000e+00,},
  prodIdx = { 5, 6,},
  prodCoeffs = { 1.000000e+00, 1.000000e+00,},
}

reaction[2] = {
  equation = "H + O2 (+ M) <=> HO2 (+ M)",
  type = "elementary",
  frc = {model='Troe',
   kInf={A=5.590000000000e+07, n=0.200000, C=0.000000000000e+00, rctIndex=-1},
   k0={A=3.700000000000e+07, n=-1.000000, C=0.000000000000e+00, rctIndex=-1},
 F_cent=8.000000000000e-01, 
},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 1, 7,},
  reacCoeffs = { 1.000000e+00, 1.000000e+00,},
  prodIdx = { 3,},
  prodCoeffs = { 1.000000e+00,},
  efficiencies = {
    [0]=1.000000e+00,
    [2]=1.000000e+00,
    [8]=1.000000e+00,
  },
}

reaction[3] = {
  equation = "H + O2 (+ M) <=> HO2 (+ M)",
  type = "elementary",
  frc = {model='Troe',
   kInf={A=5.590000000000e+07, n=0.200000, C=0.000000000000e+00, rctIndex=-1},
   k0={A=5.690000000000e+06, n=-1.100000, C=0.000000000000e+00, rctIndex=-1},
 F_cent=7.000000000000e-01, 
},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 1, 7,},
  reacCoeffs = { 1.000000e+00, 1.000000e+00,},
  prodIdx = { 3,},
  prodCoeffs = { 1.000000e+00,},
  efficiencies = {
    [0]=1.000000e+00,
    [1]=1.000000e+00,
    [8]=1.000000e+00,
  },
}

reaction[4] = {
  equation = "H + O2 (+ M) <=> HO2 (+ M)",
  type = "elementary",
  frc = {model='Troe',
   kInf={A=5.590000000000e+07, n=0.200000, C=0.000000000000e+00, rctIndex=-1},
   k0={A=2.650000000000e+07, n=-1.300000, C=0.000000000000e+00, rctIndex=-1},
 F_cent=7.000000000000e-01, 
},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 1, 7,},
  reacCoeffs = { 1.000000e+00, 1.000000e+00,},
  prodIdx = { 3,},
  prodCoeffs = { 1.000000e+00,},
  efficiencies = {
    [0]=2.500000e+00,
    [3]=1.000000e+00,
    [4]=1.200000e+01,
    [5]=1.000000e+00,
    [6]=1.000000e+00,
    [7]=1.000000e+00,
    [8]=1.000000e+00,
  },
}

reaction[5] = {
  equation = "H2O2 (+ M) <=> 2OH (+ M)",
  type = "elementary",
  frc = {model='Troe',
   kInf={A=8.590000000000e+14, n=0.000000, C=2.443885254152e+04, rctIndex=-1},
   k0={A=9.550000000000e+09, n=0.000000, C=2.123955712129e+04, rctIndex=-1},
 F_cent=1.000000000000e+00, 
},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 4,},
  reacCoeffs = { 1.000000e+00,},
  prodIdx = { 5,},
  prodCoeffs = { 2.000000e+00,},
  efficiencies = {
    [0]=2.500000e+00,
    [1]=1.000000e+00,
    [2]=1.500000e+01,
    [3]=1.000000e+00,
    [4]=1.500000e+01,
    [5]=1.000000e+00,
    [6]=1.000000e+00,
    [7]=1.000000e+00,
    [8]=1.500000e+00,
  },
}

reaction[6] = {
  equation = "OH + H2O2 <=> H2O + HO2",
  type = "elementary",
  frc = {model='Arrhenius', A=1.740000000000e+06, n=0.000000, C=1.600402617011e+02, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 4, 5,},
  reacCoeffs = { 1.000000e+00, 1.000000e+00,},
  prodIdx = { 2, 3,},
  prodCoeffs = { 1.000000e+00, 1.000000e+00,},
}

reaction[7] = {
  equation = "OH + H2O2 <=> H2O + HO2",
  type = "elementary",
  frc = {model='Arrhenius', A=7.590000000000e+07, n=0.000000, C=3.658278812280e+03, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 4, 5,},
  reacCoeffs = { 1.000000e+00, 1.000000e+00,},
  prodIdx = { 2, 3,},
  prodCoeffs = { 1.000000e+00, 1.000000e+00,},
}

reaction[8] = {
  equation = "OH + HO2 <=> H2O + O2",
  type = "elementary",
  frc = {model='Arrhenius', A=2.890000000000e+07, n=0.000000, C=-2.516356316054e+02, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 3, 5,},
  reacCoeffs = { 1.000000e+00, 1.000000e+00,},
  prodIdx = { 1, 2,},
  prodCoeffs = { 1.000000e+00, 1.000000e+00,},
}

reaction[9] = {
  equation = "HO2 + HO2 <=> H2O2 + O2",
  type = "elementary",
  frc = {model='Arrhenius', A=1.300000000000e+05, n=0.000000, C=-8.067438349270e+02, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 3,},
  reacCoeffs = { 2.000000e+00,},
  prodIdx = { 1, 4,},
  prodCoeffs = { 1.000000e+00, 1.000000e+00,},
}

reaction[10] = {
  equation = "HO2 + HO2 <=> H2O2 + O2",
  type = "elementary",
  frc = {model='Arrhenius', A=4.200000000000e+08, n=0.000000, C=6.029189733266e+03, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 3,},
  reacCoeffs = { 2.000000e+00,},
  prodIdx = { 1, 4,},
  prodCoeffs = { 1.000000e+00, 1.000000e+00,},
}

reaction[11] = {
  equation = "H2O + M <=> H + OH + M",
  type = "anonymous_collider",
  frc = {model='Arrhenius', A=6.060000000000e+21, n=-3.310000, C=6.078007045798e+04, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 2,},
  reacCoeffs = { 1.000000e+00,},
  prodIdx = { 5, 7,},
  prodCoeffs = { 1.000000e+00, 1.000000e+00,},
  efficiencies = {
    [0]=3.000000e+00,
    [1]=1.500000e+00,
    [3]=1.000000e+00,
    [4]=1.000000e+00,
    [5]=1.000000e+00,
    [6]=1.000000e+00,
    [7]=1.000000e+00,
    [8]=1.000000e+00,
  },
}

reaction[12] = {
  equation = "H2O + H2O <=> H + OH + H2O",
  type = "elementary",
  frc = {model='Arrhenius', A=1.000000000000e+20, n=-2.440000, C=6.047307498742e+04, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 2,},
  reacCoeffs = { 2.000000e+00,},
  prodIdx = { 2, 5, 7,},
  prodCoeffs = { 1.000000e+00, 1.000000e+00, 1.000000e+00,},
}

reaction[13] = {
  equation = "OH + OH <=> H2O + O",
  type = "elementary",
  frc = {model='Arrhenius', A=3.570000000000e-02, n=2.400000, C=-1.062405636638e+03, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 5,},
  reacCoeffs = { 2.000000e+00,},
  prodIdx = { 2, 6,},
  prodCoeffs = { 1.000000e+00, 1.000000e+00,},
}

reaction[14] = {
  equation = "O + H2 <=> H + OH",
  type = "elementary",
  frc = {model='Arrhenius', A=3.820000000000e+06, n=0.000000, C=4.000000000000e+03, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 0, 6,},
  reacCoeffs = { 1.000000e+00, 1.000000e+00,},
  prodIdx = { 5, 7,},
  prodCoeffs = { 1.000000e+00, 1.000000e+00,},
}

reaction[15] = {
  equation = "O + H2 <=> H + OH",
  type = "elementary",
  frc = {model='Arrhenius', A=8.790000000000e+08, n=0.000000, C=9.647710115752e+03, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 0, 6,},
  reacCoeffs = { 1.000000e+00, 1.000000e+00,},
  prodIdx = { 5, 7,},
  prodCoeffs = { 1.000000e+00, 1.000000e+00,},
}

reaction[16] = {
  equation = "H2 + OH <=> H2O + H",
  type = "elementary",
  frc = {model='Arrhenius', A=2.170000000000e+02, n=1.520000, C=1.739808756920e+03, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 0, 5,},
  reacCoeffs = { 1.000000e+00, 1.000000e+00,},
  prodIdx = { 2, 7,},
  prodCoeffs = { 1.000000e+00, 1.000000e+00,},
}

reaction[17] = {
  equation = "H + HO2 <=> OH + OH",
  type = "elementary",
  frc = {model='Arrhenius', A=7.080000000000e+07, n=0.000000, C=1.509813789633e+02, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 3, 7,},
  reacCoeffs = { 1.000000e+00, 1.000000e+00,},
  prodIdx = { 5,},
  prodCoeffs = { 2.000000e+00,},
}

reaction[18] = {
  equation = "H + HO2 <=> H2O + O",
  type = "elementary",
  frc = {model='Arrhenius', A=1.450000000000e+06, n=0.000000, C=0.000000000000e+00, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 3, 7,},
  reacCoeffs = { 1.000000e+00, 1.000000e+00,},
  prodIdx = { 2, 6,},
  prodCoeffs = { 1.000000e+00, 1.000000e+00,},
}

reaction[19] = {
  equation = "H + HO2 <=> H2 + O2",
  type = "elementary",
  frc = {model='Arrhenius', A=3.660000000000e+00, n=2.087000, C=-7.297433316558e+02, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 3, 7,},
  reacCoeffs = { 1.000000e+00, 1.000000e+00,},
  prodIdx = { 0, 1,},
  prodCoeffs = { 1.000000e+00, 1.000000e+00,},
}

reaction[20] = {
  equation = "O + HO2 <=> OH + O2",
  type = "elementary",
  frc = {model='Arrhenius', A=1.630000000000e+07, n=0.000000, C=-2.239557121288e+02, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 3, 6,},
  reacCoeffs = { 1.000000e+00, 1.000000e+00,},
  prodIdx = { 1, 5,},
  prodCoeffs = { 1.000000e+00, 1.000000e+00,},
}

reaction[21] = {
  equation = "H2O2 + H <=> HO2 + H2",
  type = "elementary",
  frc = {model='Arrhenius', A=1.210000000000e+01, n=2.000000, C=2.617010568697e+03, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 4, 7,},
  reacCoeffs = { 1.000000e+00, 1.000000e+00,},
  prodIdx = { 0, 3,},
  prodCoeffs = { 1.000000e+00, 1.000000e+00,},
}

reaction[22] = {
  equation = "H2O2 + H <=> H2O + OH",
  type = "elementary",
  frc = {model='Arrhenius', A=1.020000000000e+07, n=0.000000, C=1.800201308505e+03, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 4, 7,},
  reacCoeffs = { 1.000000e+00, 1.000000e+00,},
  prodIdx = { 2, 5,},
  prodCoeffs = { 1.000000e+00, 1.000000e+00,},
}

reaction[23] = {
  equation = "H2O2 + O <=> OH + HO2",
  type = "elementary",
  frc = {model='Arrhenius', A=8.430000000000e+05, n=0.000000, C=1.997986914947e+03, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 4, 6,},
  reacCoeffs = { 1.000000e+00, 1.000000e+00,},
  prodIdx = { 3, 5,},
  prodCoeffs = { 1.000000e+00, 1.000000e+00,},
}

reaction[24] = {
  equation = "H2 + M <=> H + H + M",
  type = "anonymous_collider",
  frc = {model='Arrhenius', A=5.840000000000e+12, n=-1.100000, C=5.253145445395e+04, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 0,},
  reacCoeffs = { 1.000000e+00,},
  prodIdx = { 7,},
  prodCoeffs = { 2.000000e+00,},
  efficiencies = {
    [2]=1.440000e+01,
    [3]=1.000000e+00,
    [4]=1.440000e+01,
    [5]=1.000000e+00,
    [6]=1.000000e+00,
    [7]=1.000000e+00,
    [8]=1.000000e+00,
  },
}

reaction[25] = {
  equation = "H2 + H2 <=> H + H + H2",
  type = "elementary",
  frc = {model='Arrhenius', A=9.030000000000e+08, n=0.000000, C=4.834927025667e+04, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 0,},
  reacCoeffs = { 2.000000e+00,},
  prodIdx = { 0, 7,},
  prodCoeffs = { 1.000000e+00, 2.000000e+00,},
}

reaction[26] = {
  equation = "H2 + O2 <=> H + H + O2",
  type = "elementary",
  frc = {model='Arrhenius', A=4.580000000000e+13, n=-1.400000, C=5.253145445395e+04, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 0, 1,},
  reacCoeffs = { 1.000000e+00, 1.000000e+00,},
  prodIdx = { 1, 7,},
  prodCoeffs = { 1.000000e+00, 2.000000e+00,},
}

reaction[27] = {
  equation = "O + O + M <=> O2 + M",
  type = "anonymous_collider",
  frc = {model='Arrhenius', A=6.160000000000e+03, n=-0.500000, C=0.000000000000e+00, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 6,},
  reacCoeffs = { 2.000000e+00,},
  prodIdx = { 1,},
  prodCoeffs = { 1.000000e+00,},
  efficiencies = {
    [0]=2.500000e+00,
    [1]=1.000000e+00,
    [2]=1.200000e+01,
    [3]=1.000000e+00,
    [4]=1.200000e+01,
    [5]=1.000000e+00,
    [6]=1.000000e+00,
    [7]=1.000000e+00,
    [8]=1.000000e+00,
  },
}

reaction[28] = {
  equation = "O + H + M <=> OH + M",
  type = "anonymous_collider",
  frc = {model='Arrhenius', A=4.710000000000e+06, n=-1.000000, C=0.000000000000e+00, rctIndex=-1},
  brc = {model='fromEqConst'},
  ec = {},
  reacIdx = { 6, 7,},
  reacCoeffs = { 1.000000e+00, 1.000000e+00,},
  prodIdx = { 5,},
  prodCoeffs = { 1.000000e+00,},
  efficiencies = {
    [0]=2.500000e+00,
    [1]=1.000000e+00,
    [2]=1.200000e+01,
    [3]=1.000000e+00,
    [4]=1.200000e+01,
    [5]=1.000000e+00,
    [6]=1.000000e+00,
    [7]=1.000000e+00,
    [8]=1.000000e+00,
  },
}

