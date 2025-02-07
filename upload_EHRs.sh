# !/bin/sh

set -e

prefix=$1

curr_dir=$(pwd)

for file in `ls $curr_dir/output/fhir/$prefix*.json`; do
    [[ $file =~ hospitalInformation* ]] && continue
    [[ $file =~ practitionerInformation* ]] && continue
    echo $file
    # curl http://localhost:4004/hapi-fhir-jpaserver/fhir -H "Content-Type: application/fhir+json" --data-binary "@$file" 
    curl http://localhost:8080/fhir -H "Content-Type: application/fhir+json" --data-binary "@$file" 
    echo
done