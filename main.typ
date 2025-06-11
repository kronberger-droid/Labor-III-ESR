#import "lab-report.typ": lab-report
#import "@preview/lilaq:0.3.0" as lq
#import calc: ln, round, sqrt
#import "lib.typ": linear_fit

#show: lab-report.with(
  title: "Electron Spin Resonance",
  authors: ("Raul Wagner", "Martin Kronberger"),
  supervisor: "Victor Lindenbauer",
  groupnumber: "301",
  date: datetime(day: 4, month: 6, year: 2025),
)

#set heading(numbering: "1.1")

#set math.equation(numbering: "(1)")

= Resonanceabsorbtion of a passive HF-Osscilator

== Fundamentals

To detect electron spin resonance (ESR) in DPPH, the DPPH sample is placed in an RF coil that is part of a resonant circuit with  high quality factor . This circuit is excited by a variable-frequency RF oscillator operating between 15 and 130 MHz.

When the resonance condition for ESR is met at a frequency $ν_0$​, the DPPH sample absorbs energy, which loads the resonant circuit. As a result, the AC resistance increases, and the voltage across the RF coil decreases.

To detect this change, a passive resonant circuit is used for comparison. Its coil is placed coaxially opposite the empty RF coil. The resonance frequency of the passive circuit is given by:
$
  nu_0 = 1/(2 pi dot L_2 C_2)
$
Where $L_2$ and $C_2$ are the inductance and capacitance of the oscillation circuit.
The resonance frequency of the circuit can be adjusted by changing the capacitance $C_2$​.

When the active circuit is driven at its resonance frequency $ν_0$, it is dampened, and the voltage $U_1$​ across the RF coil decreases.
The ESR signal is detected by measuring the rectified voltage $U_1$, which corresponds to the current $I_1$​ through a measurement resistor $R_1=56" k"Omega$:
$
  U_1​= 56 "k"Omega dot I_1​
$
== Setup

#figure(
  image(width: 8cm, "assets/experimental_setup_1.png"),
  caption: [Experimental setup],
)

- Connect the ESR base unit to the ESR operating unit via a 6-pin cable and set the rotary potentiometer on the top left to maximum sensitivity.
- Plug in the 13-30 MHz plug-in coil (large).
- Due to a bad connection of the measurement cable of $I_1$ the current and voltage of the active circuit could not be measured.
- Position the coil of the passive resonant circuit coaxially opposite of the active coil and connect via a BNC/4 mm measurement cable to channel I of the dual-channel oscilloscope.

== Procedure

- Set the variable capacitor of the passive resonant circuit to position Skt. = 3/6.
- Adjust the minimum frequency on the ESR base unit.
- At the operating frequency, measure and record:
  - the frequency,
  - the voltage $U_2$ of the “passive” coil on the oscilloscope,
- Increase the frequency in steps and repeat the measurement.
- Perform additional measurement series with Skt. = 2/6 and 1/6.
- A measurement without the passive circuit could also not be done due to the bad connection of the active circuit cable.

== Measurement values

#let data_3_6 = (
  //(freq, U2),
  (11.5, 1.00),
  (12.0, 1.01),
  (12.5, 1.15),
  (13.0, 1.20),
  (13.5, 1.40),
  (14.0, 1.60),
  (14.5, 1.80),
  (15.0, 2.20),
  (15.5, 2.35),
  (16.0, 2.20),
  (16.5, 2.00),
  (17.0, 1.80),
  (17.5, 1.25),
  (18.0, 1.00),
  (18.5, 0.80),
  (19.0, 0.70),
)

#let data_2_6 = (
  (11.5, 0.80),
  (12.5, 0.85),
  (13.5, 0.90),
  (14.5, 0.97),
  (15.5, 1.05),
  (16.5, 1.20),
  (17.0, 1.30),
  (17.5, 1.40),
  (18.0, 1.50),
  (18.5, 1.60),
  (19.0, 1.70),
  (19.5, 1.60),
  (20.0, 1.50),
  (20.5, 1.35),
  (21.0, 0.95),
  (21.5, 0.80),
)

#let data_1_6 = (
  (18.0, 0.75),
  (19.0, 0.80),
  (20.0, 0.85),
  (21.0, 0.90),
  (22.0, 0.95),
  (23.0, 1.00),
  (23.5, 1.05),
  (24.0, 1.10),
  (24.5, 1.15),
  (25.0, 1.10),
  (25.5, 1.05),
  (26.0, 1.00),
  (26.5, 0.95),
  (27.0, 0.90),
  (27.5, 0.80),
)

