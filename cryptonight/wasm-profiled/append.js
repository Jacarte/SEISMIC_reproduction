var _getI32AddCountLo = Module["_getI32AddCountLo"] = function() {  return Module["asm"]["_getI32AddCountLo"].apply(null, arguments) };
var _getI32AndCountLo = Module["_getI32AndCountLo"] = function() {  return Module["asm"]["_getI32AndCountLo"].apply(null, arguments) };
var _getI32ShlCountLo = Module["_getI32ShlCountLo"] = function() {  return Module["asm"]["_getI32ShlCountLo"].apply(null, arguments) };
var _getI32ShruCountLo = Module["_getI32ShruCountLo"] = function() {  return Module["asm"]["_getI32ShruCountLo"].apply(null, arguments) };
var _getI32XorCountLo = Module["_getI32XorCountLo"] = function() {  return Module["asm"]["_getI32XorCountLo"].apply(null, arguments) };
var _getI32AddCountHi = Module["_getI32AddCountHi"] = function() {  return Module["asm"]["_getI32AddCountHi"].apply(null, arguments) };
var _getI32AndCountHi = Module["_getI32AndCountHi"] = function() {  return Module["asm"]["_getI32AndCountHi"].apply(null, arguments) };
var _getI32ShlCountHi = Module["_getI32ShlCountHi"] = function() {  return Module["asm"]["_getI32ShlCountHi"].apply(null, arguments) };
var _getI32ShruCountHi = Module["_getI32ShruCountHi"] = function() {  return Module["asm"]["_getI32ShruCountHi"].apply(null, arguments) };
var _getI32XorCountHi = Module["_getI32XorCountHi"] = function() {  return Module["asm"]["_getI32XorCountHi"].apply(null, arguments) };
var _resetInstCounters = Module["_resetInstCounters"] = function() {  return Module["asm"]["_resetInstCounters"].apply(null, arguments) };

var writeAsciiToMemory = Module["writeAsciiToMemory"] = function(str, buffer, dontAddNull) {
  for (var i = 0; i < str.length; ++i) {
    HEAP8[((buffer++)>>0)]=str.charCodeAt(i);
  }
  // Null-terminate the pointer to the HEAP.
  if (!dontAddNull) HEAP8[((buffer)>>0)]=0;
}

/**
 * @license
 * Copyright 2010 The Emscripten Authors
 * SPDX-License-Identifier: MIT
 */

// === Auto-generated postamble setup entry stuff ===

var wasmProfiler = Module["wasmProfiler"] = function() {
	if (Module["asm"] != null && typeof _resetInstCounters === "function") {
        try{
            var addCountLo = new Uint32Array(1);
            var andCountLo = new Uint32Array(1);
            var shlCountLo = new Uint32Array(1);
            var shrCountLo = new Uint32Array(1);
            var xorCountLo = new Uint32Array(1);
            var addCountHi = new Uint32Array(1);
            var andCountHi = new Uint32Array(1);
            var shlCountHi = new Uint32Array(1);
            var shrCountHi = new Uint32Array(1);
            var xorCountHi = new Uint32Array(1);
            var addCount = new Uint32Array(1);
            var andCount = new Uint32Array(1);
            var shlCount = new Uint32Array(1);
            var shrCount = new Uint32Array(1);
            var xorCount = new Uint32Array(1);
                
            addCountLo[0] = _getI32AddCountLo();
            andCountLo[0] = _getI32AndCountLo();
            shlCountLo[0] = _getI32ShlCountLo();
            shrCountLo[0] = _getI32ShruCountLo();
            xorCountLo[0] = _getI32XorCountLo();
            addCountHi[0] = _getI32AddCountHi();
            andCountHi[0] = _getI32AndCountHi();
            shlCountHi[0] = _getI32ShlCountHi();
            shrCountHi[0] = _getI32ShruCountHi();
            xorCountHi[0] = _getI32XorCountHi();
            _resetInstCounters();	
            
            addCount[0] = addCountHi[0] * 4294967296 + addCountLo[0];
            andCount[0] = andCountHi[0] * 4294967296 + andCountLo[0];
            shlCount[0] = shlCountHi[0] * 4294967296 + shlCountLo[0];
            shrCount[0] = shrCountHi[0] * 4294967296 + shrCountLo[0];
            xorCount[0] = xorCountHi[0] * 4294967296 + xorCountLo[0];
            
            //console.log("("+addCountLo+","+andCountLo+","+shlCountLo+","+shrCountLo+","+xorCountLo+")");
            //console.log("("+addCountHi+","+andCountHi+","+shlCountHi+","+shrCountHi+","+xorCountHi+")");
            console.log("("+addCount[0]+","+andCount[0]+","+shlCount[0]+","+shrCount[0]+","+xorCount[0]+")");
        }
        catch{
            console.log("Loading...")
        }
	} else {
		console.log("Wasm not loaded yet");
	}
	
	setTimeout(wasmProfiler, 5000);
}
wasmProfiler()
