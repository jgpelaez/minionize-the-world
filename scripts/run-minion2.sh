#!/bin/bash
echo -e "\e[34mstarting containers\e[39m"

docker run -d -p 8880:8880 --name="minion-ipsum" --link scripts_eureka_1:Sirius-eureka --hostname="sirius-minion-ipsum" ehdez73/minion-ipsum
docker run -d -p 8881:8881 --name="minion-characters" --link scripts_eureka_1:Sirius-eureka --hostname="sirius-minion-characters" ehdez73/minion-characters
# docker run -d -p 8990:8881 --name="minion-characters2" --link scripts_eureka_1:Sirius-eureka --hostname="sirius-minion-characters2" ehdez73/minion-characters
docker run -d -p 8080:8080 --name="minion-front" \
	--link minion-ipsum:sirius-minion-ipsum \
	--link minion-characters:sirius-minion-characters \
	--link scripts_eureka_1:Sirius-eureka \
	--link scripts_hystrix_1:sirius-hystrix-dashboard \
	--hostname="sirius-minion-front" ehdez73/minion-front
# docker run -d -p 8087:8080 --name="minion-front2" --link minion-ipsum:sirius-minion-ipsum --link scripts_eureka_1:Sirius-eureka --hostname="sirius-minion-front2" ehdez73/minion-front
