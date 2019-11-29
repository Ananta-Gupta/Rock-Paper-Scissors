#/bin/bash

# Rock Paper Scissors

function print()
{
	echo -e "\t\t****Rock Paper Scissors****"
	echo -e "\t\t-----Let play the Game-----"
	echo ""
	echo -e "\t\t\t1. Rock"
	echo -e "\t\t\t2. Paper"
	echo -e "\t\t\t3. Scissor"	
	echo ""
}

function check()
{
	if [ $1 -eq $2 ]
	then
		echo -e "\t\tGame Draw!!!"
	elif [ $1 -eq 1 -a $2 -eq 2 ]
	then
		echo -e "\t\tComputer Win. Paper beats Rock."
	elif [ $1 -eq 2 -a $2 -eq 3 ]
	then
		echo -e "\t\tComputer Win. Scissor beats Paper."
	elif [ $1 -eq 3 -a $2 -eq 1 ]
	then
		echo -e "\t\tComputer Win. Rock beats Scissor."
	else
		echo -e "\t\tYou win."
	fi
}

clr=0
i=0
while [ $i -ne 1 ]
do
	if [ $clr -eq 0 ]
	then
		clr=0
		clear
		print 1
	fi
	echo -n -e "\t\tYour Turn : "
	read ch1
	
	case $ch1 in
	1)
		echo -e "\t\t  Your option : Rock"
		;;
	2)
		echo -e "\t\t  Your option : Paper"
		;;
	3)
		echo -e "\t\t  Your option : Scissor"
		;;
	*)
		echo -e "\t\t  Invalid Option"
		;;
	esac

	if [ $ch1 -eq 0 -o $ch1 -gt 3 ]
	then
		echo -e "\t\tplease choose from 1, 2 or 3."
		clr=1
		continue
	fi
	# echo -n -e "\t\tComputer's Choose : "
	ch2=$(echo "$RANDOM%3+1" | bc)

	case $ch2 in
	1)
		echo -e "\t\tComputer's option : Rock"
		;;
	2)
		echo -e "\t\tComputer's option : Paper"
		;;
	3)
		echo -e "\t\tComputer's option : Scissor"
		;;
	*)
		echo -e "\t\t  Invalid Option"
		;;
	esac

	check $ch1 $ch2
	echo -n -e "\t  To exit press 0\n"
	echo -n -e "\t  To play again press 1 : "
	read ch3
	if [ $ch3 -eq 1 ]
	then
		rep=6
		while [ $rep -ne 0 ]
		do
			sleep 1
			clear
			print 1			
			echo -e "\t\tStarting in `expr $rep - 1` seconds!!!"
			rep=`expr $rep - 1`
		done
		continue
	else
		exit
	fi
done
