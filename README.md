# `processing` + `anu`

heavily based-on Kindohm's [june8z](https://github.com/kindohm/june8z), with some modifications. purposely for [`anu`](https://github.com/karnpapon/anu)'s presentation

## usage

- osc listen on port 5000
- osc path = `/proc_osc`
- accepted arguments = `(float hit, float a, float b, float c, float d, float e, float fade, float red, float green, float blue)`
  - eg. `~processing.sendMsg("/proc_osc",0.0,1.0.rand,"texts",0.1,1.0.rand,1.0.rand,1.0.rand,1.0.rand,1.0.rand,1.0,1.0,1.0);` in SuperCollider see [this](https://github.com/karnpapon/anu/blob/app/sc-osc-example.scd) for an example.
