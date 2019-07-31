INCLUDES = -Icommon
BINDIR = bin
CFLAGS = -O1
LDFLAGS = -lm

ifdef DEBUG
	CFLAGS += -g -ggdb
endif

all: prepare_ bspinfo_ light_ modelgen_ qbsp_ qcc_ qfiles_ qlumpy_ sprgen_ texmake_ vis_

prepare_:
	mkdir -p $(BINDIR)

bspinfo_:
	$(CC) $(CFLAGS) $(LDFLAGS) $(INCLUDES) -o $(BINDIR)/bspinfo common/bspfile.c bspinfo/bspinfo.c common/cmdlib.c

light_:
	$(CC) $(CFLAGS) $(LDFLAGS) $(INCLUDES) -o $(BINDIR)/light common/trilib.c light/threads.c common/mathlib.c light/light.c light/entities.c common/bspfile.c light/ltface.c common/cmdlib.c light/trace.c

modelgen_:
	$(CC) $(CFLAGS) $(LDFLAGS) $(INCLUDES) -o $(BINDIR)/modelgen common/mathlib.c common/cmdlib.c common/lbmlib.c common/trilib.c common/scriplib.c modelgen/modelgen.c

qbsp_:
	$(CC) $(CFLAGS) $(LDFLAGS) $(INCLUDES) -o $(BINDIR)/qbsp common/mathlib.c qbsp/solidbsp.c qbsp/portals.c qbsp/surfaces.c qbsp/nodraw.c common/cmdlib.c qbsp/csg4.c qbsp/brush.c qbsp/merge.c qbsp/map.c qbsp/region.c common/bspfile.c qbsp/writebsp.c qbsp/outside.c qbsp/qbsp.c qbsp/tjunc.c

qcc_:
	$(CC) $(CFLAGS) $(LDFLAGS) $(INCLUDES) -o $(BINDIR)/qcc qcc/pr_lex.c qcc/qcc.c common/cmdlib.c qcc/pr_comp.c

qfiles_:
	$(CC) $(CFLAGS) $(LDFLAGS) $(INCLUDES) -o $(BINDIR)/qfiles qfiles/qfiles.c common/cmdlib.c

qlumpy_:
	$(CC) $(CFLAGS) $(LDFLAGS) $(INCLUDES) -o $(BINDIR)/qlumpy qlumpy/quakegrb.c qlumpy/qlumpy.c common/wadlib.c common/scriplib.c common/cmdlib.c common/lbmlib.c

sprgen_:
	$(CC) $(CFLAGS) $(LDFLAGS) $(INCLUDES) -o $(BINDIR)/sprgen common/scriplib.c sprgen/sprgen.c common/cmdlib.c common/lbmlib.c

texmake_:
	$(CC) $(CFLAGS) $(LDFLAGS) $(INCLUDES) -o $(BINDIR)/texmake common/mathlib.c common/cmdlib.c common/lbmlib.c common/trilib.c texmake/texmake.c

vis_:
	$(CC) $(CFLAGS) $(LDFLAGS) $(INCLUDES) -o $(BINDIR)/vis vis/soundpvs.c vis/vis.c common/bspfile.c vis/flow.c common/cmdlib.c common/mathlib.c

clean:
	rm -rf $(BINDIR)
