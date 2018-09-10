Class {
	#name : #DudeDetectorTest,
	#superclass : #TestCase,
	#category : #'SmallDude-Tests-Core'
}

{ #category : #testing }
DudeDetectorTest >> testCreationWithSomeEntities [
	| det entities exacts |
	entities := OrderedCollection new.
	entities
		add:
			(DudeDummyEntity new
				name: 'bogus'
				code:
					'I like pie  
pizza pie 
apple pie 
rad squared pi 
and other PIes 
').
	entities
		add:
			(DudeDummyEntity new
				name: 'bad_bogus'
				code:
					'and other PIes 
I like pie  
apple pie 
pizza pie 
').
	det := DudeDetector new: DudeCStyleFiles from: entities inModel: MooseModel new.
	exacts := det exactDupFor: (entities at: 1) and: (entities at: 2) withLength: 1.
	self assert: det ~= nil.
	self assert: exacts size equals: 4
]

{ #category : #testing }
DudeDetectorTest >> testDDChunkSizeOneOnEdges [
	| det entities dupList dup |
	entities := OrderedCollection new.
	entities
		add:
			(DudeDummyEntity new
				name: 'aSource'
				code:
					' 
x 
a 
b 
c 
t 
').
	entities
		add:
			(DudeDummyEntity new
				name: 'yetAnotherSource'
				code:
					' 
x 
h 
j 
t 
').
	det := DudeDetector new: DudeCStyleFiles from: entities inModel: MooseModel new.
	dupList := ((det getMultiplicationsWith: 4 withSizeOfExactChunk: 1 withLineBias: 3) at: 1) duplications.	"Transcript show: (dupList toString);cr."
	self assert: det ~= nil.
	self assert: dupList ~= nil.
	self assert: dupList size equals: 1.
	dup := dupList at: 1.
	self
		assert:
			((dup signature = 'E1.D1.M2.E1' and: [ dup referenceCode entity = (entities at: 1) ])
				or: [ dup signature = 'E1.I1.M2.E1' and: [ dup duplicateCode entity = (entities at: 1) ] ])
]

{ #category : #testing }
DudeDetectorTest >> testDDExactChunkSize [
	| det entities dupList dup |
	entities := OrderedCollection new.
	entities
		add:
			(DudeDummyEntity new
				name: 'aSource'
				code:
					' 
x 
y 
sdfs 
z 
t 
').
	entities
		add:
			(DudeDummyEntity new
				name: 'yetAnotherSource'
				code:
					' 
x 
t 
y 
z 
t 
').
	det := DudeDetector new: DudeCStyleFiles from: entities inModel: MooseModel new.
	dupList := ((det getMultiplicationsWith: 4 withSizeOfExactChunk: 1 withLineBias: 2) at: 1) duplications.	"Transcript show: (dupList toString);cr."
	self assert: det notNil.
	self assert: dupList notNil.
	self assert: dupList size equals: 1.
	dup := dupList at: 1.
	self
		assert:
			((dup signature = 'E1.I1.E1.D1.E2' and: [dup referenceCode entity = (entities at: 1)])
				or: [ dup signature = 'E1.M2.E2' and: [dup duplicateCode entity = (entities at: 1)] ])
]

{ #category : #testing }
DudeDetectorTest >> testDDOnSomeEntities [
	| det entities dupList |
	entities := OrderedCollection new.
	entities
		add:
			(DudeDummyEntity new
				name: 'bogus'
				code:
					' 
xxx 
aaa 
aaa 
qqq 
ddd 
eee 
').
	entities
		add:
			(DudeDummyEntity new
				name: 'bad_bogus'
				code:
					' 
qqq 
aaa 
aaa 
ddd 
eee 
').
	det := DudeDetector new: DudeCStyleFiles from: entities inModel: MooseModel new.
	dupList := det getExactDuplications: 2.	"Transcript show: (dupList toString);cr."
	self assert: det ~= nil.
	self assert: dupList ~= nil.
	self assert: dupList size equals: 2
]

{ #category : #testing }
DudeDetectorTest >> testDDOnSomeMoreEntities [
	| det entities dupList |
	entities := OrderedCollection new.
	entities
		add:
			(DudeDummyEntity new
				name: 'bogus'
				code:
					' 
a 
b 
c 
d 
a 
b 
c 
d 
e 
f 
g 
').
	entities
		add:
			(DudeDummyEntity new
				name: 'bad_bogus'
				code:
					' 
d 
e 
f 
g 
d 
e 
').
	entities
		add:
			(DudeDummyEntity new
				name: 'really_bad_bogus'
				code:
					' 
f 
g 
a 
b 
c 
d 
').
	det := DudeDetector new: DudeCStyleFiles from: entities inModel: MooseModel new.
	dupList := det getExactDuplications: 3.
	self assert: det ~= nil.
	self assert: dupList ~= nil.
	self assert: dupList size equals: 4
]

{ #category : #testing }
DudeDetectorTest >> testDDOnSomeOtherEntities [
	| det entities dupList |
	entities := OrderedCollection new.
	entities
		add:
			(DudeDummyEntity new
				name: 'bogus'
				code:
					'
xxx 
zzz 
aaa 
aaa 
qqq 
ddd 
eee 
').
	entities
		add:
			(DudeDummyEntity new
				name: 'bad_bogus'
				code:
					'
zzz 
aaa 
aaa 
qqq 
ddd 
eee 
').
	entities
		add:
			(DudeDummyEntity new
				name: 'really_bad_bogus'
				code:
					'
zzz 
aaa 
aaa 
').
	det := DudeDetector new: DudeCStyleFiles from: entities inModel: MooseModel new.
	dupList := det getExactDuplications: 2.	"Transcript show: (dupList toString);cr."
	self assert: det ~= nil.
	self assert: dupList ~= nil.
	self assert: dupList size equals: 3
]

{ #category : #testing }
DudeDetectorTest >> testDDWithChainsOnIdenticalEntities [
	| det entities dupList |
	entities := OrderedCollection new.
	entities
		add:
			(DudeDummyEntity new
				name: 'bogus'
				code:
					' 
a 
b 
c 
d 
f 
g 
').
	entities
		add:
			(DudeDummyEntity new
				name: 'bad_bogus'
				code:
					' 
a 
b 
c 
d 
f 
g 
').
	det := DudeDetector new: DudeCStyleFiles from: entities inModel: MooseModel new.
	dupList := ((det getMultiplicationsWith: 4 withSizeOfExactChunk: 2 withLineBias: 2) at: 1) duplications.	"Transcript show: (dupList toString);cr."
	self assert: det ~= nil.
	self assert: dupList ~= nil.
	self assert: dupList size equals: 1.
	self assert: (dupList at: 1) signature equals: 'E6'
]

{ #category : #testing }
DudeDetectorTest >> testDDWithChainsOnSomeMoreEntities [
	| det entities dupList |
	entities := OrderedCollection new.
	entities
		add:
			(DudeDummyEntity new
				name: 'bogus'
				code:
					' 
a 
b 
c 
d 
e 
f 
g 
').
	entities
		add:
			(DudeDummyEntity new
				name: 'bad_bogus'
				code:
					' 
a 
b 
c 
asda 
asd 
d 
e 
f 
g 
').
	entities
		add:
			(DudeDummyEntity new
				name: 'aSource'
				code:
					' 
x 
y 
sdfs 
z 
t 
').
	entities
		add:
			(DudeDummyEntity new
				name: 'anotherSource'
				code:
					' 
x 
y 
xyc 
z 
t 
').
	entities
		add:
			(DudeDummyEntity new
				name: 'really_bad_bogus'
				code:
					' 
a 
b 
c 
ee 
f 
g 
').
	entities
		add:
			(DudeDummyEntity new
				name: 'yetAnotherSource'
				code:
					' 
x 
t 
y 
z 
t 
').
	det := DudeDetector new: DudeCStyleFiles from: entities inModel: MooseModel new.
	dupList := ((det getMultiplicationsWith: 4 withSizeOfExactChunk: 2 withLineBias: 2)
		collect: [ :aMulti | aMulti duplications ]) flatten.	"Transcript show: (dupList toString);cr."
	self assert: det ~= nil.
	self assert: dupList ~= nil.
	self assert: dupList size equals: 3	"self assert: ((dupList at: 1) signature = 'E3.I2.E4'). 
	self assert: ((dupList at: 2) signature = 'E3.D1.M1.E2'). 
	self assert: ((dupList at: 3) signature = 'E2.M1.E2')."
]

{ #category : #testing }
DudeDetectorTest >> testDDWithChainsOnTwoEntities [
	| det entities dupList |
	entities := OrderedCollection new.
	entities
		add:
			(DudeDummyEntity new
				name: 'bogus'
				code:
					' 
a 
b 
c 
d 
f 
g 
').
	entities
		add:
			(DudeDummyEntity new
				name: 'bad_bogus'
				code:
					' 
a 
b 
c 
as 
f 
g 
').
	det := DudeDetector new: DudeCStyleFiles from: entities inModel: MooseModel new.
	dupList := ((det getMultiplicationsWith: 4 withSizeOfExactChunk: 2 withLineBias: 2) at: 1) duplications.	"Transcript show: (dupList toString);cr."
	self assert: det ~= nil.
	self assert: dupList ~= nil.
	self assert: dupList size equals: 1.
	self assert: (dupList at: 1) signature equals: 'E3.M1.E2'
]

{ #category : #testing }
DudeDetectorTest >> testDudeSourceCodeLine [
	| entities det |
	entities := OrderedCollection new.
	entities
		add:
			(DudeDummyEntity new
				name: 'aSource'
				code:
					' 

toto
{
sdfs 
// dcjdfhj
}
titi
').
	det := DudeDetector new: DudeCStyleFiles from: entities inModel: nil.
	self assert: det codeBase size equals: 1.
	self assert: det codeBase values first size equals: 3.
	self assert: det codeBase values first first lineno equals: 3.
	self assert: det codeBase values first second lineno equals: 5.
	self assert: det codeBase values first third lineno equals: 8
]

{ #category : #testing }
DudeDetectorTest >> testDupWithCorrectLinenoNoBias [
	| det mult ent1 ent2  dup ent1RefCode ent2RefCode |
	ent1 := DudeDummyEntity new
		name: 'aSource'
		code:
			' 

toto
{
sdfs 
// dcjdfhj
}
titi
'.
	ent2 := DudeDummyEntity new
		name: 'otherSource'
		code:
			' toto
{
sdfs
}
titi
'.
	det := DudeDetector
		new: DudeCStyleFiles
		from:
			{ent1.
			ent2}
		inModel: MooseModel new.
	mult := det getMultiplicationsWith: 3 withSizeOfExactChunk: 3 withLineBias: 0.
	self assert: mult size equals: 1.
	self assert: mult first duplications size equals: 1.
	dup := mult first duplications first.
	ent1RefCode := dup referenceCode entity = ent1
		ifTrue: [ dup referenceCode ] ifFalse: [ dup duplicateCode ].
	ent2RefCode := dup referenceCode entity = ent2
		ifTrue: [ dup referenceCode ] ifFalse: [ dup duplicateCode ].
	self assert: ent1RefCode beginLine equals: 3.
	self assert: ent1RefCode endLine equals: 8.
	self assert: ent1RefCode fragmentLength equals: 3.
	self assert: ent2RefCode beginLine equals: 1.
	self assert: ent2RefCode endLine equals: 5.
	self assert: ent2RefCode fragmentLength equals: 3.
	
]

{ #category : #testing }
DudeDetectorTest >> testDupWithCorrectLinenoWithBias [
	| det mult ent1 ent2  dup ent1RefCode ent2RefCode |
	ent1 := DudeDummyEntity new
		name: 'aSource'
		code:
			' 

toto
{
aBiasLine
sdfs 
// dcjdfhj
}
titi
'.
	ent2 := DudeDummyEntity new
		name: 'otherSource'
		code:
			' toto
{
sdfs
}
aBiasLine
titi
'.
	det := DudeDetector
		new: DudeCStyleFiles
		from:
			{ent1.
			ent2}
		inModel: MooseModel new.
	mult := det getMultiplicationsWith: 3 withSizeOfExactChunk: 1 withLineBias: 2.
	self assert: mult size equals: 1.
	self assert: mult first duplications size equals: 1.
	dup := mult first duplications first.
	ent1RefCode := dup referenceCode entity = ent1
		ifTrue: [ dup referenceCode ] ifFalse: [ dup duplicateCode ].
	ent2RefCode := dup referenceCode entity = ent2
		ifTrue: [ dup referenceCode ] ifFalse: [ dup duplicateCode ].
	self assert: ent1RefCode beginLine equals: 3.
	self assert: ent1RefCode endLine equals: 9.
	self assert: ent1RefCode fragmentLength equals: 4.
	self assert: ent2RefCode beginLine equals: 1.
	self assert: ent2RefCode endLine equals: 6.
	self assert: ent2RefCode fragmentLength equals: 4.
	
]

{ #category : #testing }
DudeDetectorTest >> testDuplicationDetectionWithLevenshteinStrategy [
	| det entities dupList |
	entities := OrderedCollection new.
	entities
		add:
			(DudeDummyEntity new
				name: 'bogus'
				code:
					'
xxx
aaa
aba
qqq
ddd
eee
').
	entities
		add:
			(DudeDummyEntity new
				name: 'bad_bogus'
				code:
					'
qqq
aaa
aaa
ddd
eee
').
	det := DudeDetector
		new: DudeCStyleFiles
		from: entities
		withStrategy: (DudeLevenshteinDistanceStrategy new threshold: 0.5) getStrategyBlock
		inModel: MooseModel new.
	dupList := det getExactDuplications: 2.	"Transcript show: (dupList toString);cr."
	self assert: det ~= nil.
	self assert: dupList ~= nil.
	self assert: dupList size equals: 2
]

{ #category : #testing }
DudeDetectorTest >> testWithNoEntities [ 
	 
	| det | 
	det := DudeDetector 
		new: DudeCStyleFiles 
		from: OrderedCollection new 
		inModel: MooseModel new. 
	self assert: det ~= nil
]
