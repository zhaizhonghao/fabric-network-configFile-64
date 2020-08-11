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
				cp docker-compose-zookeeper0.yaml docker-compose-zookeeper${j}.yaml   
				sed -i "s/zookeeper0/zookeeper$j/g" docker-compose-zookeeper${j}.yaml
				id=`expr $j + 1`
				sed -i "s/ZOO_MY_ID=1/ZOO_MY_ID=${id}/g" docker-compose-zookeeper${j}.yaml
				val=`expr $j + 2 - $i \* 16`
				sed -i "s/2181:/${val}181:/g" docker-compose-zookeeper${j}.yaml
				val2=`expr $j - $i \* 16`
				sed -i "s/20888:2888/2${val2}888:2888/g" docker-compose-zookeeper${j}.yaml
				sed -i "s/30888:3888/3${val2}888:3888/g" docker-compose-zookeeper${j}.yaml
			done
	done

