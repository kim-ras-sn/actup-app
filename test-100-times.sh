i=0
while [ $i -ne 40 ]
do
    curl -s -o /dev/null -I -w "%{response_code}\n" https://act-up.azurewebsites.net/

    i=$(($i+1))
done