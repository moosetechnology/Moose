"
SmaCCClassDefinition is an abstract class that represents a class to be created when compiling the parser's parse trees.

Instance Variables:
	class	<RBClass>	the model's class object that is created
	grammar	<SmaCCGrammar>	the grammar that owns this class
	isRoot	<Boolean>	is this the root class that we are generating
	name	<String>	the name of the class
	subclasses	<Collection of: SmaCCNodeClassDefinition>	our subclasses
	superclass	<SmaCCNodeClassDefinition>	our superclass


"
Class {
	#name : #SmaCCClassDefinition,
	#superclass : #Object,
	#instVars : [
		'name',
		'subclasses',
		'grammar',
		'class',
		'superclass',
		'isRoot'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'accessing-hierarchy' }
SmaCCClassDefinition >> addSubclass: aSmaCCClassDefinition [
	subclasses add: aSmaCCClassDefinition
]

{ #category : #accessing }
SmaCCClassDefinition >> beRoot [
	isRoot := true
]

{ #category : #accessing }
SmaCCClassDefinition >> codeGenerator [
	^ grammar codeGenerator
]

{ #category : #compiling }
SmaCCClassDefinition >> compileMethodsAndVariables [
	
]

{ #category : #accessing }
SmaCCClassDefinition >> fullName [
	^ self codeGenerator namespaceName , self name
]

{ #category : #'initialize-release' }
SmaCCClassDefinition >> grammar: aSmaCCGrammar [
	grammar := aSmaCCGrammar
]

{ #category : #'accessing-hierarchy' }
SmaCCClassDefinition >> hierarchyCount [
	^ superclass isNil
		ifTrue: [ 0 ]
		ifFalse: [ superclass hierarchyCount + 1 ]
]

{ #category : #testing }
SmaCCClassDefinition >> hierarchyIncludes: aSmaCCClassDefinition [
	^ self = aSmaCCClassDefinition
		or:
			[ superclass notNil
				and: [ superclass hierarchyIncludes: aSmaCCClassDefinition ] ]
]

{ #category : #'initialize-release' }
SmaCCClassDefinition >> initialize [
	super initialize.
	isRoot := false.
	subclasses := OrderedCollection new
]

{ #category : #testing }
SmaCCClassDefinition >> isRoot [
	^ isRoot
]

{ #category : #testing }
SmaCCClassDefinition >> isSortedBefore: aSmaCCClassDefinition [
	^ self hierarchyCount < aSmaCCClassDefinition hierarchyCount
		or:
			[ self hierarchyCount = aSmaCCClassDefinition hierarchyCount
				and: [ self name < aSmaCCClassDefinition name ] ]
]

{ #category : #accessing }
SmaCCClassDefinition >> modelClass [
	^ class
]

{ #category : #'initialize-release' }
SmaCCClassDefinition >> modelClass: aRBClass [
	class := aRBClass
]

{ #category : #accessing }
SmaCCClassDefinition >> name [
	^ name
]

{ #category : #'initialize-release' }
SmaCCClassDefinition >> name: anObject [
	name := anObject
]

{ #category : #printing }
SmaCCClassDefinition >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPutAll: '-class(';
		nextPutAll: self name;
		nextPut: $)
]

{ #category : #'accessing-hierarchy' }
SmaCCClassDefinition >> removeSubclass: aSmaCCClassDefinition [
	subclasses remove: aSmaCCClassDefinition ifAbsent: [  ]
]

{ #category : #private }
SmaCCClassDefinition >> rootClassName [
	^ Object name
]

{ #category : #'accessing-hierarchy' }
SmaCCClassDefinition >> subclasses [
	^ subclasses
]

{ #category : #accessing }
SmaCCClassDefinition >> superclass [
	^ superclass
]

{ #category : #'initialize-release' }
SmaCCClassDefinition >> superclass: anObject [
	superclass notNil
		ifTrue: [ superclass removeSubclass: self ].
	superclass := anObject.
	superclass notNil
		ifTrue: [ superclass addSubclass: self ]
]

{ #category : #accessing }
SmaCCClassDefinition >> superclassName [
	^ self isRoot
		ifTrue: [ self rootClassName ]
		ifFalse: [ superclass fullName ]
]

{ #category : #compiling }
SmaCCClassDefinition >> temporaryNameFor: fullName [
	^ (fullName first isVowel
		ifTrue: [ 'an' ]
		ifFalse: [ 'a' ]) , fullName
]

{ #category : #accessing }
SmaCCClassDefinition >> temporaryVariableName [
	^ self temporaryNameFor: self name
]

{ #category : #'accessing-hierarchy' }
SmaCCClassDefinition >> withAllSubclasses [
	| classes index |
	classes := OrderedCollection with: self.
	index := 1.
	[ index <= classes size ]
		whileTrue:
			[ classes addAll: (classes at: index) subclasses.
			index := index + 1 ].
	^ classes
]
