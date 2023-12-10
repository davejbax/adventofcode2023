locals {

  input       = file("input.txt")
  input_lines = split("\n", trimspace(local.input))

  grid_height = length(local.input_lines)
  grid_width  = length(local.input_lines[0])

  # N.B. range() has a limit of 1024, so range(w*h) doesn't work
  grid_cell_coords = [for v in setproduct(range(local.grid_width), range(local.grid_height)) : "${v[0]}x${v[1]}"]

  adjacent_numbers = [for coord in toset(local.grid_cell_coords) : module.cell[coord].number if module.cell[coord].adjacent_to_symbol]

}

module "cell" {
  for_each = toset(local.grid_cell_coords)
  source   = "./cell"

  left = try(substr(local.input_lines[split("x", each.key)[1]], split("x", each.key)[0] - 1, 1), ".")
  text = try(substr(local.input_lines[split("x", each.key)[1]], split("x", each.key)[0], -1), ".")
  grid = local.input_lines

  x = split("x", each.key)[0]
  y = split("x", each.key)[1]
}

output "part1" {
  value = sum(local.adjacent_numbers)
}