locals {
  part1_output = var.mode == "pt1" ? [
    for input in var.inputs :
    coalesce(
      one([
        for mapping in var.map : (mapping[0] - mapping[1] + input)
        if input >= mapping[1] && input < mapping[1] + mapping[2]
      ]),
      input
    )
  ] : null
}