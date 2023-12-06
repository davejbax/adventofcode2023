variable "num" {
  type        = number
  description = "Number of lines to create"
}

output "locals" {
  value = join("\n", [
    for i in range(var.num) : "  copies_${i + 1} = [ for i, cards in local.copies_${i} : flatten([ for card in cards : local.originals[card - 1] ]) ]"
  ])
}

output "list" {
  value = join("\n", [for i in range(var.num + 1) : "    local.copies_${i},"])
}