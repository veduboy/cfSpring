CF_APP="cf-spring"

dburl=$(cf env "${CF_APP}" | awk '/System-Provided:/{flag=1;next}/^$/{flag=0}flag' | jq -r '.VCAP_SERVICES."dashDB For Transactions"[0].credentials.jdbcurl')
dbusername=$(cf env "${CF_APP}" | awk '/System-Provided:/{flag=1;next}/^$/{flag=0}flag' | jq -r '.VCAP_SERVICES."dashDB For Transactions"[0].credentials.username')
dbpassword=$(cf env "${CF_APP}" | awk '/System-Provided:/{flag=1;next}/^$/{flag=0}flag' | jq -r '.VCAP_SERVICES."dashDB For Transactions"[0].credentials.password')
echo "${CF_APP} : ${dburl} : ${dbusername}"  

flyway clean migrate -url=${dburl} -user=${dbusername} -password=${dbpassword} -locations=filesystem:src/main/resources/db/migration jarDirs=C:\Users\vedansh.p\Downloads\abc-20180409T070540Z-001\abc\lib


