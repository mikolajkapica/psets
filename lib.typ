#let problem = counter("problem")
#let problem-heading = regex("Problem(?: (\\d+))?")
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
    context line(length: 100%)
    context text(weight: "bold", [Problem #problem.display()])
  }
  it
}
