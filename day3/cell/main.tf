variable "left" {
  type        = string
  description = "Letter to the left"
}

variable "text" {
  type        = string
  description = "All text from the cell rightwards"
}

variable "grid" {
  type        = list(string)
  description = "The entire grid"
}

variable "x" {
  type        = number
  description = "X coordinate"
}

variable "y" {
  type        = number
  description = "Y coordinate"
}

locals {
  numbers = regexall("^\\d+", var.text)

  is_valid = length(regexall("\\d", var.left)) == 0 && length(local.numbers) > 0

  adjacent = local.is_valid ? [
    # Generates a set of adjacent coordinates, from (-1,-1) to (w+1,1)
    for i in setproduct(range(-1, length(local.numbers[0]) + 1), range(-1, 2)) :
    (
      # To make things simpler, ignore ourselves
      i[1] == 0 && i[0] >= 0 && i[0] < length(local.numbers[0])
      ? "."
      : try(substr(var.grid[var.y + i[1]], var.x + i[0], 1), ".")
    )
  ] : null

  adjacent_to_symbol = local.is_valid ? anytrue([
    for char in local.adjacent : (length(regexall("[^\\.0-9]", char)) > 0)
  ]) : null
}

output "number" {
  value = local.is_valid ? local.numbers[0] : null
}

output "adjacent_to_symbol" {
  value = local.is_valid ? local.adjacent_to_symbol : false
}

output "adjacent" {
  value = local.is_valid ? local.adjacent : null
}