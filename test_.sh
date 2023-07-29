#!/bin/bash

tmp=/tmp/$$

ERROR_EXIT () {
    cat $tmp-error
    rm -f $tmp-*
    exit 1
}

# テスト開始
./gcd.sh 5 10 > $tmp-result
echo "5" > $tmp-ans
diff $tmp-result $tmp-ans || echo "error" >> $tmp-error

./gcd.sh > $tmp-result
echo "Error!" > $tmp-ans
diff $tmp-result $tmp-ans || echo "error" >> $tmp-error

./gcd.sh 5 > $tmp-result
echo "Error!" > $tmp-ans
diff $tmp-result $tmp-ans || echo "error" >> $tmp-error

./gcd.sh -5 2 > $tmp-result
echo "Error!" > $tmp-ans
diff $tmp-result $tmp-ans || echo "error" >> $tmp-error

./gcd.sh 5 -1 > $tmp-result
echo "Error!" > $tmp-ans
diff $tmp-result $tmp-ans || echo "error" >> $tmp-error

./gcd.sh "a" "b" > $tmp-result
echo "Error!" > $tmp-ans
diff $tmp-result $tmp-ans || echo "error" >> $tmp-error

if [ -f $tmp-error ]; then
    ERROR_EXIT
fi
