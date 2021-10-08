#!/bin/bash -x

IS_FULL_TIME=1;
IS_PART_TIME=2;
MAX_HRS_IN_MONTH=100;
EMP_RATE_PER_HR=20;
NUM_WORKING_DAYS=20;


totalEmpHrs=0;
totalWorkingDays=0;
declare -A dailyWage;

function getWorkHrs(){
        local empCheck=$1;
        case $empCheck in
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
function getEmpWage(){
        local empHr=$1;
        echo $(($empHr*$EMP_RATE_PER_HR))
}


while [ $totalEmpHrs -lt $MAX_HRS_IN_MONTH -a $totalWorkingDays -lt $NUM_WORKING_DAYS ]
do
        ((totalWorkingDays++))
        empCheck=$((RANDOM%3))
        empHrs="$(getWorkHrs $empCheck)"
        totalEmpHrs=$(($totalEmpHrs+$empHrs))
        dailyWage["Day" $totalWorkingDays]="$( getEmpWage $empHrs )"
done
totalSalary=$(($totalEmpHrs*$EMP_RATE_PER_HR));
echo ${dailyWage[@]}
echo ${!dailyWage[@]}


