DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

FILE1=$1

echo "Select your option: Do you want to subsample to (1) a particular number of reads? Or by percentage (2)? "
select yn in "1" "2"; do
    case $yn in
        1 ) ./bootstrapping_reads.sh $FILE1; break;;
        2 ) ./bootstrapping_percentage.sh $FILE1;exit;;
    esac
done
