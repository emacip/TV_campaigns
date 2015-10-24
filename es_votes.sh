SERVER_URL="http://localhost:9200"
curl -XDELETE $SERVER_URL/votes/


echo "creating new index customers \n"
curl -XPUT $SERVER_URL/votes/ -d '{
  "mappings": {
    "vote": {
      "dynamic": false,
      "properties": {
        "campaign": {
          "type": "string"
        },
        "validity": {
          "type": "string"
        },
         "choice": {
          "type": "string"
        }
      }
    }
  }
}'