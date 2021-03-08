#!bin/bash
IPs=(45.183.222.33 45.183.223.33 201.55.60.36 200.242.61.18 200.233.14.149 45.183.244.51 187.86.227.43 200.189.124.39 200.233.4.151 200.233.14.151)

for sefaz in $(cat ./sefaz.txt) 
do
    for (( i=0; i <= 100; i++ ))
    do 
        TELNET=$(\echo "\035" | telnet $sefaz 443 | grep Trying | awk '{print $2}' | sed -r 's/...$//g')
        if [[ "${IPs[@]}" != *"$TELNET"* ]];then
        echo $TELNET >> ./telnet.log
    fi
    done
done
