#!/bin/bash
# SPDX-License-Identifier: MIT
# Copyright (C) 2022 Da Xue

LOOP_checkPerm(){
	if [ ! -w /dev/loop-control ]; then
		echo "$FUNCNAME: no permission to control loop devices." >&2
		return 1
	fi
}

LOOP_setup(){
	if [ -z "$1" ]; then
		echo "$FUNCNAME: no file provided." >&2
		return 1
	fi
	if [ ! -f "$1" ]; then
		echo "$FUNCNAME: $1 is not a file." >&2
		return 1
	fi
	losetup -f --show "$1"
}

LOOP_detach(){
	if [ -z "$1" ]; then
		echo "$FUNCNAME: no loop device provided." >&2
		return 1
	fi
	if [ ! -b "$1" ]; then
		echo "$FUNCNAME: target is not a block device." >&2
		return 1
	fi
	losetup -d "$1"
}