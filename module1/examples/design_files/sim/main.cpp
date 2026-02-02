// Minimal C++ style file for Module 1 practice.
// (e.g. Verilator test or similar)
// Open with: cat main.cpp   or   less main.cpp

#include <iostream>
#include <verilated.h>
#include "Vcounter.h"

int main(int argc, char** argv) {
  Verilated::commandArgs(argc, argv);
  Vcounter* top = new Vcounter;
  // ... run simulation ...
  delete top;
  return 0;
}
