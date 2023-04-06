#!/bin/bash

read -p "Dominio: " dominio;
findomain --output -t $dominio;
cat $dominio".txt" | httpprobe > list.txt;
cat list.txt  | gau | grep "=" | sed 's/=.*/=/' | sort - u > params.txt;
cat params.txt | httpx -mc 200 -o paramstest200.txt;
rm params.txt;
cat paramstest200.txt | dalfox pipe
