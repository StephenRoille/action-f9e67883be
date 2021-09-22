KEYWORD=fix

run: build
	docker container run --rm stephenroille/action-f9e67883be $(KEYWORD)

build:
	docker image build -t stephenroille/action-f9e67883be .

test:
	./entrypoint.sh $(KEYWORD)
