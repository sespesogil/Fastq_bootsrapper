echo "Calculating the number of reads of your fastq input..."

awk '{s++}END{print s/4}'  $1 > output
i=$(head output)

echo -n "You have $i reads. What percentage do you want to subsample?"
read userInput

for item in $userInput
do

b=$(echo "$item/100" | bc -l)
echo "You are about to subsample $1 to $item % of the total number of reads. :-0"
echo "Bootstrapping..."
seqtk sample -s100 $1 $b > sub.output.$1
awk '{s++}END{print s/4}' sub.output.$1 > sub.output
sub=$(head sub.output)
echo "Your sample has now $sub reads"
echo "Finished :-)"
rm sub.output
rm output
done
