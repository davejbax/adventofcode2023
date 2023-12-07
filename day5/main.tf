locals {

  input = file("input.txt")

  seeds = split(" ", regexall("seeds: (.*)\\n", local.input)[0][0])

  maps = [
    for raw_map in regexall("\\n(?:(?:\\d+\\s+){2}\\d+\n)+", local.input) :
    [
      for line in split("\n", trimspace(raw_map)) : split(" ", line)
    ]
  ]

  seeds_pt2 = regexall("(\\d+)\\s+(\\d+)(?:\\s+|$)", split("\n", local.input)[0])

  seed_sets = {
    pt1 = local.seeds
    pt2 = local.seeds_pt2
  }

}

module "seed_to_soil" {
  for_each = local.seed_sets
  source   = "./mapper"

  mode   = each.key
  inputs = each.value
  map    = local.maps[0]
}

module "soil_to_fertiliser" {
  for_each = local.seed_sets
  source   = "./mapper"

  mode   = each.key
  inputs = module.seed_to_soil[each.key].outputs
  map    = local.maps[1]
}

module "fertiliser_to_water" {
  for_each = local.seed_sets
  source   = "./mapper"

  mode   = each.key
  inputs = module.soil_to_fertiliser[each.key].outputs
  map    = local.maps[2]
}

module "water_to_light" {
  for_each = local.seed_sets
  source   = "./mapper"

  mode   = each.key
  inputs = module.fertiliser_to_water[each.key].outputs
  map    = local.maps[3]
}

module "light_to_temperature" {
  for_each = local.seed_sets
  source   = "./mapper"

  mode   = each.key
  inputs = module.water_to_light[each.key].outputs
  map    = local.maps[4]
}

module "temperature_to_humidity" {
  for_each = local.seed_sets
  source   = "./mapper"

  mode   = each.key
  inputs = module.light_to_temperature[each.key].outputs
  map    = local.maps[5]
}

module "humidity_to_location" {
  for_each = local.seed_sets
  source   = "./mapper"

  mode   = each.key
  inputs = module.temperature_to_humidity[each.key].outputs
  map    = local.maps[6]
}

output "part1" {
  value = min(module.humidity_to_location["pt1"].outputs...)
}