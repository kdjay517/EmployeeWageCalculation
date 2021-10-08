#!/bin/bash -x

isPresent=1;
randomCheck=$((RANDOM%2));
if [ $isPresent -eq $randomCheck ]
then
        echo "Employee is Present";
        empRatePerHr=20;
        empHrs=8;
        salary=$(($empHrs*$empRatePerHr));
	echo "salary per day is $salary"
else
	echo "Employee is not present";
        salary=0;
	echo "salary per day is $salary"
fi
