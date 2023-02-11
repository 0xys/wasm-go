package main

import (
	"fmt"
	"io/ioutil"

	wasmer "github.com/wasmerio/wasmer-go/wasmer"
)

func main() {
	if err := run(); err != nil {
		panic(err)
	}
}

func run() error {
	wasmBytes, err := ioutil.ReadFile("./io/simple.wasm")
	if err != nil {
		return err
	}

	engine := wasmer.NewEngine()
	store := wasmer.NewStore(engine)

	module, err := wasmer.NewModule(store, wasmBytes)
	if err != nil {
		return err
	}

	importObject := wasmer.NewImportObject()
	instance, err := wasmer.NewInstance(module, importObject)
	if err != nil {
		return err
	}

	sum, err := instance.Exports.GetFunction("sum")
	if err != nil {
		return err
	}

	result, err := sum(5, 37)
	if err != nil {
		return err
	}
	fmt.Println(result)

	return nil
}
