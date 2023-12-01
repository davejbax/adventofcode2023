locals {
  input = file("input.txt")

  input_lines = split("\n", trimspace(local.input))

  numbers_1 = [
    for line in local.input_lines :
    # First digit and last digit on reverse string, concat'd
    # '+' doesn't work here, as that tries to add the digits!
    "${regex("(\\d)", line)[0]}${regex("(\\d)", strrev(line))[0]}"
  ]
  total_1 = sum(local.numbers_1)

  words_to_numbers = {
    "1" = 1,
    "one" = 1,
    "2" = 2,
    "two" = 2,
    "3" = 3,
    "three" = 3,
    "4" = 4,
    "four" = 4,
    "5" = 5,
    "five" = 5,
    "6" = 6,
    "six" = 6,
    "7" = 7,
    "seven" = 7,
    "8" = 8,
    "eight" = 8,
    "9" = 9,
    "nine" = 9,
  }
  numbers_or_words = [
    for line in local.input_lines :
    # First digit and last digit on reverse string, concat'd
    # '+' doesn't work here, as that tries to add the digits!
    [
      regex("(\\d|one|two|three|four|five|six|seven|eight|nine)", line)[0],
      regex("(\\d|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin)", strrev(line))[0],
    ]
  ]
  numbers_2 = [
    for number_or_word in local.numbers_or_words :
    "${local.words_to_numbers[number_or_word[0]]}${local.words_to_numbers[strrev(number_or_word[1])]}"
  ]
  total_2 = sum(local.numbers_2)
}

output "part1" {
  value = local.total_1
}

output "part2" {
  value = local.total_2
}
