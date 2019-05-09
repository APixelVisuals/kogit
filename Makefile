BIN = $(firstword $(subst :, , $(PATH)))

install:
	mkdir -p $(BIN)
	cp ./kogit.sh $(BIN)/kogit
	cp -r ./kogit-modules/ $(BIN)/kogit-modules/

uninstall:
	rm $(BIN)/kogit
	rm -rf $(BIN)/kogit-modules/