# install the cli:
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

wp --info

# connect to mysql with local db
# db name  = local
mysql local --user=root --password=root --socket=/Users/eric/Library/Application\ Support/Local/run/mhIA1B2sN/mysql/mysqld.sock

# scaffold tests for your plugin
wp scaffold plugin-tests your_plugin