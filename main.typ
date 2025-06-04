#import "lab-report.typ": lab-report
#import "@preview/lilaq:0.3.0" as lq
#import calc: ln, round
#import "lib.typ": linear_fit

#show: lab-report.with(
  title: "Electron Spin Resonance",
  authors: ("Raul Wagner", "Martin Kronberger"),
  supervisor: "Someone",
  groupnumber: "301",
  date: datetime(day: 4, month: 6, year: 2025),
)

#set heading(numbering: "1.1")

= Resonanceabsorbtion of a passive HF-Osscilator

== Setup

#figure(
  image(width: 8cm, "assets/experimental_setup_1.png"),
  caption: [Experimental setup],
)

- Connect the ESR base unit to the ESR operating unit via a 6-pin cable and set the rotary potentiometer to maximum sensitivity.
- Plug in the 30–75 MHz plug-in coil and connect the ammeter to output I via an adapter cable (measurement range 100 µA).
- Position the coil of the passive resonant circuit coaxially opposite the plug-in coil and connect via a BNC/4 mm measurement cable to channel I of the dual-channel oscilloscope.

== Procedure

- Set the variable capacitor of the passive resonant circuit to position Skt. = 3/6.
- Adjust the minimum frequency on the ESR base unit.
- At the operating frequency, measure and record:
  - the frequency,
  - the voltage $U_2$ of the “passive” coil on the oscilloscope,
  - and the voltage $U_1 = 56 "k"Omega dot I_1$ of the RF coil.
- Increase the frequency stepwise and repeat the measurement.
- Perform additional measurement series with Skt. = 2/6 and 1/6.
- Remove the passive resonant circuit and record another measurement series.

== Measurement values

#let freq_3_6 = (
  11.5,
  12.0,
  12.5,
  13.0,
  13.5,
  14.0,
  14.5,
  15.0,
  15.5,
  16.0,
  16.5,
  17.0,
  17.5,
  18.0,
  18.5,
  19.0,
)

#let U2_3_6 = (
  1.00,
  1.01,
  1.15,
  1.20,
  1.40,
  1.60,
  1.80,
  2.20,
  2.35,
  2.20,
  2.00,
  1.80,
  1.25,
  1.00,
  0.80,
  0.70,
)

#align(center)[
  #figure(caption: [Tab. 1: Spannungen $U_2$ und $U_1$ bei Skt. = 3/6], table(
    columns: (3cm, 3cm),
    align: (center, center, center),
    stroke: 0.8pt,
    table.header([freq / MHz], [U₂ / V]),
    ..for (.., v, u2) in freq_3_6.zip(U2_3_6) {
      ([#v], [#u2])
    },
  ))
]



#let freq_2_6 = (
  11.5,
  12.5,
  13.5,
  14.5,
  15.5,
  16.5,
  17.0,
  17.5,
  18.0,
  18.5,
  19.0,
  19.5,
  20.0,
  20.5,
  21.0,
  21.5,
)

#let U2_2_6 = (
  0.80,
  0.85,
  0.90,
  0.97,
  1.05,
  1.20,
  1.30,
  1.40,
  1.50,
  1.60,
  1.70,
  1.60,
  1.50,
  1.35,
  0.95,
  0.8,
)

#align(center)[
  #figure(caption: [Tab. 2: Spannungen $U_2$ und $U_1$ bei Skt. = 2/6], table(
    columns: (3cm, 3cm),
    align: (center, center, center),
    stroke: 0.8pt,
    table.header([freq / MHz], [U₂ / V]),
    ..for (.., v, u2) in freq_2_6.zip(U2_2_6) {
      ([#v], [#u2])
    },
  ))
]



#let freq_1_6 = (
  18.0,
  19.0,
  20.0,
  21.0,
  22.0,
  23.0,
  23.5,
  24.0,
  24.5,
  25.0,
  25.5,
  26.0,
  26.5,
  27.0,
  27.5,
)

#let U2_1_6 = (
  0.75,
  0.80,
  0.85,
  0.90,
  0.95,
  1.00,
  1.05,
  1.10,
  1.15,
  1.10,
  1.05,
  1.00,
  0.95,
  0.90,
  0.80,
)

#align(center)[
  #figure(caption: [Tab. 3: Spannungen $U_2$ und $U_1$ bei Skt. = 1/6], table(
    columns: (3cm, 3cm),
    align: (center, center, center),
    stroke: 0.8pt,
    table.header([freq / MHz], [U₂ / V]),
    ..for (.., v, u2) in freq_1_6.zip(U2_1_6) {
      ([#v], [#u2])
    },
  ))
]

Es konnte ebenso die Messreihe mit keinem passiven nicht durchgeführt werden!

#figure(lq.diagram(
  width: 12cm,
  height: 8cm,
  lq.plot(color: blue, mark: lq.marks.o, freq_3_6, U2_3_6),
  lq.plot(color: orange, mark: lq.marks.o, freq_2_6, U2_2_6),
  lq.plot(color: purple, mark: lq.marks.o, freq_1_6, U2_1_6),
))

== Data

#pagebreak()

= Electronspinresonance on DPPH

== Setup

#grid(
  columns: (1fr, 1fr),
  align: horizon,
  figure(
    image(width: 8cm, "assets/experimental_setup_2.png"),
    caption: [Experimental setup],
  ),
  figure(
    image(width: 4cm, "assets/experimental_setup_3.png"),
    caption: [Experimental setup],
  ),
)

The experimental setup is shown in Fig. 4 and 5.

