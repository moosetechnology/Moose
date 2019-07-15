Class {
	#name : #DudeDuplicationTest,
	#superclass : #TestCase,
	#category : #'SmallDude-Tests-Core'
}

{ #category : #testing }
DudeDuplicationTest >> testAccesses [
	| aDuplication codeFragment1 codeFragment2 aSignature string1 string2 aMethod |
	aSignature := 'E12.M1.E3.I1.E4'.
	string1 := 'firstMethod'.
	string2 := 'a = 2; b = 3; return a + b;'.
	aMethod := DudeDummyEntity name: string1 code: string2.
	codeFragment1 := DudeSourceCodeFragment
		entity: aMethod
		beginLine: 23
		endLine: 25
		fragmentLength: 3.
	string1 := 'secondMethod'.
	string2 := 'a = 0; return a + 4;'.
	aMethod := DudeDummyEntity name: string1 code: string2.
	codeFragment2 := DudeSourceCodeFragment
		entity: aMethod
		beginLine: 23
		endLine: 25
		fragmentLength: 3.
	aDuplication := DudeDuplication refCode: codeFragment1 dupCode: codeFragment2 signature: aSignature.
	self assert: aDuplication copiedLength equals: 19.
	self assert: aDuplication realLength equals: 3.
	self assert: aDuplication duplicateCode equals: codeFragment2.
	self assert: aDuplication referenceCode equals: codeFragment1.
	self assert: aDuplication signature equals: aSignature
]

{ #category : #testing }
DudeDuplicationTest >> testGetChainLength [
	| aDuplication codeFragment1 codeFragment2 aSignature string1 string2 aMethod |
	aSignature := 'E12.M1.E3.I1.E4'.
	string1 := 'firstMethod'.
	string2 := 'a = 2; b = 3; return a + b;'.
	aMethod := DudeDummyEntity wrappedName: string1 code: string2.
	codeFragment1 := DudeSourceCodeFragment
		entity: aMethod
		beginLine: 23
		endLine: 25
		fragmentLength: 3.
	string1 := 'secondMethod'.
	string2 := 'a = 0; return a + 4;'.
	aMethod := DudeDummyEntity wrappedName: string1 code: string2.
	codeFragment2 := DudeSourceCodeFragment
		entity: aMethod
		beginLine: 23
		endLine: 25
		fragmentLength: 3.
	aDuplication := DudeDuplication refCode: codeFragment1 dupCode: codeFragment2 signature: aSignature.
	self assert: aDuplication copiedLength equals: 19
]

{ #category : #testing }
DudeDuplicationTest >> testInstantiation [
	| aDuplication codeFragment1 codeFragment2 aSignature string1 string2 aMethod |
	aSignature := 'E12M1E3I1E4'.
	string1 := 'firstMethod'.
	string2 := 'a = 2; b = 3; return a + b;'.
	aMethod := DudeDummyEntity wrappedName: string1 code: string2.
	codeFragment1 := DudeSourceCodeFragment
		entity: aMethod
		beginLine: 23
		endLine: 25
		fragmentLength: 3.
	string1 := 'secondMethod'.
	string2 := 'a = 0; return a + 4;'.
	aMethod := DudeDummyEntity wrappedName: string1 code: string2.
	codeFragment2 := DudeSourceCodeFragment
		entity: aMethod
		beginLine: 23
		endLine: 25
		fragmentLength: 3.
	aDuplication := DudeDuplication refCode: codeFragment1 dupCode: codeFragment2 signature: aSignature.
	self assert: (aDuplication = nil) not
]

{ #category : #testing }
DudeDuplicationTest >> testIsNotSelfDuplication [
	| aDuplication codeFragment1 codeFragment2 aSignature string1 string2 aMethod bMethod |
	aSignature := 'E12M1E3I1E4'.
	string1 := 'firstMethod'.
	string2 := 'a = 2; b = 3; return a + b;'.
	aMethod := DudeDummyEntity name: string1 code: string2.
	codeFragment1 := DudeSourceCodeFragment
		entity: aMethod
		beginLine: 23
		endLine: 25
		fragmentLength: 3.
	string1 := 'secondMethod'.
	string2 := 'a = 0; return a + 4;'.
	bMethod := DudeDummyEntity name: string1 code: string2.
	codeFragment2 := DudeSourceCodeFragment
		entity: bMethod
		beginLine: 23
		endLine: 25
		fragmentLength: 3.
	aDuplication := DudeDuplication refCode: codeFragment1 dupCode: codeFragment2 signature: aSignature.
	self assert: (aDuplication isSelfDuplicationOf: aMethod) not.
	self assert: (aDuplication isSelfDuplicationOf: bMethod) not
]

{ #category : #testing }
DudeDuplicationTest >> testIsSelfDuplication [
	| aDuplication codeFragment1 codeFragment2 aSignature string1 string2 aMethod |
	aSignature := 'E12M1E3I1E4'.
	string1 := 'aMethod'.
	string2 := 'a = 2; b = 3; return a + b;'.
	aMethod := DudeDummyEntity name: string1 code: string2.
	codeFragment1 := DudeSourceCodeFragment
		entity: aMethod
		beginLine: 23
		endLine: 25
		fragmentLength: 3.
	codeFragment2 := DudeSourceCodeFragment
		entity: aMethod
		beginLine: 27
		endLine: 28
		fragmentLength: 2.
	aDuplication := DudeDuplication refCode: codeFragment1 dupCode: codeFragment2 signature: aSignature.
	self assert: (aDuplication isSelfDuplicationOf: aMethod)
]

{ #category : #testing }
DudeDuplicationTest >> testMakeInvert [
	| aDuplication codeFragment1 codeFragment2 aSignature string1 string2 aMethod invertedDuplication |
	aSignature := 'E12M1E3I1E4'.
	string1 := 'firstMethod'.
	string2 := 'a = 2; b = 3; return a + b;'.
	aMethod := DudeDummyEntity wrappedName: string1 code: string2.
	codeFragment1 := DudeSourceCodeFragment
		entity: aMethod
		beginLine: 23
		endLine: 25
		fragmentLength: 3.
	string1 := 'secondMethod'.
	string2 := 'a = 0; return a + 4;'.
	aMethod := DudeDummyEntity wrappedName: string1 code: string2.
	codeFragment2 := DudeSourceCodeFragment
		entity: aMethod
		beginLine: 23
		endLine: 25
		fragmentLength: 3.
	aDuplication := DudeDuplication refCode: codeFragment1 dupCode: codeFragment2 signature: aSignature.
	self assert: ((invertedDuplication := aDuplication makeInvert) = nil) not.
	self assert: invertedDuplication signature equals: 'E12M1E3D1E4'
]

{ #category : #testing }
DudeDuplicationTest >> testPrinting [
	| aDuplication codeFragment1 codeFragment2 aSignature string1 string2 aMethod |
	aSignature := 'E12M1E3I1E4'.
	string1 := 'firstMethod'.
	string2 := 'a = 2; b = 3; return a + b;'.
	aMethod := DudeDummyEntity wrappedName: string1 code: string2.
	codeFragment1 := DudeSourceCodeFragment
		entity: aMethod
		beginLine: 23
		endLine: 25
		fragmentLength: 3.
	string1 := 'secondMethod'.
	string2 := 'a = 0; return a + 4;'.
	aMethod := DudeDummyEntity wrappedName: string1 code: string2.
	codeFragment2 := DudeSourceCodeFragment
		entity: aMethod
		beginLine: 23
		endLine: 25
		fragmentLength: 3.
	aDuplication := DudeDuplication refCode: codeFragment1 dupCode: codeFragment2 signature: aSignature.
	self assert: (aDuplication toString = '') not
]
