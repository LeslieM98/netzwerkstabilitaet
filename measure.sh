TMP=./tmp_messung.txt
OUTPUT=./messungen_log.txt

if $1 
then
  OUTPUT=$1
fi

if $2
then 
  TMP=$2
fi

make_measurement() {
  
  if ! ping google.com -c 1 > $TMP
  then 
    echo "---DATE---" >> $OUTPUT
    date >> $OUTPUT
    echo "---START DATA---" >> $OUTPUT
    cat $TMP >> $OUTPUT
    echo "---END DATA---" >> $OUTPUT
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
