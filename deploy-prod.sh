SOURCE_DIR="./shairspot-www-static/"
TARGET_DIR="s3://shairspot.com/"
CLOUDFRONT_ID="EM6MT12HQPI9S"
CLOUDFRONT_WWW_ID="E3RL9NHKRF2XY7"

aws s3 rm $TARGET_DIR --recursive
aws s3 cp $SOURCE_DIR $TARGET_DIR --recursive

aws cloudfront create-invalidation --distribution-id $CLOUDFRONT_ID --paths '/*'
aws cloudfront create-invalidation --distribution-id $CLOUDFRONT_WWW_ID --paths '/*'