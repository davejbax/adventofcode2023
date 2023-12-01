# Advent of Code 2023: Terraform edition

[AOC 2023](https://adventofcode.com/2023/) using nothing but good ol' Terraform. Declarative languages all the way!

## Rules

* No using `local-exec` or similar shortcuts
* Resources are permissible as long as they don't solve the problem in a straightforward way: e.g. creating an AWS Lambda to run a Python script is _not_ allowed. Any resource usage should generally look like a misuse of that resource.

## Running

For now, it's as simple as a `terraform init` and a `terraform apply`:

```
cd day1
terraform init
terraform apply
# [...]
# Outputs:
# part1 = <some answer>
# part2 = <some answer>
```
