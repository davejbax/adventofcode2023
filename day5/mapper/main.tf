variable "inputs" {
  type = any
}

variable "map" {
  type = list(list(number))
}

variable "mode" {
  type = string
  validation {
    condition     = contains(["pt1", "pt2"], var.mode)
    error_message = "Mode must be 'pt1' or 'pt2'"
  }
}

output "outputs" {
  value = var.mode == "pt1" ? local.part1_output : local.part2_output
}