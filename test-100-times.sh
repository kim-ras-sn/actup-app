i=0
while [ $i -ne 10 ]
do
    curl -s -o /dev/null -I -w "%{response_code}-%{stdout}" https://yara-app.azurewebsites.net/


    i=$(($i+1))
done