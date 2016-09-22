#!/bin/bash

amixer get Master | grep "Front Left:" | awk '{print substr($5, 2, length($5)-3)}'
#amixer get Master | tail -1 | awk '{ print $5}' | tr -d '[]%'
