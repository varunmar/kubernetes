#!/bin/env bash

existing_lines=0
while true;
      new_lines=$(sudo iptables-save | tee $(date +%T) | wc -l)
      if new_lines
      then
      fi
done
