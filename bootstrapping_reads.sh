echo "Calculating the number of reads of your fastq input..."

awk '{s++}END{print s/4}'  $1 > output
i=$(head output)


echo -n "You have $i reads. What is the amount of reads you want to have?"
read userInput
for item in $userInput
do
c=$(echo "$item/$i" | bc -l)
echo "You are about to subsample $1 to $c total number of reads. :-0"
echo "Bootstrapping..."
seqtk sample -s100 $1 $c > sub.output.$1
awk '{s++}END{print s/4}' sub.output.$1 > sub.output
sub=$(head sub.output)
echo "Your sample has now $sub reads"
echo "Finished! Bye :-) "
done
