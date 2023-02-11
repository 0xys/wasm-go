
WABT_NAME ?= wabt

.PHONY: wabt
wabt:
	docker build -t $(WABT_NAME) .

.PHONY: wasm
wasm:
	docker run --name $(WABT_NAME) --mount type=bind,source="$(PWD)"/io,target=/app -d $(WABT_NAME)

.PHONY: clean
clean:
	docker container rm $(WABT_NAME)
