Class {
	#name : #FMIncrementalPragmaProcessor,
	#superclass : #Object,
	#instVars : [
		'metamodel',
		'todoOpposite',
		'todoClass'
	],
	#category : #'Fame-SmalltalkBinding'
}

{ #category : #private }
FMIncrementalPragmaProcessor >> findFameClass: aByteString [ 
	
	^metamodel elementNamed: aByteString ifAbsent: nil.
]

{ #category : #private }
FMIncrementalPragmaProcessor >> findPackage: aByteSymbol [ 
	
	^metamodel 
		packageNamed: aByteSymbol
		ifAbsentPut: [ FM3PackageDescription  new name: aByteSymbol ]
]

{ #category : #private }
FMIncrementalPragmaProcessor >> hasPendingTodos [
	^todoClass isEmpty not and: [ todoOpposite isEmpty not ]
]

{ #category : #'initialize-release' }
FMIncrementalPragmaProcessor >> initialize [
	todoOpposite := Set new.
	todoClass := Set new.
	metamodel := nil "has to be set!".
]

{ #category : #accessing }
FMIncrementalPragmaProcessor >> metamodel [
	^ metamodel
]

{ #category : #accessing }
FMIncrementalPragmaProcessor >> metamodel: anObject [
	metamodel := anObject
]

{ #category : #private }
FMIncrementalPragmaProcessor >> processAllClasses: anArray [

	anArray do: [ :each |
		self processClass: each ].
]

{ #category : #private }
FMIncrementalPragmaProcessor >> processClass: aSmalltalkClass [

	aSmalltalkClass theMetaClass methodDict do: [ :each |
		self processClassMethod: each ].
	aSmalltalkClass theNonMetaClass methodDict do: [ :each |
		self processInstanceMethod: each ].	
]

{ #category : #private }
FMIncrementalPragmaProcessor >> processClassMethod: aMethod [
	| pragma meta className superclassName superclass pack |
	pragma := Pragma 
		inMethod: aMethod
		named:  #MSEClass:super:.
	pragma isNil ifTrue: [ ^self ].
	className := pragma argumentAt: 1.
	superclassName := pragma argumentAt: 2.

	"the description for the class"
	meta := FM3MetaDescription new halt.
	meta name: className asString.
	superclass := self findFameClass: superclassName.
	superclass isNil ifTrue: [
		^self todo: aMethod kind: #classNotFound ].
	meta superclass: superclass.
	meta setImplementingClass: aMethod methodClass theNonMetaClass.
	(Pragma 
		inMethod: pragma method
		named: #abstract) ifNotNil: [ meta isAbstract: true ].
	(Pragma inMethod: pragma method named: #package:)
		ifNotNil: [
			pack := self findPackage: ((Pragma inMethod: pragma method named: #package:) argumentAt: 1).
			meta package: pack. ].
	metamodel add: meta.
	self processPendingClassTodo
]

{ #category : #private }
FMIncrementalPragmaProcessor >> processInstanceMethod: aMethod [
	| pragma prop class type opposite pack |
	pragma := Pragma 
		inMethod: aMethod
		named: #(#MSEProperty:type:opposite: #MSEProperty:type: ).
	pragma isNil ifTrue: [ ^ self ].

	prop := FM3PropertyDescription new.
	prop name: (pragma argumentAt: 1) asString.
	class := self findFameClass: (aMethod methodClass).
	class isNil ifTrue: [
		^todoClass add: aMethod ].
	type := self findFameClass: (pragma argumentAt: 2).
	type isNil ifTrue: [
		^todoClass add: aMethod ].
	prop type: type.
	prop mmClass: class.
	prop setImplementingSelector: aMethod selector.
	pragma keyword = #MSEProperty:type:opposite: ifTrue: [
		opposite := self findOpposite: (pragma argumentAt: 3).
		opposite isNil ifTrue: [
			self todo: aMethod kind: #oppositeNotFound ]].
	(Pragma 
		inMethod: aMethod
		named: #package:) ifNotNil: [ 
			pack := self ensurePackage: ((Pragma 
				inMethod: aMethod
				named: #package:) argumentAt: 1).
			prop package: pack ].	
	(Pragma 
		inMethod: aMethod
		named: #container) ifNotNil: [ prop isContainer: true ].
	(Pragma 
		inMethod: aMethod
		named: #derived) ifNotNil: [ prop isDerived: true ].
	(Pragma 
		inMethod: aMethod
		named: #multivalued) ifNotNil: [ prop isMultivalued: true ].
	(Pragma 
		inMethod: aMethod
		named: #key:) ifNotNil: 
		[ prop key: ((Pragma 
				inMethod: aMethod
				named: #key:) argumentAt: 1) ].
	"-----"
	metamodel add: prop.
	self processPendingTodos: #oppositeNotFound.

]

{ #category : #private }
FMIncrementalPragmaProcessor >> processPendingClassTodo [
	
	todoClass copy do: [ :each |
			todoClass remove: each.
			self processClassMethod: each. 
			self processInstanceMethod: each ]
]

{ #category : #private }
FMIncrementalPragmaProcessor >> processPendingOppositeTodo [
	
	todoOpposite copy do: [ :each |
			todoOpposite remove: each.
			self processInstanceMethod: each ]
]
