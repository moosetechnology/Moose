Class {
	#name : #FMIncrementalMMBuilder,
	#superclass : #Object,
	#instVars : [
		'packageDict',
		'envStack',
		'superclassDict'
	],
	#category : #'Fame-SmalltalkBinding'
}

{ #category : #DSL }
FMIncrementalMMBuilder >> class: aClass with: aBlock [

	self ensureEnv: (self ensureClass: aClass) while: aBlock 

]

{ #category : #private }
FMIncrementalMMBuilder >> currentEnv [

	^ envStack top
]

{ #category : #DSL }
FMIncrementalMMBuilder >> derivedProperty: name with: typeName [
	
	self property: name type: typeName opposite: nil multivalued: false derived: true

]

{ #category : #DSL }
FMIncrementalMMBuilder >> derivedProperty: name with: typeName opposite: oppositeName [ 
	
	self property: name type: typeName opposite: oppositeName multivalued: false derived: true
]

{ #category : #DSL }
FMIncrementalMMBuilder >> derivedProperty: name withMany: typeName [
	
	self property: name type: typeName opposite: nil multivalued: true derived: true

]

{ #category : #DSL }
FMIncrementalMMBuilder >> derivedProperty: name withMany: typeName opposite: oppositeName [ 
	
	self property: name type: typeName opposite: oppositeName multivalued: true derived: true
]

{ #category : #private }
FMIncrementalMMBuilder >> ensureClass: aClass [

	"Maybe this is a bit overkill,
	but we get a well-typed polymorphic behavior always returning a symbol for a class"
	"Object asString asSymbol -> #Object"
	"'Object' asString asSymbol -> #Object"
	"#Object asString asSymbol -> #Object"

	^ self currentEnv at: aClass asString asSymbol ifAbsentPut: [ OrderedCollection new ]
]

{ #category : #private }
FMIncrementalMMBuilder >> ensureEnv: env while: aBlock [

	envStack push: env.
	aBlock valueWithPossibleArgument: self.
	envStack pop
]

{ #category : #private }
FMIncrementalMMBuilder >> ensurePackage: aString [

	^ packageDict at: aString ifAbsentPut: [ Dictionary new ]
]

{ #category : #'private-pragmas' }
FMIncrementalMMBuilder >> ensurePragmaClass: aClass while: aBlock [

	| pragma pakPragma className superclass |
	pragma := self retrieveClassPragma: aClass.
	className := pragma argumentAt: 1.
	superclass := self ensurePragmaSuperclass: (pragma argumentAt: 2).
	superclassDict 	at: (self resolveFameName: aClass)
					put: (self resolveFameName: superclass).

	pakPragma := self retrievePackagePragma: pragma.
	pakPragma
		ifNotNil: [ 
			self
				ensureEnv: (self ensurePackage: (pakPragma argumentAt: 1))
				while: [ self ensureEnv: (self ensureClass: className) while: aBlock ] ]
		ifNil: [ self ensureEnv: (self ensureClass: className) while: aBlock ].

]

{ #category : #'private-pragmas' }
FMIncrementalMMBuilder >> ensurePragmaSuperclass: aSuperclassName [

	| stClass |
	(aSuperclassName = #Object or: [ aSuperclassName = 'Object' ])
		ifTrue: [ ^ #Object ]. "stop lookup"
	"Assume that aSuperclassName follows Fame convention"
	stClass := self class environment at: (aSuperclassName copyReplaceAll: '.' with: '') asSymbol.
	self ensurePragmaClass: stClass while: [].
	^ stClass
]

{ #category : #'private-pragmas' }
FMIncrementalMMBuilder >> followOppositeProperty: opposite in: aClassOrStringOrSymbol [

	| aClass |
	aClass := self class environment
							at: aClassOrStringOrSymbol asString asSymbol.
	self pragmaProperty: opposite in: aClass followOpposite: false.

]

{ #category : #initialization }
FMIncrementalMMBuilder >> initialize [

	super initialize.
	packageDict := SmallDictionary new.
	superclassDict := Dictionary new.
	envStack := Stack new.
	
	"Format for packageDict: a dictionary of dictionary of collections
		{'package1' -> {
			#ClassX -> {
				{prop1. type1. opposite. multi. derived}
				{prop2. type2. nil. true. false} }
			#ClassY -> { {prop3. ....}}
		 }"
]

{ #category : #running }
FMIncrementalMMBuilder >> metamodel [

	| importer builder |
	importer := FMImporter new.
	importer repository: (FMMetaRepository with: FMMetaRepository fm3).
	builder := FMMetamodelBuilder new.
	builder client: importer.
	builder document: [
		packageDict keysAndValuesDo: [ :pname :classes |
		builder package: pname with: [
			classes keysAndValuesDo: [ :cname :props | 
			builder class: cname with: [
				props do: [ :prop |
					"prop is a quintuple {name. type. opposite. multivalued. derived}"
					builder perform: #property:type:opposite:multivalued:derived: withArguments: prop ]
			]]
		]]
	].
	self resolveSmalltalkBindingsIn: importer repository.
	^ importer repository
]

{ #category : #DSL }
FMIncrementalMMBuilder >> package: name with: aBlock [

	self ensureEnv: (self ensurePackage: name) while: aBlock
]

{ #category : #DSL }
FMIncrementalMMBuilder >> pragmaClass: aClass [

	self ensurePragmaClass: aClass while: []
]

{ #category : #DSL }
FMIncrementalMMBuilder >> pragmaProperty: aSymbol in: aClass [

	self pragmaProperty: aSymbol in: aClass followOpposite: true
]

{ #category : #'private-pragmas' }
FMIncrementalMMBuilder >> pragmaProperty: aSymbol in: aClass followOpposite: aBoolean [

	| aMethod pragma propName propType opposite multi derived |
	
	aMethod := aClass lookupSelector: aSymbol.
	aMethod isCompiledMethod should beTrue.
	pragma := Pragma inMethod: aMethod named: #(#MSEProperty:type:opposite: #MSEProperty:type:).
	pragma isNil ifTrue: [ self error: 'No Fame pragma in ', aSymbol ].
	propName := (pragma argumentAt: 1) asString.
	propType := self resolveFameName: (pragma argumentAt: 2).
	derived := false.
	(Pragma inMethod: aMethod named: #derived) ifNotNil: [ derived := true ].
	multi := false.
	(Pragma inMethod: aMethod named: #multivalued) ifNotNil: [ multi := true ].
	opposite := nil.
	pragma keyword = #MSEProperty:type:opposite:
		ifTrue: [ 
			opposite := pragma argumentAt: 3.
			aBoolean ifTrue: [
				self followOppositeProperty: opposite in: (pragma argumentAt: 2)
				]].
	"(Pragma inMethod: aMethod named: #package:) ifNotNil:
			[ ((Pragma inMethod: aMethod named: #package:) argumentAt: 1) ]."
	"(Pragma inMethod: aMethod named: #container) ifNotNil: [ prop isContainer: true ]."

	"Warning: method with property may be defined in a superclass of aClass.
	 That's why we ensure aClass, but then we create the property in the context of the defining class:
	 this way inherited and opposite properties are well-bound"
	self ensurePragmaClass: aClass while: [].
	self ensurePragmaClass: aMethod methodClass while: [
		self property: propName type: propType opposite: opposite multivalued: multi derived: derived ]
]

{ #category : #DSL }
FMIncrementalMMBuilder >> property: name type: typeName opposite: oppositeName multivalued: multivalued [

	self property: name type: typeName opposite: oppositeName multivalued: multivalued derived: false
]

{ #category : #DSL }
FMIncrementalMMBuilder >> property: name type: typeName opposite: oppositeName multivalued: multivalued derived: derived [

	self currentEnv add: {name asSymbol. typeName. oppositeName. multivalued. derived}
]

{ #category : #DSL }
FMIncrementalMMBuilder >> property: name with: typeName [

	self property: name type: typeName opposite: nil multivalued: false
]

{ #category : #DSL }
FMIncrementalMMBuilder >> property: name with: typeName opposite: oppositeName [

	self property: name type: typeName opposite: oppositeName multivalued: false
]

{ #category : #DSL }
FMIncrementalMMBuilder >> property: name withMany: typeName [

	self property: name type: typeName opposite: nil multivalued: true
]

{ #category : #DSL }
FMIncrementalMMBuilder >> property: name withMany: typeName opposite: oppositeName [

	self property: name type: typeName opposite: oppositeName multivalued: true
]

{ #category : #'private-pragmas' }
FMIncrementalMMBuilder >> resolveFameName: var [
	"See FMPragmaProcessor>>ensureClass:"

	| class |
	"Try to resolve a Smalltalk class"
	class := self class environment at: var asString asSymbol ifAbsent: [ nil ].
	class ifNotNil: [ 
		"Look for a class pragma"
		[ ^ self resolveFameNameFromPragma: class ] on: Error do: [ ^ var ] ].
	"Assume this is already a Fame type"
	^ var
]

{ #category : #'private-pragmas' }
FMIncrementalMMBuilder >> resolveFameNameFromPragma: class [
	| pragma pakPragma typename |
	pragma := (self retrieveClassPragma: class).
	typename := pragma argumentAt: 1.
	pakPragma := self retrievePackagePragma: pragma.
	pakPragma ifNotNil:
		[ ^ (pakPragma argumentAt: 1), '.', typename ].
	^ typename
]

{ #category : #private }
FMIncrementalMMBuilder >> resolveSmalltalkBindingsIn: aFMMetaRepository [

	| unboundProps |
	aFMMetaRepository updateClassDict.
	superclassDict keysAndValuesDo: [ :fmClass :fmSuperclass |
		(aFMMetaRepository elementNamed: fmClass)
											superclass: (aFMMetaRepository elementNamed: fmSuperclass) ].
	unboundProps := aFMMetaRepository elements
											select: [ :e | e isFM3Property and: [ e implementingSelector isNil ]].
	" assume that the given prop is actually the selector"
	unboundProps do: [ :prop | prop setImplementingSelector: prop name asSymbol ]
]

{ #category : #'private-pragmas' }
FMIncrementalMMBuilder >> retrieveClassPragma: aClass [
	| pragma |
	pragma := Pragma allNamed: #MSEClass:super: in: aClass class.
	pragma isEmpty
		ifTrue: [ self error: 'No Fame pragma ' , aClass name ].
	pragma := pragma first.
	^ pragma
]

{ #category : #'private-pragmas' }
FMIncrementalMMBuilder >> retrievePackagePragma: pragma [
	^ Pragma inMethod: pragma method named: #package:
]
