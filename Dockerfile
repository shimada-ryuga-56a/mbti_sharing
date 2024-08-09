#Docker Hubからruby:3.0.5のイメージをプルする
FROM ruby:3.3.4

#debian系のためapt-getを使用してnode.jsとyarnをインストール
RUN apt-get update -qq
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
&& apt-get install -y nodejs
RUN npm install --global yarn

#docker内の作業ディレクトリを作成＆設定
WORKDIR /mbti_sharing

#Gemfile,Gemfile.lockをローカルからCOPY
COPY Gemfile Gemfile.lock /mbti_sharing/

#コンテナ内にコピーしたGemfileを用いてbundel install
RUN bundle install

#railsを起動する
CMD ["rails", "server", "-b", "0.0.0.0"]