Class {
	#name : #SmaCCRewritePropertyDefinition,
	#superclass : #SmaCCAbstractRewrite,
	#instVars : [
		'comment',
		'propertyNames',
		'globalValues'
	],
	#classVars : [
		'Reader',
		'Writer'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #'instance creation' }
SmaCCRewritePropertyDefinition class >> comment: aString locals: localPropertyNames globals: globalPropertyNames [
	^ self new
		comment: aString;
		addAllLocals: localPropertyNames;
		addAllGlobals: globalPropertyNames;
		yourself
]

{ #category : #accessing }
SmaCCRewritePropertyDefinition class >> readerPrototype [
	^ Reader ifNil: [ Reader := SmaCCRewriteMatchContext compiledMethodFor: 'selector ^Uninitialized' ]
]

{ #category : #accessing }
SmaCCRewritePropertyDefinition class >> writerPrototype [
	^ Writer ifNil: [ Writer := SmaCCRewriteMatchContext compiledMethodFor: 'selector: anObject ^Uninitialized := anObject' ]
]

{ #category : #accessing }
SmaCCRewritePropertyDefinition >> addAllGlobals: aCollection [
	aCollection do: [ :each | self addGlobal: each ]
]

{ #category : #accessing }
SmaCCRewritePropertyDefinition >> addAllLocals: aCollection [
	aCollection do: [ :each | self addLocal: each ]
]

{ #category : #accessing }
SmaCCRewritePropertyDefinition >> addGlobal: aString [
	globalValues at: aString asSymbol put: SmaCCRewriteMatchContext uninitializedValue.
	self changed: #globals
]

{ #category : #accessing }
SmaCCRewritePropertyDefinition >> addLocal: aString [
	propertyNames add: aString.
	self changed: #locals
]

{ #category : #rewriting }
SmaCCRewritePropertyDefinition >> clearLocalVariablesIn: aClass [
	propertyNames do: [ :each | aClass classPool at: each asSymbol put: nil ]
]

{ #category : #accessing }
SmaCCRewritePropertyDefinition >> comment [
	^ comment ifNil: [ '' ]
]

{ #category : #accessing }
SmaCCRewritePropertyDefinition >> comment: aString [
	comment := aString.
	self changed: #comment
]

{ #category : #private }
SmaCCRewritePropertyDefinition >> createPropertyMethodsFor: aSymbol in: aClass [
	| method variable setterName |
	method := self class readerPrototype copy.
	variable := aClass classPool associationAt: aSymbol.
	method literalAt: 1 put: variable.
	method literalAt: 2 put: aSymbol.
	aClass addSelectorSilently: aSymbol withMethod: method.
	setterName := (aSymbol , ':') asSymbol.
	method := self class writerPrototype copy.
	method literalAt: 1 put: variable.
	method literalAt: 2 put: setterName.
	aClass addSelectorSilently: setterName withMethod: method
]

{ #category : #printing }
SmaCCRewritePropertyDefinition >> displayOn: aStream [
	self comment notEmpty
		ifTrue: [ aStream nextPutAll: self comment ]
		ifFalse: [ aStream
				nextPutAll: 'Properties: ';
				print: propertyNames size;
				nextPutAll: ' local, ';
				print: globalValues size;
				nextPutAll: ' global' ]
]

{ #category : #'initialize-release' }
SmaCCRewritePropertyDefinition >> initialize [
	super initialize.
	propertyNames := Set new.
	globalValues := Dictionary new
]

{ #category : #saving }
SmaCCRewritePropertyDefinition >> localSaveOn: aStream [
	self comment notEmpty
		ifTrue: [ aStream
				nextPut: $";
				nextPutAll: (self comment copyReplaceAll: '"' with: '""');
				nextPut: $";
				cr ].
	aStream
		nextPut: $(;
		cr.
	propertyNames asSortedCollection
		do: [ :each | 
			aStream
				nextPut: $-;
				nextPutAll: each;
				cr ].
	globalValues keys asSortedCollection
		do: [ :each | 
			aStream
				nextPut: $+;
				nextPutAll: each;
				cr ].
	aStream nextPut: $)
]

{ #category : #rewriting }
SmaCCRewritePropertyDefinition >> performOn: aSmaCCNode continuation: aBlock [
	^ false
]

{ #category : #accessing }
SmaCCRewritePropertyDefinition >> removeGlobal: aString [
	globalValues removeKey: aString asSymbol ifAbsent: [  ].
	self changed: #globals
]

{ #category : #accessing }
SmaCCRewritePropertyDefinition >> removeLocal: aString [
	propertyNames remove: aString ifAbsent: [  ].
	self changed: #locals
]

{ #category : #rewriting }
SmaCCRewritePropertyDefinition >> updateClass: aClass [
	propertyNames
		do: [ :each | 
			aClass classPool at: each asSymbol put: nil.
			self createPropertyMethodsFor: each asSymbol in: aClass ].
	globalValues
		associationsDo: [ :assoc | 
			aClass classPool add: assoc.
			self createPropertyMethodsFor: assoc name in: aClass ]
]
