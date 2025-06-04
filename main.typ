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
  22.1,
  22.3,
  22.5,
  22.7,
  22.9,
  23.1,
  23.3,
  23.5,
  24.0,
  24.5,
  25.0,
  25.5,
  26.0,
  27.0,
  28.0,
  29.0,
  30.0,
)

#let U2_3_6 = (
  1.17,
  1.25,
  1.30,
  1.29,
  1.25,
  1.11,
  0.93,
  0.76,
  0.48,
  0.32,
  0.25,
  0.19,
  0.15,
  0.09,
  0.07,
  0.05,
  0.03,
)

#let U1_3_6 = (
  2.48,
  2.31,
  1.90,
  1.75,
  1.59,
  2.34,
  2.67,
  2.86,
  3.10,
  3.25,
  3.34,
  3.37,
  3.43,
  3.54,
  3.67,
  3.75,
  3.83,
)

#align(center)[
  #figure(caption: [Tab. 1: Spannungen $U_2$ und $U_1$ bei Skt. = 3/6], table(
    columns: (3cm, 3cm, 3cm),
    align: (center, center, center),
    stroke: 0.8pt,
    table.header([freq / MHz], [U₂ / V], [U₁ / V]),
    ..for (.., (v, u2), u1) in freq_3_6.zip(U2_3_6).zip(U1_3_6) {
      ([#v], [#u2], [#u1])
    },
  ))
]



#let freq_2_6 = (
  22.5,
  23.0,
  23.5,
  24.0,
  24.2,
  24.4,
  24.6,
  24.8,
  25.0,
  25.2,
  25.5,
  25.7,
  25.9,
  26.1,
  26.3,
  26.5,
  27.0,
  27.5,
  28.0,
  29.0,
  30.0,
  31.0,
  32.0,
  33.0,
  34.0,
  35.0,
)
#let U2_2_6 = (
  0.49,
  0.55,
  0.64,
  0.79,
  0.87,
  0.96,
  1.08,
  1.15,
  1.20,
  1.19,
  1.15,
  1.10,
  1.02,
  0.88,
  0.76,
  0.64,
  0.45,
  0.34,
  0.27,
  0.17,
  0.12,
  0.09,
  0.06,
  0.05,
  0.04,
  0.04,
)
#let U1_2_6 = (
  2.97,
  3.01,
  3.04,
  3.02,
  2.97,
  2.84,
  2.72,
  2.36,
  1.89,
  1.49,
  1.53,
  2.01,
  2.37,
  2.72,
  2.93,
  3.08,
  3.33,
  3.43,
  3.54,
  3.67,
  3.72,
  3.82,
  3.91,
  3.96,
  4.04,
  4.05,
)

#align(center)[
  #figure(caption: [Tab. 2: Spannungen $U_2$ und $U_1$ bei Skt. = 2/6], table(
    columns: (3cm, 3cm, 3cm),
    align: (center, center, center),
    stroke: 0.8pt,
    table.header([freq / MHz], [U₂ / V], [U₁ / V]),
    ..for (.., (v, u2), u1) in freq_2_6.zip(U2_2_6).zip(U1_2_6) {
      ([#v], [#u2], [#u1])
    },
  ))
]



#let freq_1_6 = (
  23.0,
  24.0,
  25.0,
  26.0,
  27.0,
  28.0,
  29.0,
  30.0,
  31.0,
  31.5,
  32.0,
  32.5,
  32.7,
  32.9,
  33.1,
  33.3,
  33.5,
  34.0,
  34.2,
  34.4,
  34.6,
  34.8,
  35.0,
  35.5,
  36.0,
  36.5,
  37.5,
  38.5,
  39.5,
)
#let U2_1_6 = (
  0.28,
  0.28,
  0.28,
  0.28,
  0.29,
  0.31,
  0.34,
  0.39,
  0.48,
  0.54,
  0.64,
  0.77,
  0.83,
  0.88,
  0.91,
  0.91,
  0.89,
  0.86,
  0.85,
  0.80,
  0.76,
  0.67,
  0.60,
  0.46,
  0.36,
  0.30,
  0.22,
  0.15,
  0.12,
)
#let U1_1_6 = (
  3.10,
  3.23,
  3.32,
  3.42,
  3.52,
  3.60,
  3.68,
  3.71,
  3.70,
  3.70,
  3.60,
  3.32,
  3.10,
  2.79,
  2.36,
  1.79,
  1.44,
  1.47,
  2.04,
  2.59,
  2.82,
  3.14,
  3.36,
  3.70,
  3.86,
  3.99,
  4.14,
  4.26,
  4.30,
)

#align(center)[
  #figure(caption: [Tab. 3: Spannungen $U_2$ und $U_1$ bei Skt. = 1/6], table(
    columns: (3cm, 3cm, 3cm),
    align: (center, center, center),
    stroke: 0.8pt,
    table.header([freq / MHz], [U₂ / V], [U₁ / V]),
    ..for (.., (v, u2), u1) in freq_1_6.zip(U2_1_6).zip(U1_1_6) {
      ([#v], [#u2], [#u1])
    },
  ))
]



#let freq_no_reson = (22.2, 25.0, 30.0, 35.0, 40.0)
#let U1_no_reson = (3.14, 3.47, 3.92, 4.26, 4.48)

#align(center)[
  #figure(caption: [Tab. 4: Spannung $U_1$ ohne Resonanzabsorption], table(
    columns: (3cm, 3cm),
    align: (center, center),
    stroke: 0.8pt,
    table.header([freq / MHz], [U₁ / V]),
    ..for (.., freq, u1) in freq_no_reson.zip(U1_no_reson) {
      ([#freq], [#u1])
    },
  ))
]
#figure(lq.diagram(
  width: 12cm,
  height: 8cm,
  lq.plot(color: blue, mark: lq.marks.s, freq_3_6, U1_3_6),
  lq.plot(color: blue, mark: lq.marks.o, freq_3_6, U2_3_6),
  lq.plot(color: orange, mark: lq.marks.s, freq_2_6, U1_2_6),
  lq.plot(color: orange, mark: lq.marks.o, freq_2_6, U2_2_6),
  lq.plot(color: purple, mark: lq.marks.s, freq_1_6, U1_1_6),
  lq.plot(color: purple, mark: lq.marks.o, freq_1_6, U2_1_6),
  lq.plot(color: green, mark: lq.marks.s, freq_no_reson, U1_no_reson),
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
