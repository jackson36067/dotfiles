#!/usr/bin/env bash

frames=(
  "$HOME/.config/nvim/static/header1.cat"
  "$HOME/.config/nvim/static/header2.cat"
  "$HOME/.config/nvim/static/header3.cat"
  "$HOME/.config/nvim/static/header4.cat"
)

while true; do
  for frame in "${frames[@]}"; do
    clear
    cat "$frame"
    sleep 0.5
  done
done
