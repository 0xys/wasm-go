

.PHONY: wabt
wabt:
	docker build -t wabt .

.PHONY: wasm
wasm:
	echo TBD

.PHONY: wat2wasm
wat2wasm:
	docker run --name wabt --mount type=bind,source="$(PWD)"/io,target=/app -d wabt
