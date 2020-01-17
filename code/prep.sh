wget https://s3.amazonaws.com/research.metamind.io/wikitext/wikitext-103-v1.zip
unzip wikitext-103-v1.zip
cat wikitext-103/wiki.train.tokens wikitext-103/wiki.valid.tokens wikitext-103/wiki.test.tokens > data/wikitext.tokens
rm -rf wikitext-103
rm wikitext-103-v1.zip
#git clone https://github.com/kwonmha/bert-vocab-builder.git
/usr/bin/python3 bert-vocab-builder/subword_builder.py \
--corpus_filepattern "data/wikitext.tokens" \
--output_filename "data/vocab" \
--min_count 5
#git clone https://github.com/google-research/ALBERT.git
