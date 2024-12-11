<div align="center">

# 🎄 Advent of Code

My solutions for the AoC

</div>

- [2015](./2015) - [Crystal](https://crystal-lang.org/)
- [2023](./2023) - [Bash](https://www.gnu.org/software/bash/)
- [2024](./2024) - [Umbra](https://github.com/pmqueiroz/umbra)

## Architecture

Each `year` should match this convention:

```
[year]/
├── [day]
└── template/
    ├── part-one.[ext]
    └── part-two.[ext]
```

Note that `year` and `day` should be a numeric folder without leading zeroes, eg.: `2024`/`25`

## Generate

Use the `generate.sh` script to create a new day from template, the script asks the `year`
and the `day` thats by default is the current year and the highest solved puzzle to that year
plus one

```sh
./generate.sh
```

To run straightly with the default pass the argument `y`

```sh
./generate.sh y
```
