#!/bin/bash
# unemployment.sh
# All the "fun" and disappointment of being unemployed neatly contained in your terminal!
# This script is an infinite loop. To exit press control c and press enter at the prompt. 

function life {
# Input parameters: None
# Outputs: String text setting the scene for our adventure.

  echo "The scene starts in a dark room. An overhead light illuminates a well dressed man in his late twenties sitting on a stool smoking a cigarette. After taking a puff of the cigarette, he begins to narrate the details of a visit to a little place we know as, 'The Twilight Zone'."
  echo ""
  echo "The story of our protagonist begins when he becomes unemployed. He does what you would expect, updates his résumé and begins applying for jobs."
  echo ""
  read -a userInput -e -p "Press the 'Enter' key to continue." 
  
  search_for_job
}

function search_for_job {
# Input parameters: None
# Outputs: Various strings associated with searching for a job

  unemployed="true"
  while (( $unemployed == true )); do
    # Roll the dice!
    fourSideDie=$((1 + RANDOM % 4))
    hundredSideDie=$((1 + RANDOM % 100))
    DESCRIPTIONS_READ=$(($DESCRIPTIONS_READ + $hundredSideDie))
    echo "You read $hundredSideDie job postings and apply to $fourSideDie of them."
    for (( j=0 ; j<$fourSideDie ; j++ )); do
      apply_for_job
    done      
    receive_random_unsolicited_advice_or_discouragement
    anxiety
  done
}

function apply_for_job {
# Input parameters: None
# Outputs: Various strings associated with applying for a job

  echo "Apply for job"
  ((JOBS_APPLIED++))
  # Roll the dice!
  sixSideDie1=$((1 + RANDOM % 6))
  sixSideDie2=$((1 + RANDOM % 6))
  if [ "$sixSideDie1" == "$sixSideDie2" ]; then
    get_request_to_schedule_interview
  fi
  # Flip a coin
  coin=$(( 1 + RANDOM % 2))
  if [ "$coin" == 1 ]; then
    get_rejection_letter
  fi
}

function get_rejection_letter {
# Input parameters: None
# Outputs: Rejection letter

  echo "Your qualifications are impressive but we will be proceeding with other candidates."
  ((REJECTION_LETTERS++))
}

function get_request_to_schedule_interview {
# Input parameters: None
# Outputs: Various strings related to interviewing

  # Roll the dice again!
  ((INTERVIEW_REQUESTS++))
  eightSideDie1=$((1 + RANDOM % 8))
  # These events are either real or composites of things I have experienced.
  case "$eightSideDie1" in
    1)  echo "The interviewer refuses to follow up with you.";;
    2)  echo "The interviewer incorrectly scheduled the event.";;
    3)  echo "You get sick, attempt to reschedule but never hear from the interviewer again.";;
    4)  echo "The interview is scheduled. All participants in the interview are cordial and the interview goes well.";;
    5)  echo "The interview is scheduled. During the interview, it becomes apparent the interviewer did not read your résumé and the job description has nothing to do with the questions asked.";;
    6)  echo "The interview is scheduled. During the interview, the interviewer demonstrates they have no idea what they are looking for in a candidate.";;
    7)  echo "The interview is scheduled. During the interview, the interviewer displays contempt through frequent interruptions.";;
    8)  echo "A phone interview is scheduled. Due to an assortment of circumstances, you decide to do the interview from your car while at a city park. Ten minutes before the interview begins, the National Weather Service declares a Tornado Warning. You end up driving to a new location for the duration of the Tornado Warning and are not available for the phone call at the agreed upon time. After the Tornado Warning expires, you call the interviewer back and by some miracle, get a second interview.";; # This is not made up. It actually happened.
  esac
}

function receive_random_unsolicited_advice_or_discouragement {
# Input parameters: None
# Outputs: Various strings of unsolicited advice or discouragement

# Roll the dice yet again
  tenSideDie=$((1 + RANDOM % 10))
  case "$tenSideDie" in
    1)    echo "Your perfect job is out there..." ;;
    2)    echo "You just have to stay positive." ;;
    3)    echo "Clearly if you can't get a job in this environment, something is wrong with you." ;;
    4)    echo "There are tons of jobs available. Why are you still unemployed." ;;
    5)    echo "Clearly you must be lazy." ;;
    6)    echo "There is no difference between spending my time playing video games and applying for jobs." ;;
    7)    echo "Sorry, but I think you will get bored in this position but I will keep you in mind for other positions." ;;
    8)    echo "I am sorry, I wish there was more I could do for you." ;;
    9)    echo "Maybe you need to try doing something different." ;;
    10)   
          echo "Have you tried applying for a job at a grocery store or the Post Office?"
          apply_for_job
          ;;
  esac
}

