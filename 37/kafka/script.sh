#!/bin/bash  

for ((i=0;i<4;i=i+1))  
	do
		for ((j=i*16;j<i*16+16;j=j+1)) 
			do 
				if [ "$j" = 0 ]
				then
					continue
				fi
				echo $j
				cp docker-compose-kafka0.yaml docker-compose-kafka${j}.yaml   
				id=`expr $j + 1`
				sed -i "s/KAFKA_BROKER_ID=1/KAFKA_BROKER_ID=${id}/g" docker-compose-kafka${j}.yaml
				sed -i "s/kafka0/kafka$j/g" docker-compose-kafka${j}.yaml
				val=`expr $j + 9 - $i \* 16`
				echo $val
				sed -i "s/9092:/${val}092:/g" docker-compose-kafka${j}.yaml
			done
	done

