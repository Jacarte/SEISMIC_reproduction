


percentages="0 0.5 1"

for p in $percentages; do
	for p2 in $percentages; do
		for p3 in $percentages; do
			for i in {1..1}; do 
				java -jar /Users/javierca/Documents/Develop/wasm-twister/target/wasm-twister-0.1.jar -i $1 -pa $p2 -px $p -py $p3 > $i.$p.$p2.$p3.$1
				wat2wasm $i.$p.$p2.$p3.$1 -o $i.$p.$p2.$p3.jazecminer.wasm
				#rm $i.$p.$1
			done
		done
	done
done
