#import "lab-report.typ": lab-report
#import "@preview/lilaq:0.3.0" as lq
#import calc: ln, round

#show: lab-report.with(
  title: "Röntgen",
  authors: ("Raul Wagner", "Martin Kronberger"),
  supervisor: "Someone",
  groupnumber: "301",
  date: datetime(day: 21, month: 5, year: 2025),
)

#set heading(numbering: "1.1")
