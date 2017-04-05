# Docker: Gitlab PHP CI

Used this docker image with Gitlab CI for Docker executor. This image is based on my image [voduytuan/docker-nginx-php](https://github.com/voduytuan/docker-nginx-php) with pre-installed PHP, Nginx.


## Contents
 * PHP 5.5.* ([ondrej](https://launchpad.net/~ondrej/+archive/php5)'s repos)
 * [Composer](https://getcomposer.org/)
 * [PHPUnit](http://phpunit.de/)
 * [PHP Copy/Paste Detector - phpcpd](https://github.com/sebastianbergmann/phpcpd)
 * [PHP Dead Code Detector - phpdcd](https://github.com/sebastianbergmann/phpdcd)
 * [Measuring the size and analyzing the structure of a PHP project - phploc](https://github.com/sebastianbergmann/phploc)
 * [PHP software metrics - pdepend](http://pdepend.org/)
 * [PHP Code sniffer- phpcs](http://pear.php.net/package/PHP_CodeSniffer)
 * [PHP Mess Detector - phpmd](http://phpmd.org/)
 * [Full-stack testing PHP framework - Codeception](http://codeception.com) 


## Get it
```sh
docker pull voduytuan/gitlab-php-ci
```

## Run it
Container is give you PHP's interactive mode by default:
```sh
docker run --rm -i -t voduytuan/gitlab-php-ci
```
Docker's [run command reference manual](http://docs.docker.io/en/latest/reference/run/)