function anxiety {
# Input parameters: None
# Outputs: String indicating how much sleep you had last night

# Roll the dice again! Yes, we like our dice.
  fourSideDie=$((1 + RANDOM % 4))
  twentySideDie=$((1 + RANDOM % 20))
  sleepTimer=$((8 - $fourSideDie))
  echo "Anxiety keeps you awake at night but you finally get to sleep."
  sleep 0.0$sleepTimer
  echo "You wake up in the morning and find you only got $sleepTimer hours of sleep."
  SLEEP_LOST=$(($SLEEP_LOST + $sleepTimer))
  ((DAYS_UNEMPLOYED++))

  # Random events - life is not smooth sailing so why should a job search be smooth and straight forward?
  case "$twentySideDie" in
    10)
      # Here we go again with the dice!
      sixSideDie=$((1 + RANDOM % 6))
      echo "Recuriter lied to you. Lose $sixSideDie days."
      DAYS_UNEMPLOYED=$(($DAYS_UNEMPLOYED+$sixSideDie))
      ;;
    11)
      echo "Unexpected event. Lose one day."
      DAYS_UNEMPLOYED=$(($DAYS_UNEMPLOYED+1))
      ;;
    12)
      echo "Unexpected event. Lose two days."
      DAYS_UNEMPLOYED=$(($DAYS_UNEMPLOYED+2))
      ;;
    13)
      echo "Unexpected event. Lose three days."
      DAYS_UNEMPLOYED=$(($DAYS_UNEMPLOYED+3))
      ;;
    14)
      echo "Spouse gets sick. Lose three days."
      DAYS_UNEMPLOYED=$(($DAYS_UNEMPLOYED+3))
      ;;
    15)
      echo "You get sick. Lose five days."
      DAYS_UNEMPLOYED=$(($DAYS_UNEMPLOYED+5))
      ;;
    16)
      echo "Your child gets sick. Lose five days."
      DAYS_UNEMPLOYED=$(($DAYS_UNEMPLOYED+5))
      ;;
    17)
      echo "End of fiscal quarter. Job postings on hold while quarterly results are tabulated."
      DAYS_UNEMPLOYED=$(($DAYS_UNEMPLOYED+7))
      ;;
    18)
      echo "Middle of month. Volume of job postings deteriorates."
      DAYS_UNEMPLOYED=$(($DAYS_UNEMPLOYED+3))
      ;;
    19)
      echo "Household appliance breaks. Because you are unemployed, it makes no rational sense to call a repair person who will simply tell you to buy a new one while happily taking 300 dollars. It is up to you to fix it."
      DAYS_UNEMPLOYED=$(($DAYS_UNEMPLOYED+2))
      ;;
    20)
      echo "Holiday. No new jobs are posted on holidays. Lose one day."
      DAYS_UNEMPLOYED=$(($DAYS_UNEMPLOYED+2))
      ;;
  esac
}

function statistics {
# Input parameters: None
# Outputs: Results tabulated by global variables DESCRIPTIONS_READ, JOBS_APPLIED, INTERVIEW_REQUESTS, REJECTION_LETTERS, SLEEP_LOST and DAYS_UNEMPLOYED.
# 
  echo ""
  echo ""
  echo "--------------------------------------------------------------------------------"
  echo "You read $DESCRIPTIONS_READ job descriptions, applied to $JOBS_APPLIED jobs and received $INTERVIEW_REQUESTS interview requests."
  echo "Additionally, you received $REJECTION_LETTERS rejection letters and lost $SLEEP_LOST hours of sleep. You are still unemployed after $DAYS_UNEMPLOYED days and more stressed than ever."

  sleep 1

  terminate=false
  while (( "$terminate" == "false" )); do
    echo "Would you like to continue your job search?"
    read -a userInput -e -p "Yes/[No] > " 
    userInput=$(echo ${userInput[@]} | tr '[:upper:]' '[:lower:]')
    case "$userInput" in
      yes)
        echo "Here we go again!"
        search_for_job
        ;;
      no|"")
        echo ""
        echo ""
        echo "A strange game. The only winning move is not to play. How about a nice game of chess?"
        echo ""
        echo ""
        terminate=true
        exit
        ;;
      *)    echo "Invalid command input. Valid options are 'yes' or 'no'.";;
    esac
  done
}

DESCRIPTIONS_READ=0
JOBS_APPLIED=0
INTERVIEW_REQUESTS=0
REJECTION_LETTERS=0
SLEEP_LOST=0
DAYS_UNEMPLOYED=0

trap statistics SIGINT INT
life
