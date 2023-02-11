FROM gcc:12.2.0

RUN apt-get update && apt-get -y install cmake
RUN cmake --version

RUN apt-get install ninja-build
RUN ninja --version

WORKDIR /
RUN git clone --recursive https://github.com/WebAssembly/wabt

WORKDIR /wabt
RUN make gcc-release

CMD ["/wabt/bin/wat2wasm", "/app/simple.wat", "-o", "/app/simple.wasm"]
