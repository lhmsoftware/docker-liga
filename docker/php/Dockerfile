# ./docker/php/Dockerfile
FROM php:8.1-fpm

# Arguments taken from docker-compose.yml
ARG U_ID
ARG G_ID
ARG V_TS

RUN mkdir -p /usr/share/man/man1 mkdir -p /usr/share/man/man1
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils \
git \
zip \
unzip \
sudo \
vim \
wget \
pdftk \
gnupg \
curl \
sshpass \
libxml2-dev


RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-install calendar
RUN docker-php-ext-install opcache

# php.ini
RUN echo "opcache.memory_consumption=256" >> /usr/local/etc/php/php.ini \
&& echo "opcache.max_accelerated_files=20000" >> /usr/local/etc/php/php.ini \
&& echo "realpath_cache_size=4096K" >> /usr/local/etc/php/php.ini \
&& echo "realpath_cache_ttl=600" >> /usr/local/etc/php/php.ini

# ONLY in prod:
RUN echo $V_TS >> /usr/local/etc/php/php.ini

# Install Node.js and yarn package manager
RUN apt-get install --yes gnupg
RUN apt-get install --yes curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install --yes yarn 


RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.3.6 && chmod +x /usr/local/bin/composer
RUN curl -sL -o /var/cache/apt/archives/wkhtmltox_0.12.5-1.stretch_amd64.deb https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb && apt install --yes /var/cache/apt/archives/wkhtmltox_0.12.5-1.stretch_amd64.deb

# Add user and group docker
RUN groupadd --gid $G_ID docker
RUN useradd -m --uid $U_ID --gid $G_ID --groups sudo docker
RUN echo "docker:docker" | chpasswd

WORKDIR /usr/src/app
COPY apps/project_liga /usr/src/app

RUN mkdir -p config/jwt
RUN openssl genrsa -passout pass:restapi_base -out config/jwt/private.pem -aes256 4096
RUN openssl rsa -passin pass:restapi_base -pubout -in config/jwt/private.pem -out config/jwt/public.pem


RUN PATH=$PATH:/usr/src/apps/vendor/bin:bin
