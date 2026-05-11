#let problem = counter("problem")
#let problem-heading = regex("Zadanie(?: (\\d+))?")
#let styling = it => {
  show regex("(?i)Proof"): it => [_Proof:_]
  show regex("qed"): it => align(right, $square.filled$)
  show problem-heading: it => {
    let matched = it.text.match(problem-heading)
    let explicit = matched.captures.at(0)
    if explicit != none {
      problem.update(int(explicit))
    } else {
      problem.step()
    }
    // pagebreak()
    context line(length: 100%)
    context text(weight: "bold", [Zadanie #problem.display()])
  }
  it
}


#let note = it => box(stroke: 1pt, radius: 6pt, width: 100%, fill: color.silver)[
  #pad(8pt)[
    #it
  ]
]
