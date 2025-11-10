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

	bytes, read_err := os.read_entire_file_from_handle_or_err(file)
	if read_err != nil {
		fmt.printfln("READ FILE ERROR: {}", read_err)
		return
	}
	defer delete(bytes)

	left_bracket_count: int
	right_bracket_count: int
	flor := 1
	enterence: int

	for byte, index in bytes {
		if byte == '(' {
			flor += 1
			left_bracket_count += 1
		}
		if byte == ')' {
			flor -= 1
			right_bracket_count += 1
		}
		if flor == 0 && enterence == 0 {
			enterence = index + 1
		}
	}

	fmt.println("--- Day 1: Not Quite Lisp ---")
	fmt.printfln("pt1: {}", left_bracket_count - right_bracket_count)
	fmt.printfln("pt2: {}", enterence)
}

