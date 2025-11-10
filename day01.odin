package main

import "core:fmt"
import "core:os"

/// Day 1: Not Quite Lisp
not_quite_lisp :: proc() {
	file, open_err := os.open("day01.txt")
	if open_err != nil {
		fmt.printfln("OPEN FILE ERROR: {}", open_err)
		return
	}
	defer os.close(file)
	fmt.printfln("OPEN FILE OK: {}", open_err)

	bytes, read_err := os.read_entire_file_from_handle_or_err(file)
	if read_err != nil {
		fmt.printfln("READ FILE ERROR: {}", read_err)
		return
	}
	defer delete(bytes)
	fmt.printfln("READ FILE OK: {}", read_err)

	for byte, index in bytes {
		if index % 32 == 0 {
			fmt.printf("\n{}:\t", index)
		}
		fmt.printf("{} ", byte)
	}
}

