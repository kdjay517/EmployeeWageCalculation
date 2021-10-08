#!/bin/bash -x

IS_FULL_TIME=1;
IS_PART_TIME=2;
MAX_HRS_IN_MONTH=4;
EMP_RATE_PER_HR=20;
NUM_WORKING_DAYS=20;


totalEmpHr=0;
totalWorkingDays=0;

function getWorkingHours(){
        case $1 in
                $IS_PART_TIME )
                                workHrs=4;
                                ;;
                $IS_FULL_TIME )
                                workHrs=8;
                                ;;
                * )
                                workHrs=0;
                                ;;
        esac
        echo $workHrs
}

while [ $totalEmpHr -lt $MAX_HRS_IN_MONTH -a $totalWorkingDays -lt $NUM_WORKING_DAYS ]
do
        ((totalWorkingDays++))
        workHours="$(getWorkingHours $((RANDOM%3)))";
        totalEmpHr=$(($totalEmpHr+$workHours));
done
totalSalary=$(($totalEmpHr*$EMP_RATE_PER_HR));

echo " total salary of employe is $totalSalary"

