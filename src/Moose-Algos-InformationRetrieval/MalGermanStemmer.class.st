"
GermanStemmer stems German words.

Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalGermanStemmer,
	#superclass : #MalAbstractStemmer,
	#category : #'Moose-Algos-InformationRetrieval'
}

{ #category : #'private-algorithm' }
MalGermanStemmer >> isVowelAt: anIndex [
	
	^#eiauoyäöü includes: (string at: anIndex)
]

{ #category : #'private-algorithm' }
MalGermanStemmer >> performStemming: aString [
	
	string := aString.
	self toLowercase.
	self preprocessing.
	self setMarks.
	self step1.
	self step2.
	self step3.
	self toLowercase.
	string := string replaceAll: $ä with: $a.
	string := string replaceAll: $ö with: $o.
	string := string replaceAll: $ü with: $u.
	^string	"German includes the following accented forms, 
		ä  ö  ü 
	and a special letter, ß, equivalent to double s. 

	The following letters are vowels: 
		a   e   i   o   u   y   ä  ö  ü 
	First, replace √ü by ss, and put u and y between vowels into upper case. R1 and R2 are first set up in the standard way (see the note on R1 and R2), but then R1 is adjusted so that the region before it contains at least 3 letters. 

	Define a valid s-ending as one of b, d, f, g, h, k, l, m, n, r or t. 

	Define a valid st-ending as the same list, excluding letter r. 

	Do each of steps 1, 2 and 3. 

	Step 1: 
	Search for the longest among the following suffixes, 

		(a) e   em   en   ern   er   es
		(b) s (preceded by a valid s-ending) 

	and delete if in R1. (Of course the letter of the valid s-ending is not necessarily in R1) 
	(For example, äckern -> äck, ackers -> acker, armes -> arm) 

	Step 2: 
	Search for the longest among the following suffixes, 

		(a) en   er   est
		(b) st (preceded by a valid st-ending, itself preceded by at least 3 letters) 

	and delete if in R1. 
	(For example, derbsten -> derbst by step 1, and derbst -> derb by step 2, since b is a valid st-ending, and is preceded by just 3 letters) 

	Step 3:
	Search for the longest among the following suffixes, and perform the action indicated. 

	end   ung 
		delete if in R2 
		if preceded by ig, delete if in R2 and not preceded by e 

	ig   ik   isch 
		delete if in R2 and not preceded by e 

	lich   heit 
		delete if in R2 
		if preceded by er or en, delete if in R1 

	keit 
		delete if in R2 
		if preceded by lich or ig, delete if in R2 

	Finally, 
	turn U and Y back into lower case, and remove the umlaut accent from a, o and u."
]

{ #category : #'private-algorithm' }
MalGermanStemmer >> preprocessing [
	
	string := string copyReplaceAll: #ß with: #ss.
	2
		to: string size - 1
		do:
			[:index | 
			(((string at: index) == $u or: [(string at: index) == $y])
				and: [(self isVowelAt: index - 1) and: [self isVowelAt: index + 1]])
				ifTrue:
					[string
						at: index
						put: (string at: index) asUppercase]]
]

{ #category : #'private-algorithm' }
MalGermanStemmer >> setMarks [
	
	super setMarks.
	r1 < 3 ifTrue: [r1 := 3]
]

{ #category : #'private-algorithm' }
MalGermanStemmer >> step1 [
	
	#(#ern #em #en #er #es #e)
		do:
			[:suffix | (self endsWith: suffix in: r1) ifTrue: [^self removeSuffix]].
	(self endsWith: #s in: r1)
		ifTrue:
			[(#nrtdhlgmbfk includes: (string at: cursor)) ifTrue: [self removeSuffix]]
]

{ #category : #'private-algorithm' }
MalGermanStemmer >> step2 [
	
	#(#est #en #er)
		do:
			[:suffix | (self endsWith: suffix in: r1) ifTrue: [^self removeSuffix]].
	(self
		endsWith: #st
		in: (r1 max: 4))
		ifTrue:
			[(#ntdhlgmbfk includes: (string at: cursor)) ifTrue: [self removeSuffix]]
]

{ #category : #'private-algorithm' }
MalGermanStemmer >> step3 [
	
	| rule2 rule1 rule3 rule4 |
	rule2 := [(string at: cursor) ~~ $e ifTrue: [^self removeSuffix]].
	rule1 := [self removeSuffix.
	(self endsWith: #ig in: r2) ifTrue: [^rule2 value]].
	rule3 := [self removeSuffix.
	(self endsWith: #er in: r1) ifTrue: [^self removeSuffix].
	(self endsWith: #en in: r1) ifTrue: [^self removeSuffix]].
	rule4 := [self removeSuffix.
	(self endsWith: #lich in: r2) ifTrue: [^self removeSuffix].
	(self endsWith: #ig in: r2) ifTrue: [^self removeSuffix]].
	(self endsWith: #isch in: r2) ifTrue: [^rule2 value].
	(self endsWith: #lich in: r2) ifTrue: [^rule3 value].
	(self endsWith: #heit in: r2) ifTrue: [^rule3 value].
	(self endsWith: #keit in: r2) ifTrue: [^rule4 value].
	(self endsWith: #end in: r2) ifTrue: [^rule1 value].
	(self endsWith: #ung in: r2) ifTrue: [^rule1 value].
	(self endsWith: #ig in: r2) ifTrue: [^rule2 value].
	(self endsWith: #ik in: r2) ifTrue: [^rule2 value]	"rules := List new.
	rules add: 'isch' -> rule2.
	rules add: 'lich' -> rule3.
	rules add: 'heit' -> rule3.
	rules add: 'keit' -> rule4.
	rules add: 'end' -> rule1.
	rules add: 'ung' -> rule1.
	rules add: 'ig' -> rule2.
	rules add: 'ik' -> rule2.
	rules do: [ :each |
		(self endsWith: each key in: r2) ifTrue: [ ^each value value ] ]."
]

{ #category : #'private-algorithm' }
MalGermanStemmer >> toLowercase [
	"Converts the current string to lowercase (reimplemented here for performance reasons)."
	
	| copy |
	copy := string copy.
	1
		to: string size
		do:
			[:index | 
			| code |
			code := (string at: index) asInteger.
			(65 <= code and: [code <= 90])
				ifTrue:
					[copy
						at: index
						put: (Character value: code + 32)]].
	string := copy
]
