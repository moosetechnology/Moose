Class {
	#name : #SmaCCAbstractRewrite,
	#superclass : #Model,
	#instVars : [
		'parent',
		'properties'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #changing }
SmaCCAbstractRewrite >> changed: aSymbol [
	super changed: aSymbol.
	self announcer announce: aSymbol.
	self modified
]

{ #category : #rewriting }
SmaCCAbstractRewrite >> clearLocalVariablesIn: aClass [
	
]

{ #category : #printing }
SmaCCAbstractRewrite >> displayOn: aStream [
	self subclassResponsibility
]

{ #category : #printing }
SmaCCAbstractRewrite >> displayString [
	| stream |
	stream := WriteStream on: String new.
	self displayOn: stream.
	^ stream contents
]

{ #category : #'initialize-release' }
SmaCCAbstractRewrite >> engine: aSmaCCRewriteEngine [
	
]

{ #category : #accessing }
SmaCCAbstractRewrite >> finishedLoading [
	
]

{ #category : #testing }
SmaCCAbstractRewrite >> isComposite [
	^ false
]

{ #category : #testing }
SmaCCAbstractRewrite >> isRoot [
	^ parent isNil
]

{ #category : #testing }
SmaCCAbstractRewrite >> isUnder: aSmaCCAbstractRewrite [
	| current |
	current := self.
	[ current notNil and: [ current ~= aSmaCCAbstractRewrite ] ]
		whileTrue: [ current := current parent ].
	^ current notNil
]

{ #category : #testing }
SmaCCAbstractRewrite >> isUpToDate [
	^ true
]

{ #category : #accessing }
SmaCCAbstractRewrite >> listForClass: aClass into: aSmaCCRewriteLink [
	^ aSmaCCRewriteLink
]

{ #category : #saving }
SmaCCAbstractRewrite >> localSaveOn: aStream [
	self subclassResponsibility
]

{ #category : #testing }
SmaCCAbstractRewrite >> matches: aString [
	| stream |
	stream := WriteStream on: String new.
	self localSaveOn: stream.
	^ '*' , aString , '*' match: stream contents
]

{ #category : #changing }
SmaCCAbstractRewrite >> modified [
	parent notNil
		ifTrue: [ parent modified ]
]

{ #category : #accessing }
SmaCCAbstractRewrite >> parent [
	^ parent
]

{ #category : #accessing }
SmaCCAbstractRewrite >> parent: aSmaCCAbstractRewrite [
	parent := aSmaCCAbstractRewrite
]

{ #category : #accessing }
SmaCCAbstractRewrite >> parserClass [
	^ parent notNil
		ifTrue: [ parent parserClass ]
		ifFalse: [ nil ]
]

{ #category : #rewriting }
SmaCCAbstractRewrite >> performOn: aSmaCCNode continuation: aBlock [
	self subclassResponsibility
]

{ #category : #copying }
SmaCCAbstractRewrite >> postCopy [
	super postCopy.
	parent := nil
]

{ #category : #accessing }
SmaCCAbstractRewrite >> properties [
	^ properties ifNil: [ properties := Dictionary new ]
]

{ #category : #accessing }
SmaCCAbstractRewrite >> properties: aDictionary [
	properties := aDictionary
]

{ #category : #'accessing-properites' }
SmaCCAbstractRewrite >> propertyAt: aString [
	^ self properties at: aString ifAbsent: [ nil ]
]

{ #category : #'accessing-properites' }
SmaCCAbstractRewrite >> propertyAt: aString ifAbsent: aBlock [
	^ self properties at: aString ifAbsent: aBlock
]

{ #category : #'accessing-properites' }
SmaCCAbstractRewrite >> propertyAt: aString ifAbsentPut: aBlock [
	^ self properties at: aString ifAbsentPut: aBlock
]

{ #category : #'accessing-properites' }
SmaCCAbstractRewrite >> propertyAt: aString put: anObject [
	^ self properties at: aString put: anObject
]

{ #category : #'accessing-properites' }
SmaCCAbstractRewrite >> removeProperty: aString [
	^ self properties removeKey: aString ifAbsent: [ nil ]
]

{ #category : #accessing }
SmaCCAbstractRewrite >> rewrites [
	^ #()
]

{ #category : #saving }
SmaCCAbstractRewrite >> saveOn: aStream [
	self localSaveOn: aStream
]

{ #category : #accessing }
SmaCCAbstractRewrite >> topParent [
	^ parent ifNil: [ self ] ifNotNil: [ :value | value topParent ]
]

{ #category : #rewriting }
SmaCCAbstractRewrite >> updateClass: aClass [
	
]
