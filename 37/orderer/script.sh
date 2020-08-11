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
				cp docker-compose-orderer0.yaml docker-compose-orderer${j}.yaml   
				sed -i "s/orderer0/orderer$j/g" docker-compose-orderer${j}.yaml
				val=`expr $j + 7 - $i \* 16`
				echo $val
				sed -i "s/7050:/${val}050:/g" docker-compose-orderer${j}.yaml
			done
	done

