TMP=./tmp_messung.txt
OUTPUT=./messungen_log.txt

echo $1
echo $2
echo $#
if ! [ -z "$1" ] 
then
  OUTPUT=$1
fi

if ! [ -z "$2" ]
then 
  TMP=$2
fi

make_measurement() {

  echo "---DATE---" > $TMP
  date >> $TMP  
  echo "---START DATA---" >> $TMP
  PINGRESULT=$(ping google.com -c 5 >> $TMP)
  echo "---END DATA---" >> $TMP

  if ! $PINGRESULT
  then 
    cat $TMP >> $OUTPUT
    return 1
  fi
  return 0
}

while true
do
  while ! make_measurement 
  do 
    sleep 5
  done
  sleep 30
done
