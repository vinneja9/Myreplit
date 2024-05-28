month="$1"
day="$2"
year=$3
#인수갯수가 3개가 아니면 빠꾸
if [ $# -ne 3 ]
	then
	echo 입력값 오류
	exit 1
fi

#달을 대문자로 바꿈
case $month in
    1|jan|january|Jan) month="Jan" ;;
    2|feb|february|Feb) month="Feb" ;;
    3|mar|march|Mar) month="Mar" ;;
    4|apr|april|Apr) month="Apr" ;;
    5|may|May) month="May" ;;
    6|jun|june|Jun) month="Jun" ;;
    7|jul|july|Jul) month="Jul" ;;
    8|aug|august|Aug) month="Aug" ;;
    9|sep|september|Sep) month="Sep" ;;
    10|oct|october|Oct) month="Oct" ;;
    11|nov|november|Nov) month="Nov" ;;
    12|dec|december|Dec) month="Dec" ;;
	*) echo 올바른 달이 아닙니다 $month $day $year 는 유효하지 않습니다
		exit 2 ;;
esac


#윤년 계산
#윤년이면 jun=1 아니면 jun=0
if [ $((year % 4)) -eq 0 ]
	then
	if [ $((year % 100)) -ne 0 ] || [ $((year % 400)) -eq 0 ]
        then
		jun=1
    else
        jun=0
    fi
else
	jun=0
fi

#출력기
#31일 30일 29일 28일 모두 구비완
case $month in
	Jan|Mar|May|Jul|Aug|Oct|Dec) 
		if [ $day -le 31 ] && [ $day -ge 1 ]
			then
			echo $month $day $year
		else
			echo 해당 되는 달에는 없는 날 입니다 $month $day $year 는 유효하지 않습니다
		fi;;
	
	Feb) month="Feb" 
	#jun을 비교하여 jun=1이면 윤년으로 29일 계산
		if [ $jun -eq 1 ] 
			then
			if [ $day -le 29 ] && [ $day -ge 1 ]
				then
				echo $month $day $year
			else
				echo 해당 되는 달에는 없는 날 입니다 $month $day $year 는 유효하지 않습니다
			fi
	#아니면 즉 jun=0이면 윤년이 아님으로 28일 계산
		else
			if [ $day -le 28 ] && [ $day -ge 1 ]
				then
				echo $month $day $year
			else
				echo 해당 되는 달에는 없는 날 입니다 $month $day $year 는 유효하지 않습니다
			fi
		fi;;
	
	Apr|Jun|Sep|Nov) 
		if [ $day -le 30 ] && [ $day -ge 1 ]
			then
			echo $month $day $year
		else
			echo 해당 되는 달에는 없는 날 입니다 $month $day $year 는 유효하지 않습니다
		fi;;
esac


