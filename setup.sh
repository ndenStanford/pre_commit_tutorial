# please run this on a powerful machine ex.cd5.2xlarge
# Run 'sudo apt-get install openjdk-11-jdk' before running image

docker pull grobid/entity-fishing:0.0.5
mkdir -p data/db
curl -o data/db/db-kb.zip https://science-miner.s3.amazonaws.com/entity-fishing/0.0.6/db-kb.zip 
curl -o data/db/db-en.zip https://science-miner.s3.amazonaws.com/entity-fishing/0.0.6/db-en.zip
curl -o data/db/db-fr.zip https://science-miner.s3.amazonaws.com/entity-fishing/0.0.6/db-fr.zip
curl -o data/db/db-de.zip https://science-miner.s3.amazonaws.com/entity-fishing/0.0.6/db-de.zip
curl -o data/db/db-es.zip https://science-miner.s3.amazonaws.com/entity-fishing/0.0.6/db-es.zip
curl -o data/db/db-it.zip https://science-miner.s3.amazonaws.com/entity-fishing/0.0.6/db-it.zip
curl -o data/db/db-ar.zip https://science-miner.s3.amazonaws.com/entity-fishing/0.0.6/db-ar.zip
curl -o data/db/db-zh.zip https://science-miner.s3.amazonaws.com/entity-fishing/0.0.6/db-zh.zip
curl -o data/db/db-ru.zip https://science-miner.s3.amazonaws.com/entity-fishing/0.0.6/db-ru.zip
curl -o data/db/db-ja.zip https://science-miner.s3.amazonaws.com/entity-fishing/0.0.6/db-ja.zip
curl -o data/db/db-pt.zip https://science-miner.s3.amazonaws.com/entity-fishing/0.0.6/db-pt.zip
curl -o data/db/db-fa.zip https://science-miner.s3.amazonaws.com/entity-fishing/0.0.6/db-fa.zip
curl -o data/db/db-uk.zip https://science-miner.s3.amazonaws.com/entity-fishing/0.0.6/db-uk.zip
curl -o data/db/db-sv.zip https://science-miner.s3.amazonaws.com/entity-fishing/0.0.6/db-sv.zip
curl -o data/db/db-bn.zip https://science-miner.s3.amazonaws.com/entity-fishing/0.0.6/db-bn.zip
curl -o data/db/db-hi.zip https://science-miner.s3.amazonaws.com/entity-fishing/0.0.6/db-hi.zip

# Need to delete the existing folder first if it's there
unzip data/db/db-kb.zip -d data/db
unzip data/db/db-en.zip -d data/db
unzip data/db/db-fr.zip -d data/db
unzip data/db/db-de.zip -d data/db
unzip data/db/db-es.zip -d data/db
unzip data/db/db-it.zip -d data/db
unzip data/db/db-ar.zip -d data/db
unzip data/db/db-zh.zip -d data/db
unzip data/db/db-ru.zip -d data/db
unzip data/db/db-ja.zip -d data/db
unzip data/db/db-pt.zip -d data/db
unzip data/db/db-fa.zip -d data/db
unzip data/db/db-uk.zip -d data/db
unzip data/db/db-sv.zip -d data/db
unzip data/db/db-bn.zip -d data/db
unzip data/db/db-hi.zip -d data/db

docker run --rm -p 8090:8090 -p 8091:8091 \
  -v /home/ubuntu/datascience/entity_linking_multilingual/entity_fish_docker/model/data/db/db-kb:/opt/entity-fishing/data/db/db-kb \
  -v /home/ubuntu/datascience/entity_linking_multilingual/entity_fish_docker/model/data/db/db-en:/opt/entity-fishing/data/db/db-en \
  -v /home/ubuntu/datascience/entity_linking_multilingual/entity_fish_docker/model/data/db/db-fr:/opt/entity-fishing/data/db/db-fr \
  -v /home/ubuntu/datascience/entity_linking_multilingual/entity_fish_docker/model/data/db/db-de:/opt/entity-fishing/data/db/db-de \
  -v /home/ubuntu/datascience/entity_linking_multilingual/entity_fish_docker/model/data/db/db-es:/opt/entity-fishing/data/db/db-es \
  -v /home/ubuntu/datascience/entity_linking_multilingual/entity_fish_docker/model/data/db/db-it:/opt/entity-fishing/data/db/db-it \
  -v /home/ubuntu/datascience/entity_linking_multilingual/entity_fish_docker/model/data/db/db-ar:/opt/entity-fishing/data/db/db-ar \
  -v /home/ubuntu/datascience/entity_linking_multilingual/entity_fish_docker/model/data/db/db-zh:/opt/entity-fishing/data/db/db-zh \
  -v /home/ubuntu/datascience/entity_linking_multilingual/entity_fish_docker/model/data/db/db-ru:/opt/entity-fishing/data/db/db-ru \
  -v /home/ubuntu/datascience/entity_linking_multilingual/entity_fish_docker/model/data/db/db-ja:/opt/entity-fishing/data/db/db-ja \
  -v /home/ubuntu/datascience/entity_linking_multilingual/entity_fish_docker/model/data/db/db-pt:/opt/entity-fishing/data/db/db-pt \
  -v /home/ubuntu/datascience/entity_linking_multilingual/entity_fish_docker/model/data/db/db-fa:/opt/entity-fishing/data/db/db-fa \
  -v /home/ubuntu/datascience/entity_linking_multilingual/entity_fish_docker/model/data/db/db-uk:/opt/entity-fishing/data/db/db-uk \
  -v /home/ubuntu/datascience/entity_linking_multilingual/entity_fish_docker/model/data/db/db-sv:/opt/entity-fishing/data/db/db-sv \
  -v /home/ubuntu/datascience/entity_linking_multilingual/entity_fish_docker/model/data/db/db-bn:/opt/entity-fishing/data/db/db-bn \
  -v /home/ubuntu/datascience/entity_linking_multilingual/entity_fish_docker/model/data/db/db-hi:/opt/entity-fishing/data/db/db-hi \
  grobid/entity-fishing:0.0.5

# # check of the deployed service is working 
# curl 'http://localhost:8090/service/disambiguate' -X POST -F "query={ 'text': 'The army, led by general Paul von Hindenburg defeated Russia in a series of battles collectively known as the First Battle of Tannenberg. But the failed Russian invasion, causing the fresh German troops to move to the east, allowed the tactical Allied victory at the First Battle of the Marne.', 'processSentence': [ 1 ], 'sentences': [ { 'offsetStart': 0, 'offsetEnd': 138 }, { 'offsetStart': 138, 'offsetEnd': 293 } ], 'entities': [ { 'rawName': 'Russian', 'type': 'NATIONAL', 'offsetStart': 153, 'offsetEnd': 160 } ] }"
