# Elixir Nerves Workshop

## Installation

Mac

```elixir

brew update
brew install erlang
brew install elixir
brew install fwup squashfs coreutils

```

Linux & Windows Linux Subsystem

```elixir

sudo apt-get install ssh-askpass
sudo apt-get install squashfs-tools
sudo apt-get install git g++ libssl-dev libncurses5-dev bc m4 make unzip cmake

```

All Platforms

```elixir

mix local.hex
mix local.rebar

mix archive.install https://github.com/nerves-project/archives/raw/master/nerves_bootstrap.ez
mix local.nerves
```

## Basic App

```elixir

mix new hello

```

## Blinky RPi

```elixir

mix nerves.new rpi_blink
cd rpi_blink
MIX_TARGET=rpi3 mix deps.get
MIX_TARGET=rpi3 mix firmware
MIX_TARGET=rpi3 mix firmware.burn
```

## Blinky

```elixir

mix nerves.new blinky
cd blinky
MIX_TARGET=rpi3 mix deps.get
MIX_TARGET=rpi3 mix firmware
MIX_TARGET=rpi3 mix firmware.burn

```

## Nerves FW/UI

```elixir

mix new nervy --umbrella
cd nervy/apps
mix nerves.new fw
mix phoenix.new ui --no-ecto --no-brunch

```