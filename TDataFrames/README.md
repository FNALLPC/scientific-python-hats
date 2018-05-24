# TDataFrames Tutorial

ROOT's
[TDataFrame](https://root.cern.ch/doc/v612/classROOT_1_1Experimental_1_1TDataFrame.html)
offers a high level interface for analyses of data stored in TTrees.

In addition, multi-threading and other low-level optimisations allow users to
exploit all the resources available on their machines completely transparently.

In a nutshell:

```c++
ROOT::EnableImplicitMT(); // Tell ROOT you want to go parallel
ROOT::Experimental::TDataFrame d("myTree", "file.root"); // Interface to TTree and TChain
auto myHisto = d.Histo1D("Branch_A"); // This happens in parallel!
myHisto->Draw();
```

Calculations are expressed in terms of a type-safe functional chain of actions
and transformations, TDataFrame takes care of their execution. The
implementation automatically puts in place several low level optimisations such
as multi-thread parallelisation and caching. The namespace containing the
TDataFrame is ROOT::Experimental. This signals the fact that the interfaces may
evolve in time.
