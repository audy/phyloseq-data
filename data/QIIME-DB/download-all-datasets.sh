while IFS=, read experiment id
do
  echo "experiment=${experiment} id=${id}"
  ./download.R --id ${id} --output ${experiment}.Rdata
done < id-map.csv
