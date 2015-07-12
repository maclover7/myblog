jekyll build

s3cmd del --recursive s3://www.sparklingcode.co/about --verbose
s3cmd del --recursive s3://www.sparklingcode.co/css --verbose
s3cmd del --recursive s3://www.sparklingcode.co/jekyll --verbose
s3cmd del s3://www.sparklingcode.co/feed.xml --verbose
s3cmd del s3://www.sparklingcode.co/index.html --verbose

s3cmd sync --delete-removed _site/ s3://www.sparklingcode.co --verbose
