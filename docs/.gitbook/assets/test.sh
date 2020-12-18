#!/bin/bash
ll | grep 'Oct 20 2020' | awk '{print $9}' | while read aa
do
rm $aa
done
