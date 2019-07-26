Class {
	#name : #PPJsonGrammarTest,
	#superclass : #PPCompositeParserTest,
	#category : #'PetitJson-Tests'
}

{ #category : #accessing }
PPJsonGrammarTest class >> packageNamesUnderTest [
	^ #('PetitJson')
]

{ #category : #utilities }
PPJsonGrammarTest >> assertInvalid: aString [
	self 
		should: [ self parse: aString ]
		raise: TestResult failure
		description: 'PetitParser could parse an invalid input'
]

{ #category : #accessing }
PPJsonGrammarTest >> parserClass [
	^ PPJsonParser
]

{ #category : #'testing-array' }
PPJsonGrammarTest >> testBigArray [
	self parse: ' [ "a" , "b" ] '.
	self assert: (result isKindOf: Array).
	self assert: result size = 2.
	self assert: result first = 'a'.
	self assert: result second = 'b'.
]

{ #category : #'testing-objects' }
PPJsonGrammarTest >> testBigObject [
	self parse: ' { "a" : 1 , "b" : 2 } '.
	self assert: (result isKindOf: Dictionary).
	self assert: result size = 2.
	self assert: (result at: 'a') = 1.
	self assert: (result at: 'b') = 2.
]

{ #category : #'testing-array' }
PPJsonGrammarTest >> testEmptyArray [
	self parse: '[]'.
	self assert: (result isKindOf: Array).
	self assert: result isEmpty
]

{ #category : #'testing-objects' }
PPJsonGrammarTest >> testEmptyObject [
	self parse: '{}'.
	self assert: (result isKindOf: Dictionary).
	self assert: result isEmpty
]

{ #category : #'testing-real' }
PPJsonGrammarTest >> testExplorerEvent [
	self parse: '{"recordset": null, "type": "change", "fromElement": null, "toElement": null, "altLeft": false, "keyCode": 0, "repeat": false, "reason": 0, "behaviorCookie": 0, "contentOverflow": false, "behaviorPart": 0, "dataTransfer": null, "ctrlKey": false, "shiftLeft": false, "dataFld": "", "qualifier": "", "wheelDelta": 0, "bookmarks": null, "button": 0, "srcFilter": null, "nextPage": "", "cancelBubble": false, "x": 89, "y": 502, "screenX": 231, "screenY": 1694, "srcUrn": "", "boundElements": {"length": 0}, "clientX": 89, "clientY": 502, "propertyName": "", "shiftKey": false, "ctrlLeft": false, "offsetX": 25, "offsetY": 2, "altKey": false}'.
	self assert: (result at: 'type') = 'change'.
	self assert: (result at: 'offsetY') = 2.
	self deny: (result at: 'altKey').
	self assert: (result at: 'dataTransfer') isNil.
	self assert: (result at: 'nextPage') = ''
]

{ #category : #'testing-literals' }
PPJsonGrammarTest >> testFalse [
	self deny: (self parse: 'false')
]

{ #category : #'testing-real' }
PPJsonGrammarTest >> testFirefoxEvent [
	self parse: '{"type": "change", "eventPhase": 2, "bubbles": true, "cancelable": true, "timeStamp": 0, "CAPTURING_PHASE": 1, "AT_TARGET": 2, "BUBBLING_PHASE": 3, "isTrusted": true, "MOUSEDOWN": 1, "MOUSEUP": 2, "MOUSEOVER": 4, "MOUSEOUT": 8, "MOUSEMOVE": 16, "MOUSEDRAG": 32, "CLICK": 64, "DBLCLICK": 128, "KEYDOWN": 256, "KEYUP": 512, "KEYPRESS": 1024, "DRAGDROP": 2048, "FOCUS": 4096, "BLUR": 8192, "SELECT": 16384, "CHANGE": 32768, "RESET": 65536, "SUBMIT": 131072, "SCROLL": 262144, "LOAD": 524288, "UNLOAD": 1048576, "XFER_DONE": 2097152, "ABORT": 4194304, "ERROR": 8388608, "LOCATE": 16777216, "MOVE": 33554432, "RESIZE": 67108864, "FORWARD": 134217728, "HELP": 268435456, "BACK": 536870912, "TEXT": 1073741824, "ALT_MASK": 1, "CONTROL_MASK": 2, "SHIFT_MASK": 4, "META_MASK": 8}'.
	self assert: (result at: 'type') = 'change'.
	self assert: (result at: 'eventPhase') = 2.
	self assert: (result at: 'bubbles').
	self assert: (result at: 'cancelable').
	self assert: (result at: 'BACK') = 536870912
]

{ #category : #'testing-invalid' }
PPJsonGrammarTest >> testInvalidArray [
	self assertInvalid: '['.
	self assertInvalid: '[1'.
	self assertInvalid: '[1,'.
	self assertInvalid: '[1,]'.
	self assertInvalid: '[1 2]'.
	self assertInvalid: '[]]'
]

{ #category : #'testing-invalid' }
PPJsonGrammarTest >> testInvalidFalse [
	self assertInvalid: 'fa'.
	self assertInvalid: 'falsely'.
	self assertInvalid: 'fabulous'
]

{ #category : #'testing-invalid' }
PPJsonGrammarTest >> testInvalidNull [
	self assertInvalid: 'nu'.
	self assertInvalid: 'nuclear'.
	self assertInvalid: 'nullified'
]

{ #category : #'testing-invalid' }
PPJsonGrammarTest >> testInvalidNumberInteger [
	self assertInvalid: '00'.
	self assertInvalid: '01'.
	self assertInvalid: '00.1'
]

{ #category : #'testing-invalid' }
PPJsonGrammarTest >> testInvalidObject [
	self assertInvalid: '{'.
	self assertInvalid: '{"a"'.
	self assertInvalid: '{"a":'.
	self assertInvalid: '{"a":"b"'.
	self assertInvalid: '{"a":"b",'.
	self assertInvalid: '{"a"}'.
	self assertInvalid: '{"a":}'.
	self assertInvalid: '{"a":"b",}'.
	self assertInvalid: '{}}'
]

{ #category : #'testing-invalid' }
PPJsonGrammarTest >> testInvalidString [
	self assertInvalid: '"'.
	self assertInvalid: '"a'.
	self assertInvalid: '"\"'.
	self assertInvalid: '"\a"'.
	self assertInvalid: '"\u"'.
	self assertInvalid: '"\u1"'.
	self assertInvalid: '"\u12"'.
	self assertInvalid: '"\u123"'.
	self assertInvalid: '"\u123x"'
]

{ #category : #'testing-invalid' }
PPJsonGrammarTest >> testInvalidTrue [
	self assertInvalid: 'tr'.
	self assertInvalid: 'trace'.
	self assertInvalid: 'truest'
]

{ #category : #'testing-array' }
PPJsonGrammarTest >> testNestedArray [
	self parse: '[[2]]'.
	self assert: (result isKindOf: Array).
	self assert: result size = 1.
	
	result := result first.
	self assert: (result isKindOf: Array).
	self assert: result size = 1.
	self assert: result first = 2.
]

{ #category : #'testing-objects' }
PPJsonGrammarTest >> testNestedObject [
	self parse: '{"object":{"1":"2"}} '.
	self assert: (result isKindOf: Dictionary).
	self assert: result size = 1.
	
	result := result at: 'object'.
	self assert: (result isKindOf: Dictionary).
	self assert: result size = 1.
	self assert: (result at: '1') = '2'.
]

{ #category : #'testing-literals' }
PPJsonGrammarTest >> testNull [
	self assert: (self parse: 'null') isNil
]

{ #category : #'testing-literals' }
PPJsonGrammarTest >> testNumberFloat [
	self assert: (self parse: '0.0') = 0.0.
	self assert: (self parse: '0.12') = 0.12.
	self assert: (self parse: '-0.12') = -0.12.
	self assert: (self parse: '12.34') = 12.34.
	self assert: (self parse: '-12.34') = -12.34.
	self assert: (self parse: '1.2e0') = 1.2.
	self assert: (self parse: '1.2e-1') = 1.2e-1.
	self assert: (self parse:  '1.2E-1') = 1.2e-1
]

{ #category : #'testing-literals' }
PPJsonGrammarTest >> testNumberInteger [
	self assert: (self parse: '0') = 0.
	self assert: (self parse: '1') = 1.
	self assert: (self parse: '-1') = -1.
	self assert: (self parse: '12') = 12.
	self assert: (self parse: '-12') = -12.
	self assert: (self parse: '1e2') = 100.
	self assert: (self parse: '1e+2') = 100
]

{ #category : #'testing-real' }
PPJsonGrammarTest >> testSafariEvent [
	self parse: '{"returnValue": true, "timeStamp": 1226697417289, "eventPhase": 2, "type": "change", "cancelable": false, "bubbles": true, "cancelBubble": false, "MOUSEOUT": 8, "FOCUS": 4096, "CHANGE": 32768, "MOUSEMOVE": 16, "AT_TARGET": 2, "SELECT": 16384, "BLUR": 8192, "KEYUP": 512, "MOUSEDOWN": 1, "MOUSEDRAG": 32, "BUBBLING_PHASE": 3, "MOUSEUP": 2, "CAPTURING_PHASE": 1, "MOUSEOVER": 4, "CLICK": 64, "DBLCLICK": 128, "KEYDOWN": 256, "KEYPRESS": 1024, "DRAGDROP": 2048}'.
	self assert: (result at: 'type') = 'change'.
	self assert: (result at: 'eventPhase') = 2.
	self assert: (result at: 'bubbles').
	self deny: (result at: 'cancelBubble').
	self deny: (result at: 'cancelable').
	self assert: (result at: 'BLUR') = 8192
]

{ #category : #'testing-array' }
PPJsonGrammarTest >> testSmallArray [
	self parse: '["a"]'.
	self assert: (result isKindOf: Array).
	self assert: result size = 1.
	self assert: result first = 'a'.
]

{ #category : #'testing-objects' }
PPJsonGrammarTest >> testSmallObject [
	self parse: '{"a":1}'.
	self assert: (result isKindOf: Dictionary).
	self assert: result size = 1.
	self assert: (result at: 'a') = 1
]

{ #category : #'testing-literals' }
PPJsonGrammarTest >> testString [
	self assert: (self parse: '""') = ''.
	self assert: (self parse: '"foo"') = 'foo'.
	self assert: (self parse: '"foo bar"') = 'foo bar'
]

{ #category : #'testing-literals' }
PPJsonGrammarTest >> testStringEscaped [
	self assert: (self parse: '"\""') = '"'.
	self assert: (self parse: '"\\"') = '\'.
	self assert: (self parse: '"\/"') = '/'.
	self assert: (self parse: '"\b"') = (String with: Character backspace).
	self assert: (self parse: '"\f"') = (String with: Character newPage).
	self assert: (self parse: '"\n"') = (String with: Character lf).
	self assert: (self parse: '"\r"') = (String with: Character cr).
	self assert: (self parse: '"\t"') = (String with: Character tab).
	self assert: (self parse: '"\u20Ac"') = (String with: (Character codePoint: 16r20AC))
]

{ #category : #'testing-literals' }
PPJsonGrammarTest >> testTrue [
	self assert: (self parse: 'true')
]
