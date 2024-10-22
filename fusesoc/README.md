# SOC_Design
Before perform following operations, fusesoc and iverilog should
be installed.
> pip3 install --upgrade --user fusesoc
> sudo apt install iverilog

## Scan cores
> fusesoc library add .

## Check core scan result
> fusesoc core list

## Run simulation
> fusesoc --verbose run --target=sim top

