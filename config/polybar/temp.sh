#!/bin/bash
temp=sensors | grep "Core 0" | cut -c17-20
echo $(sensors | grep "Core 0" | cut -c17-18)°C
