Class {
	#name : #DudeUnclutterTest,
	#superclass : #TestCase,
	#category : #'SmallDude-Tests-Core'
}

{ #category : #testing }
DudeUnclutterTest >> testNoUnclutterNeeded [ 
	 
	| data uData | 
	data := (OrderedCollection new) 
		add: 10; 
		add: 8; 
		add: 6; 
		add: 4; 
		add: 2; 
		add: 0; 
		yourself. 
	uData := (DudeUnclutterEngine new: data) 
		upperBound: 12; 
		unclutteredWith: 2. 
	self assert: data == uData
]

{ #category : #testing }
DudeUnclutterTest >> testSomeUncluttering [ 
	 
	| data uData last | 
	data := (OrderedCollection new) 
		add: 20; 
		add: 13; 
		add: 12; 
		add: 11; 
		add: 10; 
		add: 9; 
		add: 8; 
		add: 7; 
		add: 0; 
		yourself. 
	uData := (DudeUnclutterEngine new: data) 
		upperBound: 22; 
		unclutteredWith: 2. 
	self assert: (data == uData) not. 
	last := 22.	"upperBound" 
	uData do: [:n | self assert: last - n >= 2]
]

{ #category : #testing }
DudeUnclutterTest >> testSomeUncluttering1 [ 
	 
	| data uData last | 
	data := (OrderedCollection new) 
		add: 20; 
		add: 13; 
		add: 12; 
		add: 11; 
		add: 10; 
		add: 9; 
		add: 8; 
		add: 7; 
		add: 6; 
		add: 0; 
		yourself. 
	uData := (DudeUnclutterEngine new: data) 
		upperBound: 22; 
		unclutteredWith: 2. 
	self assert: (data == uData) not. 
	last := 22.	"upperBound" 
	uData do: [:n | self assert: last - n >= 2]
]

{ #category : #testing }
DudeUnclutterTest >> testSomeUncluttering2 [ 
	 
	| data uData last | 
	data := (OrderedCollection new) 
		add: 20; 
		add: 12; 
		add: 12; 
		add: 11; 
		add: 10; 
		add: 9; 
		add: 7; 
		add: 7; 
		add: 0; 
		yourself. 
	uData := (DudeUnclutterEngine new: data) 
		upperBound: 22; 
		unclutteredWith: 2. 
	self assert: (data == uData) not. 
	last := 22.	"upperBound" 
	uData do: [:n | self assert: last - n >= 2]
]

{ #category : #testing }
DudeUnclutterTest >> testSomeUncluttering3 [ 
	 
	| data uData last | 
	data := (OrderedCollection new) 
		add: 20; 
		add: 20; 
		add: 20; 
		add: 20; 
		add: 20; 
		add: 20; 
		add: 20; 
		add: 20; 
		add: 20; 
		yourself. 
	uData := (DudeUnclutterEngine new: data) 
		upperBound: 22; 
		unclutteredWith: 2. 
	self assert: (data == uData) not. 
	last := 22.	"upperBound" 
	uData do: [:n | self assert: last - n >= 2]
]

{ #category : #testing }
DudeUnclutterTest >> testSomeUncluttering4 [ 
	 
	| data uData last | 
	data := (OrderedCollection new) 
		add: 50; 
		add: 60; 
		add: 70; 
		add: 50; 
		add: 60; 
		add: 70; 
		add: 50; 
		add: 60; 
		add: 70; 
		yourself. 
	uData := (DudeUnclutterEngine new: data) 
		upperBound: 22; 
		unclutteredWith: 2. 
	self assert: (data == uData) not. 
	last := 22.	"upperBound" 
	uData do: [:n | self assert: last - n >= 2]
]

{ #category : #testing }
DudeUnclutterTest >> testSomeUncluttering5 [ 
	 
	| data uData last | 
	data := (OrderedCollection new) 
		add: 20; 
		add: 2; 
		add: 70; 
		add: 50; 
		add: 60; 
		add: 70; 
		add: 50; 
		add: 60; 
		add: 70; 
		yourself. 
	uData := (DudeUnclutterEngine new: data) 
		upperBound: 22; 
		unclutteredWith: 2. 
	self assert: (data == uData) not. 
	last := 22.	"upperBound" 
	uData do: [:n | self assert: last - n >= 2]
]
