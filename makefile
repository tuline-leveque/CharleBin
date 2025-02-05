INSTR1 = ./vendor/bin/phpcs --extensions=php ./lib/
INSTR2 = ./vendor/bin/phpmd ./lib ansi codesize,unusedcode,naming
INSTR3 = find . -type f -path '*/lib*/*' -name '*.php' -exec php -l {} \;

install:
	bin/composer install

start:
	php -S localhost:8080

test:
	curl -s localhost:8080 | grep -q "<title>PrivateBin</title>"

lint:
	$(INSTR1) ; $(INSTR2) ; $(INSTR3)
