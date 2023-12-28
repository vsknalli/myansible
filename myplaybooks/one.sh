#!/bin/sh
for i in /*
do echo $i 
find $i | wc -l
done
