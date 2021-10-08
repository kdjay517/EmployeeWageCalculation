#!/bin/bash -x

isPartTime=2;
isFullTime=1;
empRatePerHr=20;
empCheck=$((RANDOM%3));
case $empCheck in
        $isFullTime )
                        empHrs=8;
                        ;;
        $isPartTime )
                        empHrs=4;
                        ;;
        * )
                        empHrs=0;
                        ;;
esac
salary=$(($empHrs*$empRatePerHr));
echo "employee per day salary is $salary"

