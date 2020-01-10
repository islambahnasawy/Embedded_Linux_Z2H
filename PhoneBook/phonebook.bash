#!/bin/bash

if [ ! -e ~/Desktop/phonebook.txt ]
then
touch ~/Desktop/phonebook.txt
chmod u+rx ~/Desktop/phonebook.txt
echo "|Name           |Number1       |Number2             " >> ~/Desktop/phonebook.txt
echo "|_______________|______________|____________________" >> ~/Desktop/phonebook.txt
fi

case $1 in

-v)
#dosomething
cat ~/Desktop/phonebook.txt
;;

-i)
flag=1

while [ $flag == 1 ]
do
read -p "Enter contact name: " name
if [ ${#name} -lt 20 ]
then
flag=0
fi
done

flag=1
while [ $flag == 1 ]
do

read -p "Enter contact number: " num
if [ ${#num} -lt 15 ]
then
echo -n $name"     "$num >> ~/Desktop/phonebook.txt
flag=0
fi
done

addnum='y'
while [ $addnum == 'y' ]
do

read -p "Do you want to add another number? (Y/N)" addnum
if [ $addnum == 'y' ]
then
flag=1

while [ $flag == 1 ]
do

read -p "Enter another contact number: " num
if [ ${#num} -lt 15 ]
then
echo -n "     "$num >> ~/Desktop/phonebook.txt
flag=0
fi
done
fi

echo >> ~/Desktop/phonebook.txt

done


;;

-s)
#dosomething

flag=1
while [ $flag == 1 ]
do
read -p "Enter contact name: " name
if [ ${#name} -lt 20 ]
then
flag=0
fi
done

if grep -iwE "$name   " ~/Desktop/phonebook.txt && echo "operation succeeded :)"
then
echo
echo -n
else
echo "failed: the name you entered is not exist"
fi
;;

-e)
#dosomething
echo "|Name           |Number1       |Number2             " > ~/Desktop/phonebook.txt
echo "|_______________|______________|____________________" >> ~/Desktop/phonebook.txt
;;

-d)
#dosomething
flag=1
while [ $flag == 1 ]
do
read -p "Enter contact name: " name
if [ ${#name} -lt 20 ]
then
flag=0
fi
done

if grep -iwE "$name  " ~/Desktop/phonebook.txt > ~/Desktop/temp.txt
then
echo "operation succeeded :)"
if grep -ivwE "$name   " ~/Desktop/phonebook.txt > ~/Desktop/temp.txt
then
cat ~/Desktop/temp.txt > ~/Desktop/phonebook.txt
rm ~/Desktop/temp.txt
echo -n
fi
else
echo "failed: the name you entered is not exist"
fi

;;

*)
echo "please enter an option of those:"
echo "-v: view all contacts"
echo "-s: search by contact name"
echo "-i: insert contact name and number"
echo "-d: remove by contact name"
echo "-e: remove all contacts"
;;

esac