- Place the Helmholtz coils parallel to each other at a center distance of 6.8 cm (equal to the mean radius $r$).
- Connect both Helmholtz coils in series with the ammeter to the ESR operating unit.
- Connect the ESR base unit to the ESR operating unit via a 6-pin cable.
- Connect output Y of the ESR operating unit via a BNC cable to channel I of the dual-channel oscilloscope, and output X to channel II.

== Procedure

*Determination of the Resonance Magnetic Field $B_0$*
- Insert the 15–30 MHz plug-in coil and place the DPPH sample centrally.
- Switch on the ESR base unit and position it so that the plug-in coil with DPPH sample is in the center of the Helmholtz-coil pair (see Fig. 5).
- Set the resonance frequency $nu = 15 "MHz"$.
- Set the modulation amplitude $U_"mod"$ to the second scale division.
- Set the phase shift to $0°$.
- Operate the oscilloscope in dual-channel mode:
  - Dual on
  - Time base $2 "ms"/"cm"$
  - Amplitude I and II $0.5 "V"/"cm" "AC"$
- Slowly increase the DC voltage $U_0$ to the Helmholtz coils until the resonance signals are equidistant (see Fig. 6).
- Switch the oscilloscope to XY mode and adjust the phase shift so that the two resonance peaks coincide (see Fig. 3).
- Vary $U_0$ until the resonance signal is symmetric, keeping the modulation voltage as low as possible.
- Measure the DC current $2 I_0$ through the Helmholtz-coil pair and record it together with the resonance frequency $nu$.
- Increase $nu$ by $5 "MHz"$ and adjust $U_0$ to reestablish resonance.
- Again measure and record the current $2 I_0$.
- Continue raising $nu$ in 5 MHz steps (switch to the 30–75 MHz coil at 30 MHz, and to the 75–130 MHz coil at 75 MHz) and repeat the measurements.

*Determination of the Half-Width $delta B_0$*
- Operate the oscilloscope in XY mode:
  - Amplitude II $0.5 "V"/"cm" "AC"$
- Reestablish the resonance condition for $nu = 50 "MHz"$ (middle plug-in coil).
- Vary the modulation voltage $U_"mod"$ until the resonance trace spans the full screen width (10 cm) in the X-direction.
- Switch the ammeter to AC mode and measure the effective current $2 I_"mod"$ corresponding to $U_"mod"$.
- Increase the X-deflection, read off the width $Delta U$ of the resonance peak at half its height, and record it.


== Measurement values

#let freq_I2 = (
  15,
  20,
  25,
  30,
  30,
  35,
  40,
  45,
  50,
  55,
  60,
  65,
  70,
  75,
  75,
  80,
  85,
  90,
  95,
  100,
  105,
  110,
  115,
  120,
  125,
  130,
)
#let I2 = (
  0.26,
  0.35,
  0.44,
  0.51,
  0.51,
  0.60,
  0.69,
  0.77,
  0.86,
  0.94,
  1.00,
  1.10,
  1.20,
  1.30,
  1.30,
  1.35,
  1.45,
  1.55,
  1.60,
  1.70,
  1.80,
  1.90,
  1.95,
  2.00,
  2.10,
  2.20,
)
#let Coil = (
  "klein",
  "klein",
  "klein",
  "klein",
  "mittel",
  "mittel",
  "mittel",
  "mittel",
  "mittel",
  "mittel",
  "mittel",
  "mittel",
  "mittel",
  "mittel",
  "groß",
  "groß",
  "groß",
  "groß",
  "groß",
  "groß",
  "groß",
  "groß",
  "groß",
  "groß",
  "groß",
  "groß",
)

#align(center)[
  #figure(
    caption: [Tab. 1: Stromstärke $2 I_0$ in Abhängigkeit von der Frequenz $ν$ des Wechselfeldes],
    table(
      columns: (3cm, 3cm, 3cm),
      align: (center, center, center),
      stroke: 0.8pt,
      table.header([ν / MHz], [2 I₀ / A], [Steckspule]),
      ..for (.., (v, i2), coil) in freq_I2.zip(I2).zip(Coil) {
        ([#v], [#i2], [#coil])
      },
    ),
  )
]

#let freq_B0 = freq_I2
#let B0 = I2.map(I => 4.23 * I / 2)

#align(center)[
  #figure(
    caption: [Tab. 2: Magnetfeld $B_0$ in Abhängigkeit von der Frequenz $ν$ des Wechselfeldes],
    table(
      columns: (3cm, 3cm),
      align: (center, center),
      stroke: 0.8pt,
      table.header([ν / MHz], [B₀ / mT]),
      ..for (.., v, b0) in freq_B0.zip(B0) {
        ([#v], [#round(b0, digits: 2)])
      },
    ),
  )
]

#let lin_fit = linear_fit(B0, freq_B0)

#figure(caption: [Some Caption], lq.diagram(
  width: 10cm,
  height: 6cm,
  lq.plot(color: blue, mark-size: 6pt, stroke: none, B0, freq_B0),

  lq.plot(color: blue, mark: none, stroke: 1.2pt, lq.linspace(0.5, 4.7), lq
    .linspace(0.5, 4.7)
    .map(x => x * lin_fit.first() + lin_fit.last())),
))

Slope: #round(lin_fit.first(), digits: 2) $"MHz"/"mT"$



#let gfactor = (6.625e-34 / 9.273e-24 * lin_fit.first() * 1e9)

Gfactor:

$g = #round(gfactor, digits: 4)$

from literature:
$g = 2,0036$
== Data
