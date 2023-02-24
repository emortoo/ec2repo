#!/bin/bash

# Define an associative array to store the questions and correct answers
answers=("d" "c" "a" "b" "c" "e" "d" "d" "c" "b") 

echo -e "Welcome to the test centre\n"
echo -e "Kindly answer all questions with five possible answers from (a) - (e)\n"
echo "Please enter your name:"
read name
echo "Hello, $name! Are you ready to start? (y/n)"
read responds

if [ "$responds" != "y" ]; then
  echo "Okay, thank you and see you some other time."
  exit 1
fi

# Define a variable to store the total marks
total_marks=0

# Loop through each question and ask the user to answer
for i in {1..10}; do
  question=""

  case $i in
    1)
      question="What is the command to list files and directories in a Linux directory?"
      options=("a) listdir" "b) lsf" "c) dir" "d) ls" "e) pwd")
      ;;
    2)
      question="What is the command to display the contents of a file in the terminal?"
      options=("a) open" "b) edit" "c) cat" "d) print" "e) type")
      ;;
    3)
      question="What is the command to create a new directory in Linux?"
      options=("a) mkdir" "b) newdir" "c) createdir" "d) makedir" "e) mkd")
      ;;
    4)
      question="What is the command to copy a file in Linux?"
      options=("a) mv" "b) cp" "c) move" "d) copy" "e) duplicate")
      ;;
    5)
      question="What is the command to delete a directory in Linux?"
      options=("a) deletedir" "b) removedir" "c) rmdir" "d) erasedir" "e) deldir")
      ;;
    6)
      question="What is the command to lock a user account in Linux?"
      options=("a) blockuser" "b) lockuser" "c) userlock" "d) disableuser" "e) passwd -l")
      ;;
    7)
      question="What is the command to terminate a process in Linux?"
      options=("a) end" "b) stop" "c) exit" "d) kill" "e) terminate")
      ;;
    8)
      question="What is the command to display the parent and child file hierarchy in Linux?"
      options=("a) hierarchy" "b) parentdir" "c) childdir" "d) tree" "e) pd")
      ;;
    9)
      question="What is the command to set the expiration date for a user account in Linux?"
      options=("a) expdate" "b) setdate" "c) chage" "d) expireuser" "e) passwd -e")
      ;;
    10)
      question="What is the command to search for a file in Linux?"
      options=("a) grep" "b) find" "c) locate" "d) search" "e) filesearch")
      ;;
    *)
      echo "Invalid question. Skipping." >&2
      continue
  esac

  echo "Question $i: $question"
  echo "  ${options[0]}"
  echo "  ${options[1]}"
  echo "  ${options[2]}"
  echo "  ${options[3]}"
  echo "  ${options[4]}"

  read -p "Enter your answer (a-e): " answer

  # Convert the answer to a lowercase letter
  answer=${answer,,}

   # Check if the answer is correct
  case $answer in
    "a"|"b"|"c"|"d"|"e")
	    if [[ "${answer}" == "${answers[$((i-1))]}" ]]; then
        echo -e "Correct!\n"
	sleep 2 
      else
        echo -e "Incorrect. The correct answer is ${answers[$((i-1))]}.\n"
	sleep 2
      fi
      ;;
    *)
      echo -e "You entered an invalid answer. Skipping to next question.\n" >&2
      continue
      ;;
  esac
done

echo "You scored $total_marks out of 10."

