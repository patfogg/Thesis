-- lehr.lua
-- Author: Rowan J. Gollan
-- Date: 2016-01-27
--
-- This script is used to setup a simlulation of Lehr's
-- hemispherical projectile fired into a detonable gas.
--
-- Reference:
--   Lehr, H. (1972)
--   Acta Astronautica, 17, pp.589--597
--
config.title = "Lehr experiment M=3.55"
R = 7.5e-3 -- nose radis, metres

-- free stream conditions
-- taken from Table 1, Entry 5
nsp, nmodes, gmodel = setGasModel('Jachimowski-gas-model.lua')
p_inf = 186.0/760.0*101325.0 -- Pa
u_inf = 1892 -- m/s
T_inf = 292 -- K
molef_inf = {H2=2/3, O2=1/3}
massf_inf = gmodel:molef2massf(molef_inf)
inflow = FlowState:new{p=p_inf, T=T_inf, velx=u_inf, massf=massf_inf}
initial = FlowState:new{p=p_inf/5, T=T_inf, velx=0, massf=massf_inf}

-- Now set some configuration options
body_flow_length = R/u_inf
t_final = 50 * body_flow_length -- allow time to establish
--From Wilson & Sussman [1993] Check i have i j oriented right
--ni = 81; nj = 375 -- coarse
-- moderate
ni = 200; nj = 600
-- fine
--ni = 321; nj = 375
config.axisymmetric = true
config.reacting = true
config.reactions_file = 'Jachimowski-reac-file.lua'
config.reaction_time_delay = 0.0
config.flux_calculator = "ausmdv"
--config.gasdynamic_update_scheme = "moving_grid_2_stage"
--config.grid_motion = "shock_fitting"
--config.shock_fitting_delay = 3 * body_flow_length
config.interpolation_delay = 10 * body_flow_length
config.max_time = t_final
config.max_step = 800000
config.dt_init = 1.0e-10
config.cfl_value = 0.4
config.dt_plot = config.max_time/100.0


-- Set up the geometry for defining the grid
-- Points
a = {x=0.0, y=0.0}
b = {x=-R, y=0.0}
c = {x=0.0, y=R}
d = {{x=-1.5*R,y=0.0}, {x=-1.5*R,y=R}, {x=-R,y=2*R}, {x=0.0,y=3*R}}
w = {{x=-7/6*R,y=0.0}, {x=-7/6*R,y=19*R/36}, {x=-17*R/18,y=12*R/12},{x=-21*R/36,y=5*R/3}, {x=0.0, y=5/3*R}}
e = {{x=-13/12*R,y=0.0}, {x=-13/12*R,y=15*R/32}, {x=-8*R/9,y=7*R/8}, {x=-15/32*R,y=4/3*R},{x=0.0,y=4/3*R}} 
--Paths
dpth = Bezier:new{points=d}
wpth = Bezier:new{points=w}
epth = Bezier:new{points=e}
modelpth = Arc:new{p0=b, p1=c, centre=a}
-- Path Parameterized 
inflowPath = ArcLengthParameterizedPath:new{underlying_path=dpth}
westPath = ArcLengthParameterizedPath:new{underlying_path=wpth}
eastPath = ArcLengthParameterizedPath:new{underlying_path=epth}
modelPath = ArcLengthParameterizedPath:new{underlying_path=modelpth}

--Patches
-- Set up surface and grid
--psurf = CoonsPatch:new{
--   north=Line:new{p0=d[#d], p1=c}, east=Arc:new{p0=b, p1=c, centre=a},
--   south=Line:new{p0=d[1], p1=b}, west=Bezier:new{points=d}
--}
p00 = CoonsPatch:new{
	north=Line:new{p0=d[#d], p1=w[#w]}, east=Bezier:new{points=w},
	south=Line:new{p0=d[1], p1=w[1]}, west=Bezier:new{points=d}
}
p01 = CoonsPatch:new{
	north=Line:new{p0=w[#w], p1=e[#e]}, east=Bezier:new{points=e},
	south=Line:new{p0=w[1], p1=e[1]}, west=Bezier:new{points=w}
}
p02 = CoonsPatch:new{
	north=Line:new{p0=e[#e], p1=c}, east=Arc:new{p0=b, p1=c, centre=a},
	south=Line:new{p0=e[1], p1=b}, west=Bezier:new{points=e
								}
}

-- Grids
-- Set up some mild clustering towards body so that the heat
--Need to look at refining grid further away from body to resolve fine chemistry
-- release zone can be resolved
cluster = RobertsFunction:new{end0=false, end1=true, beta=1.2}
clWest = {north=RobertsFunction:new{end0=false, end1=true, beta=1.2}, south=RobertsFunction:new{end0=false, end1=true, beta=1.5}}
clCentre = {north=RobertsFunction:new{end0=true, end1=true, beta=1.2}, south=RobertsFunction:new{end0=true, end1=true, beta=1.2}}
clEast = {north=RobertsFunction:new{end0=true, end1=false, beta=1.2}, south=RobertsFunction:new{end0=true, end1=true, beta=1.2}}
--grid = StructuredGrid:new{psurface=psurf, niv=(ni+1)/3, njv=(nj+1)/4,}
nib= 3; njb=8
grid00 = StructuredGrid:new{psurface=p00, niv=(ni+1)/nib*2, njv=(nj+1)/4, cfList=clWest}
grid01 = StructuredGrid:new{psurface=p01, niv=(ni+1)/nib/2, njv=(nj+1)/4, cfList=clCentre}
grid02 = StructuredGrid:new{psurface=p02, niv=(ni+1)/nib/2, njv=(nj+1)/4, cfList=clEast}

-- Blocks
--blk = FBArray:new{grid=grid, fillCondition=initial, label='blk',
--		  bcList={west=InFlowBC_Supersonic:new{flowCondition=inflow},
--			  north=OutFlowBC_Simple:new{}},
--                  nib=1, njb=4}
blk00 = FBArray:new{grid=grid00, initialState=initial, label='blk00',
	bcList={west=InFlowBC_Supersonic:new{flowCondition=inflow},
		north=OutFlowBC_Simple:new{}},
		nib= 1, njb=njb
}
blk01 = FBArray:new{grid=grid01, initialState=initial, label='blk01',
	bcList={north=OutFlowBC_Simple:new{}},
		nib= 1, njb=njb
}
blk02 = FBArray:new{grid=grid02, initialState=initial, label='blk02',
	bcList={north=OutFlowBC_Simple:new{}},
		nib= 1, njb=njb
}

identifyBlockConnections()
----------------------------------------------------------------------------
-- History:
--   2021-07-27 : PF Moved blocks closer to model
--   2021-05-26 : PF Split grid into 3 blockarrays for clustering away from model face to resolve chemistry.
--   2016-01-27 : RJG updated for eilmerD Lua input
--   2015-03-15 : RJG re-worked eilmer3 example for M = 3.55
--   2010-02-27 : PJ adapted for eilmer3
--                bits taken from sphere-heat-transfer and
--                mbcns2/lehr_sphere
