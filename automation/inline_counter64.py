import os
import re
from subprocess import Popen
import shutil

def process(root, file, out):

	inlineAdd = " (set_global 11 (i64.add (get_global 11) (i64.const 1)))"
	inlineAnd = " (set_global 12 (i64.add (get_global 12) (i64.const 1)))"
	inlineShl = " (set_global 13 (i64.add (get_global 13) (i64.const 1)))"
	inlineShr = " (set_global 14 (i64.add (get_global 14) (i64.const 1)))"
	inlineXor = " (set_global 15 (i64.add (get_global 15) (i64.const 1)))"

	rAdd = re.compile("\s*\(i32.add\s*$")
	rAnd = re.compile("\s*\(i32.and\s*$")
	rShl = re.compile("\s*\(i32.shl\s*$")
	rShr = re.compile("\s*\(i32.shr_u\s*$")
	rXor = re.compile("\s*\(i32.xor\s*$")

	global_ = re.compile("\s*\(global\s*\(;(\d+);\).*$")
	type0 = re.compile("\s*\(type\s*\(;(\d+);\)\s*\(func\s*\(result\s*i32\)\)\).*$")

	wat2wasm = "wat2wasm"
	wasm2wat = "wasm2wat"

	fullPath = f"{root}/{file}"
	watFileName =  "%s.wat"%file.replace(".wasm", "").replace("-", '.')
	p1 = Popen([wasm2wat, fullPath, "-f", "-o", watFileName])

	p1.communicate() 


	inFileName = str(watFileName)

	outFileName = out + "/" + file.replace(".wasm", "") + ".profiled.wat"
	outWasm =  out + "/" + file.replace(".wasm", "") + ".profiled.wasm"

	outFileName = outFileName.replace("-", ".")
	outWasm = outWasm.replace("-", ".")

	with open(inFileName) as inFile:
		lines = inFile.read().splitlines()

	outLines = []

	index = -1
	lineNumber = 0
	type0Index = -1
	first_global = -1

	for i,line in enumerate(lines):
		if rAdd.match(line):
			line += inlineAdd
		elif rAnd.match(line):
			line += inlineAnd
		elif rShl.match(line):
			line += inlineShl
		elif rShr.match(line):
			line += inlineShr
		elif rXor.match(line):
			line += inlineXor

		if global_.match(line):
			index = int(global_.match(line).group(1))
			lineNumber = i

			if first_global == -1:
				line += "\n".join([
	'(func $_getI32AddCountLo (type %s) (result i32) '%type0Index,
		'(return (i32.wrap/i64 (get_global 11))))',
	'(func $_getI32AndCountLo (type %s)  (result i32)'%type0Index,
		'(return (i32.wrap/i64 (get_global 12))))',
	'(func $_getI32ShlCountLo (type %s)  (result i32)'%type0Index,
		'(return (i32.wrap/i64 (get_global 13))))',
	'(func $_getI32ShruCountLo (type %s)  (result i32)'%type0Index,
	'(return (i32.wrap/i64 (get_global 14))))',
	'(func $_getI32XorCountLo (type %s)  (result i32)'%type0Index,
		'(return (i32.wrap/i64 (get_global 15))))',
	'(func $_getI32AddCountHi (type %s)  (result i32)'%type0Index,
		'(return (i32.wrap/i64 (i64.div_s (get_global 11) (i64.const 4294967296)))))',
	'(func $_getI32AndCountHi (type %s)  (result i32)'%type0Index,
		'(return (i32.wrap/i64 (i64.div_s (get_global 12) (i64.const 4294967296)))))',
	'(func $_getI32ShlCountHi (type %s)  (result i32) '%type0Index,
		'(return (i32.wrap/i64 (i64.div_s (get_global 13) (i64.const 4294967296)))))',
	'(func $_getI32ShruCountHi (type %s)  (result i32) '%type0Index,
		'(return (i32.wrap/i64 (i64.div_s (get_global 14) (i64.const 4294967296)))))',
	'(func $_getI32XorCountHi (type %s)  (result i32) '%type0Index,
		'(return (i32.wrap/i64 (i64.div_s (get_global 15) (i64.const 4294967296)))))',
	'(func $_resetInstCounters (type 0) '
		'(set_global 11 (i64.const 0)))'
	])
				first_global = 1
		if type0.match(line):
			type0Index = type0.match(line).group(1)
		outLines.append(line)

	# add functions

	for i in range(index + 1, index + 18):
		outLines = outLines[:lineNumber + i - 1] + ["(global (;%s;) (mut i64) (i64.const 0))"%i] + outLines[lineNumber + i - 1:]


	# add export functions
	outLines = outLines[:lineNumber + i - 1] + [
		'(export "_getI32AddCountLo" (func $_getI32AddCountLo))',
		'(export "_getI32AndCountLo" (func $_getI32AndCountLo))',
		'(export "_getI32ShlCountLo" (func $_getI32ShlCountLo))',
		'(export "_getI32ShruCountLo" (func $_getI32ShruCountLo))',
		'(export "_getI32XorCountLo" (func $_getI32XorCountLo))',
		'(export "_getI32AddCountHi" (func $_getI32AddCountHi))',
		'(export "_getI32AndCountHi" (func $_getI32AndCountHi))',
		'(export "_getI32ShlCountHi" (func $_getI32ShlCountHi))',
		'(export "_getI32ShruCountHi" (func $_getI32ShruCountHi))',
		'(export "_getI32XorCountHi" (func $_getI32XorCountHi))',
		'(export "_resetInstCounters" (func $_resetInstCounters))'
	] + outLines[lineNumber + i - 1:]

	with open(outFileName, 'w+') as outFile:
		for line in outLines:
			outFile.write("%s\n" % line)

	# wat --> wasm
	p2 = Popen([wat2wasm, outFileName, "-o", outWasm])
	p2.communicate()
	os.remove(watFileName)

	return outWasm, outFileName