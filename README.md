# `processing` + `anu`

heavily based-on Kindohm's [june8z](https://github.com/kindohm/june8z), with some modifications here and there.

purposely for [`anu`](https://github.com/karnpapon/anu)'s presentation at [Creative Coding](https://creatorsgarten.org/events/creativecodingmeetup) meetup by [Creatorgartens](https://creatorsgarten.org).

## usage

- this meant to be used in VSCode with an [extension](https://github.com/AvinZarlez/processing-vscode), since Processing IDE is a bit clunky to work with.
- `Cmd + B` to run.
- osc listen on port 5000
- osc path = `/proc_osc`
- accepted arguments = `(float hit, float a, float b, float c, float d, float e, float fade, float red, float green, float blue)`
  - eg. `~processing.sendMsg("/proc_osc",0.0,1.0.rand,"texts",0.1,1.0.rand,1.0.rand,1.0.rand,1.0.rand,1.0.rand,1.0,1.0,1.0);` in SuperCollider see [this](https://github.com/karnpapon/anu/blob/app/sc-osc-example.scd) for an example.
