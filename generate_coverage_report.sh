#!/bin/sh
echo "REPORT FOR ALL TESTS"
xcov -s CleanItunesSearch -o Reports
echo $(pwd)/Reports/index.html
