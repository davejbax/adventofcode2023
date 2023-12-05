locals {
  input       = file("input.txt")
  input_lines = split("\n", trimspace(local.input))

  reveals_raw = [
    for line in local.input_lines :
    regexall("[^:;]+", split(":", line)[1])
  ]
  reveals = [
    for game in local.reveals_raw :
    [
      for reveal_raw in game :
      {
        for reveal in regexall("(\\d+)\\s+([^,]+)", reveal_raw) :
        reveal[1] => reveal[0]
      }
    ]
  ]

  # Part 1

  color_counts = {
    red   = 12
    green = 13
    blue  = 14
  }

  game_is_legal = [
    for game in local.reveals :
    !anytrue([
      for reveal in game :
      anytrue([
        for color, amount in reveal :
        amount > local.color_counts[color]
      ])
    ])
  ]

  game_is_legal_numbers = [
    for num in range(length(local.game_is_legal)) :
    num + 1
    if local.game_is_legal[num]
  ]

  # Part 2

  game_powers = [
    for game in local.reveals :
    max([for reveal in game : try(reveal["red"], 0)]...)
    * max([for reveal in game : try(reveal["green"], 0)]...)
    * max([for reveal in game : try(reveal["blue"], 0)]...)
  ]
}

output "part1" {
  value = sum(local.game_is_legal_numbers)
}

output "part2" {
  value = sum(local.game_powers)
}

