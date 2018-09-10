Extension { #name : #PPParser }

{ #category : #'*petitislands' }
PPParser >> acceptsEpsilon [
	"
		return true, if parser can accepts epsilon without a failure.
		
		Use #neverFails if parser never fail, no matter what is the input.
		The #isNullable semantics is a mystery for me. I think it is something 
		like acceptsEpsilon and is used for first/set computation.
	"
	^ self subclassResponsibility
]

{ #category : #'*petitislands' }
PPParser >> acceptsEpsilonOpenSet: set [
	"private helper for acceptsEmpsilon that makes sure to avoid cycles (using open set)"
	self children isEmpty ifTrue: [ ^ self acceptsEpsilon ].
	
	self shouldBeImplemented .
]

{ #category : #'*petitislands' }
PPParser >> isIslandBorder [
	^ self subclassResponsibility
]

{ #category : #'*petitislands' }
PPParser >> isIslandBorderOpenSet: set [
	"private helper for acceptsEmpsilon that makes sure to avoid cycles (using open set)"
	self children isEmpty ifTrue: [ ^ self isIslandBorder ].
	
	self shouldBeImplemented .
]

{ #category : #'*petitislands' }
PPParser >> isWater [
	^ false
]

{ #category : #'*petitislands' }
PPParser >> island [
	self deprecated: 'use sea instead'.
	^ self sea
]

{ #category : #'*petitislands' }
PPParser >> island: water [
	self halt: 'deprecated'.
	^ self sea: water
]

{ #category : #'*petitislands' }
PPParser >> next: context [
	^ PPChoiceParser withAll: (self nextSet: context)
]

{ #category : #'*petitislands' }
PPParser >> nextSet: aPPContext [
	^ aPPContext root nextSets at: self.
]

{ #category : #'*petitislands' }
PPParser >> nextSets [
	| nextSets |
	
	nextSets := IdentityDictionary new.
	self allParsersDo: [ :each | nextSets at: each put: IdentitySet new ].
	
	(nextSets at: self) add: PPSentinel instance.
	
	[ 	| changed |
		changed := false.
	
		nextSets keysAndValuesDo: [:parser :next |
			changed := (parser 
				nextSets: nextSets
				into: next) or: [ changed ].
		].
		changed ] whileTrue.
	
	^ nextSets
]

{ #category : #'*petitislands' }
PPParser >> nextSets: aNextDictionary into: aSet [
	"return true/false, if something has changed or not...."
	| childSet change tally |
	
	change := false.

	self children do: [:each | 
		childSet := aNextDictionary at: each.
		tally := childSet size.
		childSet addAll: aSet.
		change := change or: [ tally ~= childSet size ].
	].

	^ change
	
]

{ #category : #'*petitislands' }
PPParser >> nonEmpty [
	^ PPNonEmptyParser on: self
]

{ #category : #'*petitislands' }
PPParser >> previous [
	^ PPPreviousParser on: self
]

{ #category : #'*petitislands' }
PPParser >> sea [
	| island |
	island := PPSea new
		island: self;
		yourself.
		
	^ island memoized

]

{ #category : #'*petitislands' }
PPParser >> sea: water [
	^ self sea
		water: water;
		yourself

]