#let draw_table(data, caption) = {
  let mid = int(round(data.len() / 2))
  let table_data = data.slice(mid).zip(data.slice(-mid))

  align(center)[
    #figure(caption: [#caption], table(
      columns: 4,
      align: center,
      stroke: 0.8pt,
      table.header([$nu$ / MHz], [$U_2$ / V], [$nu$ / MHz], [$U_2$ / V]),
      ..for (.., (v, u2), (cont_v, cont_u2)) in table_data {
        ([#v], [#u2], [#cont_v], [#cont_u2])
      },
    ))
  ]
}

#grid(
  columns: (1fr, 1fr),
  column-gutter: 0.5cm,
  [#draw_table(data_3_6, [Voltage $U_2$ at Skt. = 3/6])],
  [#draw_table(data_2_6, [Voltage $U_2$ at Skt. = 2/6])],
)

#draw_table(data_1_6, [Voltage $U_2$ at Skt. = 1/6])

#show lq.selector(lq.legend): set text(1em)
#show lq.selector(lq.title): set text(1.5em)

#let get_freq(data) = {
  data.map(x => x.at(0))
}

#let get_volt(data) = {
  data.map(x => x.at(1))
}

#figure(
  caption: [The resonance frequencies $mu_n$ can be determined by measuring voltage peaks in the passive coil voltage $U_2(f)$. The measurement apparatus for the current through the active coil was broken. Thus, the active voltage $U_1(f)$ couldn't be determined. It would usually correspond to a damped oscillation thus creating corresponding local minima in $U_1$ at the same resonace frequencies],

  lq.diagram(
    width: 12cm,
    height: 8cm,
    title: [],
    ylabel: [Passive coil voltage $U_2$ in V],
    xlabel: [Frequency $f$ in Hz],
    lq.plot(
      color: blue,
      mark: lq.marks.o,
      label: [Skt. = 3/6],
      get_freq(data_3_6),
      get_volt(data_3_6),
    ),
    lq.plot(
      color: orange,
      mark: lq.marks.o,
      label: [Skt. = 2/6],
      get_freq(data_2_6),
      get_volt(data_2_6),
    ),
    lq.plot(
      color: purple,
      mark: lq.marks.o,
      label: [Skt. = 1/6],
      freq_1_6,
      U2_1_6,
    ),
    lq.line(
      (
        get_freq(data_3_6).at(get_volt(data_3_6).position(x => (
          x == calc.max(..get_volt(data_3_6))
        ))),
        0.6,
      ),
      (
        get_freq(data_3_6).at(get_volt(data_3_6).position(x => (
          x == calc.max(..get_volt(data_3_6))
        ))),
        2.6,
      ),
    ),
    lq.place(30%, 10%, $f_1$),
    lq.line(
      (
        get_freq(data_2_6).at(get_volt(data_2_6).position(x => (
          x == calc.max(..get_volt(data_2_6))
        ))),
        0.6,
      ),
      (
        get_freq(data_2_6).at(get_volt(data_2_6).position(x => (
          x == calc.max(..get_volt(data_2_6))
        ))),
        2.6,
      ),
    ),
    lq.place(50%, 30%, $f_2$),
    lq.line(
      (freq_1_6.at(U2_1_6.position(x => x == calc.max(..U2_1_6))), 0.6),
      (freq_1_6.at(U2_1_6.position(x => x == calc.max(..U2_1_6))), 2.6),
    ),
    lq.place(80%, 60%, $f_3$),
  ),
)


#pagebreak()

= Electronspinresonance on DPPH

== Fundamentals
Electron spin resonance (ESR) detects transitions between spin states of unpaired electrons in a magnetic field $B_0$​. The energy levels split due to the Zeeman effect, and when electromagnetic radiation of the right frequency νν is applied, resonant absorption occurs.

This resonance condition is:
$
  h ν = g mu_B B_0
$

Where $h$ is the planks constant, $nu$ is the radiation frequency, $g$ is the lande g-factor, $mu_B$ the Bohr magneton and $B_0$ the static magnetic field.get_freq()data_2_6
From this, the magnetic field $B_0$​ can be calculated using:
$
  B_0 = h nu g μ_B
$

For a free electron: $g = 2.0023$

Spin quantum number: $J=s=1/2$

ESR transition: $Delta m = J = plus.minus 1$

The ESR line width $Delta B_0$ relates to level lifetime $Tau$ via the uncertainty relation:
$
  Delta B_0 = 12 g μ_B Tau
$

=== Experiment:

DPPH is used as a stable free radical sample with $g approx 2.003$.
The magnetic field is generated by Helmholtz coils and modulated at 50 Hz.
A high-Q RF resonant circuit detects the absorption via a drop in voltage when resonance occurs.

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

- Insert the 30-75 MHz plug-in coil (medium) and place the DPPH sample in the coil.
- Switch on the ESR base unit and position it so that the plug-in coil with DPPH sample is in the center of the Helmholtz-coil pair (see Fig. 4).
- Set the resonance frequency $nu = 30 "MHz"$.
- Set the modulation amplitude $U_"mod"$ to the second scale division.
- Set the phase shift to $0°$.
- Operate the oscilloscope in dual-channel mode:
  - Dual on
  - Time base $2"ms"/"cm"$
  - Amplitude I and II $0.5 "V"/"mm"$ AC
