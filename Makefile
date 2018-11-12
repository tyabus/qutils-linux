CXX=gcc
INCLUDES=-Icommon
LIBPATH=-Lcommon
EXEDIR=bin
FLAGS=-lm -g -O4

all: bspinfo_ light_ modelgen_ qbsp_ qcc_ qfiles_ qlumpy_ sprgen_ texmake_ vis_

bspinfo_:
	mkdir -p $(EXEDIR)
	$(CXX) $(FLAGS) $(INCLUDES) -o $(EXEDIR)/bspinfo common/bspfile.c bspinfo/bspinfo.c common/cmdlib.c

light_:
	mkdir -p $(EXEDIR)
	$(CXX) $(FLAGS) $(INCLUDES) -o $(EXEDIR)/light common/trilib.c light/threads.c common/mathlib.c light/light.c light/entities.c common/bspfile.c light/ltface.c common/cmdlib.c light/trace.c

modelgen_:
	mkdir -p $(EXEDIR)
	$(CXX) $(FLAGS) $(INCLUDES) -o $(EXEDIR)/modelgen common/mathlib.c common/cmdlib.c common/lbmlib.c common/trilib.c common/scriplib.c modelgen/modelgen.c

qbsp_:
	mkdir -p $(EXEDIR)
	$(CXX) $(FLAGS) $(INCLUDES) -o $(EXEDIR)/qbsp common/mathlib.c qbsp/solidbsp.c qbsp/portals.c qbsp/surfaces.c qbsp/nodraw.c common/cmdlib.c qbsp/csg4.c qbsp/brush.c qbsp/merge.c qbsp/map.c qbsp/region.c common/bspfile.c qbsp/writebsp.c qbsp/outside.c qbsp/qbsp.c qbsp/tjunc.c

qcc_:
	mkdir -p $(EXEDIR)
	$(CXX) $(FLAGS) $(INCLUDES) -o $(EXEDIR)/qcc qcc/pr_lex.c qcc/qcc.c common/cmdlib.c qcc/pr_comp.c

qfiles_:
	mkdir -p $(EXEDIR)
	$(CXX) $(FLAGS) $(INCLUDES) -o $(EXEDIR)/qfiles qfiles/qfiles.c common/cmdlib.c

qlumpy_:
	mkdir -p $(EXEDIR)
	$(CXX) $(FLAGS) $(INCLUDES) -o $(EXEDIR)/qlumpy qlumpy/quakegrb.c qlumpy/qlumpy.c common/wadlib.c common/scriplib.c common/cmdlib.c common/lbmlib.c

sprgen_:
	mkdir -p $(EXEDIR)
	$(CXX) $(FLAGS) $(INCLUDES) -o $(EXEDIR)/sprgen common/scriplib.c sprgen/sprgen.c common/cmdlib.c common/lbmlib.c

texmake_:
	mkdir -p $(EXEDIR)
	$(CXX) $(FLAGS) $(INCLUDES) -o $(EXEDIR)/texmake common/mathlib.c common/cmdlib.c common/lbmlib.c common/trilib.c texmake/texmake.c

vis_:
	mkdir -p $(EXEDIR)
	$(CXX) $(FLAGS) $(INCLUDES) -o $(EXEDIR)/vis vis/soundpvs.c vis/vis.c common/bspfile.c vis/flow.c common/cmdlib.c common/mathlib.c

clean:
	rm -rf $(EXEDIR)
