cd data
wget https://s3.amazonaws.com/research.metamind.io/wikitext/wikitext-103-v1.zip
wget https://storage.googleapis.com/albert_models/albert_base_v1.tar.gz
tar -xzvf albert_base_v1.tar.gz
rm albert_base_v1.tar.gz
#wget https://storage.googleapis.com/albert_models/albert_large_v1.tar.gz
#wget https://storage.googleapis.com/albert_models/albert_xlarge_v1.tar.gz
unzip wikitext-103-v1.zip
cat wikitext-103/wiki.train.tokens wikitext-103/wiki.valid.tokens wikitext-103/wiki.test.tokens > wikitext.tokens
rm -rf wikitext-103
rm wikitext-103-v1.zip
cd ..
#git clone https://github.com/kwonmha/bert-vocab-builder.git
python bert-vocab-builder/subword_builder.py \
--corpus_filepattern "data/wikitext.tokens" \
--output_filename "data/vocab" \
--min_count 5
#git clone https://github.com/google-research/ALBERT.git
python ALBERT/create_pretraining_data.py \
 --input_file="data/wikitext.tokens" \
 --output_file="data/albert_pretrain_file" \
 --vocab_file="data/vocab"

python run_pretraining.py \
 --input_file="data/albert_pretrain_file" \
 --output_dir='data/'
 --albert_config_file='data/albert_config_file'