- Slowly increase the DC voltage $U_0$ to the Helmholtz coils until the resonance signals are equidistant (see Fig. 6).
- Switch the oscilloscope to XY mode and adjust the phase shift so that the two resonance peaks coincide.
- Vary $U_0$ until the resonance signal is symmetric, keeping the modulation voltage as low as possible.
- Measure the DC current $2 I_0$ through the Helmholtz-coil pair and record it together with the resonance frequency $nu$.
- Increase $nu$ by $5 "MHz"$ and adjust $U_0$ to reestablish resonance.
- Again measure and record the current $2 I_0$.
- Continue raising $nu$ in 5 MHz steps (switch to the 75-130 MHz coil (small) at 75 MHz) and repeat the measurements.

*Determination of the Half-Width $delta B_0$*
- Operate the oscilloscope in XY mode:
  - Amplitude II $0.05 "V"/"mm" "AC"$
- Reestablish the resonance condition for $nu = 50 "MHz"$ (medium plug-in coil).
- Vary the modulation voltage $U_"mod"$ until the resonance trace spans the full screen width (10 cm) in the X-direction.
- Switch the ammeter to AC mode and measure the effective current $2 I_"mod"$ corresponding to $U_"mod"$.
- Increase the X-deflection, read off the width $Delta U$ of the resonance peak at half its height, and record it.


== Measurement values

#let freq_I2 = (
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
  80,
  80,
  90,
  95,
  100,
  105,
  110,
  115,
  120,
)

#let I2 = (
  0.53,
  0.63,
  0.71,
  0.79,
  0.89,
  0.97,
  1.06,
  1.15,
  1.23,
  1.33,
  1.41,
  1.53,
  1.65,
  1.67,
  1.70,
  1.74,
  1.79,
  2.05,
  2.16,
)

#let Coil = (
  "middle",
  "middle",
  "middle",
  "middle",
  "middle",
  "middle",
  "middle",
  "middle",
  "middle",
  "middle",
  "middle",
  "small",
  "small",
  "small",
  "small",
  "small",
  "small",
  "small",
  "small",
)

#align(center)[
  #figure(
    caption: [Current $2 I_0$ as a function of frequency $ν$ of the magnetic field],
    table(
      columns: (3cm, 3cm, 3cm),
      align: (center, center, center),
      stroke: 0.8pt,
      table.header([ν / MHz], [2 I₀ / A], [Plug-in coil]),
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
    caption: [Magnetic field $B_0$ as a function of  frequency $ν$ of the magnetic field],
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

#figure(
  caption: [Resonance frequency as a function of the magnetic field for DPPH],
  lq.diagram(
    width: 10cm,
    height: 6cm,
    lq.plot(color: blue, mark-size: 6pt, stroke: none, B0, freq_B0),

    lq.plot(
      color: blue,
      mark: none,
      stroke: 1.2pt,
      lq.linspace(B0.first(), B0.last()),
      lq
        .linspace(B0.first(), B0.last())
        .map(x => x * lin_fit.first() + lin_fit.last()),
    ),
  ),
)

#let delta_U = 1.9 * 0.5 // in cm * V/cm

#let U_mod = 10 * 0.5 // in cm * V/cm

#let I_mod_2 = 0.29 // in A

#let delta_I = delta_U / U_mod * I_mod_2 / 2 * 2 * sqrt(2)

#let factor = 4

#let delta_B0 = delta_I

Measured Half-Width $delta U$:

$delta U = #delta_U "V"$

With
$
  delta I = (delta U) / U_mod dot I_mod
$
calculated Half-Width $delta I = #round(delta_I, digits: 3) "A"$

With
$
  delta B_0 = 4.23 "mT" dot delta I
$
calculated $delta B_0 = #round(delta_I * 4.23, digits: 2) "mT"$

Slope: #round(lin_fit.first(), digits: 2) $"MHz"/"mT"$

#let gfactor = (6.625e-34 / 9.273e-24 * lin_fit.first() * 1e9)

In experiment determined g-factor:

$g = #round(gfactor, digits: 4)$

g-factor from literature:

$g = 2,0036$

Despite a deviation from linearity in the higher frequency range, a linear relationship between resonance frequency and magnetic field strength is observed.
Furthermore, the measured g-factor is in sufficient agreement with the literature value.


== Error Estimation

Since the voltage values were read from a oscilloscope, the error of these values is $plus.minus 0.1 space "V"$. Since the Current was measured by an amperemeter, the error for the current is $plus.minus 0.01 space "A"$.

Fehler!
