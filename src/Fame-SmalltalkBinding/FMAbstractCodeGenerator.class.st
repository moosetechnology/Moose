Class {
	#name : #FMAbstractCodeGenerator,
	#superclass : #Object,
	#instVars : [
		'rbClass',
		'model',
		'defaultSuperclass',
		'classNamePrefix',
		'instVarNames',
		'initializeSource',
		'defaultCategory',
		'isGeneratingDerivedMethods',
		'skipDerivedMethods'
	],
	#category : #'Fame-SmalltalkBinding'
}

{ #category : #visiting }
FMAbstractCodeGenerator >> acceptFameClass: fameClass [
	self visitClass: fameClass.
	fameClass attributes do: [ :attribute | 
		self acceptFameProperty: attribute ].
	self visitClassDone: fameClass.
]

{ #category : #visiting }
FMAbstractCodeGenerator >> acceptFamePackage: famePackage [
	self flag: #classExtensionNotSupported. "currently the generator does not handle extension to other packages. More precisely it can not handle incremental changes to existing methods, although it should be possible with the rewrite engine."
	self visitPackage: famePackage.
	famePackage classes do: [ :fameClass |
		self acceptFameClass: fameClass ]
]

{ #category : #visiting }
FMAbstractCodeGenerator >> acceptFameProperty: fameProperty [

	| selector |
	selector := String new writeStream.
	selector nextPutAll: 'visit'.
	fameProperty isDerived
		ifTrue: [ selector nextPutAll: 'Derived' ].
	fameProperty isMultivalued
		ifTrue: [ selector nextPutAll: 'Many' ]
		ifFalse: [ selector nextPutAll: 'One' ].
	fameProperty hasOpposite
		ifTrue: [ selector nextPutAll: 'To'.
			fameProperty opposite isMultivalued
				ifTrue: [ selector nextPutAll: 'Many' ]
				ifFalse: [ selector nextPutAll: 'One' ]].
	selector nextPutAll: 'Property:'.
	self perform: selector contents asSymbol with: fameProperty.
]

{ #category : #'compiling-names' }
FMAbstractCodeGenerator >> annotationStringForProperty: property [
	| ann |
	property type notNil should beTrue.
	ann := '%<MSEProperty: <1s> type: <2s>' expandMacrosWith: property name asSymbol printString
		with: (self classNameFor: property type) printString.
	property hasOpposite ifTrue: [ ann := ann , ' opposite: ' , (self oppositeNameFor: property) printString ].
	ann := ann , '>'.
	property isMultivalued ifTrue: [ ann := ann , ' <multivalued>' ].
	property isDerived ifTrue: [ ann := ann , ' <derived>' ].
	property hasKey ifTrue: [ ann := ann , ' <key: ' , property key printString , '>' ].
	^ ann
]

{ #category : #'compiling-names' }
FMAbstractCodeGenerator >> categoryNameFor: fameClass [ 
	^self defaultCategory isNil
			ifTrue: [ fameClass package name asString ]
			ifFalse: [ self defaultCategory ]
]

{ #category : #'compiling-names' }
FMAbstractCodeGenerator >> classNameFor: fameClass [ 
	^fameClass isBuiltIn 
		ifTrue: [ fameClass name ]
		ifFalse: [ (self classNamePrefix , fameClass package name , fameClass name) asSymbol ]
]

{ #category : #accessing }
FMAbstractCodeGenerator >> classNamePrefix [
	^classNamePrefix
]

{ #category : #accessing }
FMAbstractCodeGenerator >> classNamePrefix: aString [
	classNamePrefix := aString
]

{ #category : #compiling }
FMAbstractCodeGenerator >> compileClass: fameClass superclass: rbSuperclass [ 
	^ model defineClass: ('<1s> subclass: #<2s>
		instanceVariableNames: ''''
		classVariableNames: ''''
		poolDictionaries: ''''
		category: #<3p>' 
			expandMacrosWith: rbSuperclass name
			with: (self classNameFor: fameClass)
			with: (self categoryNameFor: fameClass))
]

{ #category : #compiling }
FMAbstractCodeGenerator >> compileClassAnnotation: fameClass [
	| annotationString |
	annotationString := ('annotation<n>',
		'<t>%<MSEClass: <1p>',
		' super: <2p>><n>',
		'<t>%<package: <3p>><n><t>',
		(fameClass isAbstract ifTrue: [ '%<abstract><n><t>' ] ifFalse: ['']))
		expandMacrosWith: fameClass name
						with: fameClass superclass fullName
						with: fameClass package name.
	rbClass theMetaClass
		compile: annotationString, '^self'
		classified: 'initialize-release'
]

{ #category : #compiling }
FMAbstractCodeGenerator >> compileInitialize: attributesString [ 
	rbClass 
		compile: attributesString expandMacros
		classified: #'initialize-release'.

]

{ #category : #utils }
FMAbstractCodeGenerator >> createRBModel [
	^RBNamespace new
		name: 'Fame-Generated';
		yourself
]

{ #category : #accessing }
FMAbstractCodeGenerator >> defaultCategory [
	^defaultCategory
]

{ #category : #accessing }
FMAbstractCodeGenerator >> defaultCategory: aString [
	defaultCategory := aString
]

{ #category : #accessing }
FMAbstractCodeGenerator >> defaultSuperclass [
	^defaultSuperclass 
]

{ #category : #accessing }
FMAbstractCodeGenerator >> defaultSuperclass: aSmalltalkClass [
	defaultSuperclass := self model classFor: aSmalltalkClass.
]

{ #category : #compiling }
FMAbstractCodeGenerator >> ensureClass: fameClass [ 
	fameClass isRoot ifTrue: [ ^self defaultSuperclass ].
	^self 
		ensureClass: fameClass
		superclass: (self ensureClass: fameClass superclass)
]

{ #category : #compiling }
FMAbstractCodeGenerator >> ensureClass: fameClass superclass: rbSuperclass [
	| rbClass0 className |
	className := self classNameFor: fameClass.
	rbClass0 := model classNamed: className.
	rbClass0 isNil ifTrue:
			[ self compileClass: fameClass superclass: rbSuperclass.
			rbClass0 := model classNamed: className ].
	rbClass0 notNil should beTrue.
	^ rbClass0
]

{ #category : #'initialize-release' }
FMAbstractCodeGenerator >> initialize [
	model := self createRBModel.
	self classNamePrefix: ''.
	self defaultSuperclass: Object.	
	self skipDerivedMethods: false.
]

{ #category : #compiling }
FMAbstractCodeGenerator >> initializeProperty: fameProperty with: value [ 
	| instVarName |
	instVarName := self instvarNameFor: fameProperty.
	initializeSource
		nextPutAll: '<n><t>';
		nextPutAll: instVarName;
		nextPutAll: ' := ';
		nextPutAll: value;
		nextPutAll: '.'.
	instVarNames add: instVarName
]

{ #category : #'compiling-names' }
FMAbstractCodeGenerator >> instvarNameFor: fameProperty [ 
	^fameProperty name asSymbol
]

{ #category : #'compiling-names' }
FMAbstractCodeGenerator >> methodNameFor: fameProperty [
	^fameProperty name asSymbol
]

{ #category : #accessing }
FMAbstractCodeGenerator >> model [
	^model
]

{ #category : #'compiling-names' }
FMAbstractCodeGenerator >> oppositeNameFor: fameProperty [
	^fameProperty opposite name asSymbol
]

{ #category : #'compiling-names' }
FMAbstractCodeGenerator >> parameterNameFor: fameProperty [
	| name stream |
	name := fameProperty name.
	stream := (String new: name size + 3) writeStream.
	stream nextPut: $a.
	(name first isVowel) ifTrue: [ stream nextPut: $n ].
	stream nextPut: name first asUppercase.
	stream next: name size - 1 putAll: name startingAt: 2.
	^stream contents.
]

{ #category : #accessing }
FMAbstractCodeGenerator >> previewChanges [
	(ChangesBrowser changes: self model changes changes) openWithSpec
]

{ #category : #accessing }
FMAbstractCodeGenerator >> previewChangesIfShiftPressed [
	InputEventSensor default shiftPressed
		ifTrue: [ (ChangesBrowser changes: self model changes changes) openWithSpec ].
]

{ #category : #accessing }
FMAbstractCodeGenerator >> skipDerivedMethods [
	^skipDerivedMethods
]

{ #category : #accessing }
FMAbstractCodeGenerator >> skipDerivedMethods: aBoolean [
	^skipDerivedMethods := aBoolean
]

{ #category : #running }
FMAbstractCodeGenerator >> visit: aMetaRepository [ 
	aMetaRepository packages do: [ :each |
		self acceptFamePackage:  each ]
]

{ #category : #visiting }
FMAbstractCodeGenerator >> visitClass: fameClass [ 
	instVarNames := OrderedCollection new.
	initializeSource := String new writeStream.
	initializeSource nextPutAll: ('initialize<n><t>super initialize.' expandMacros).
	rbClass := self ensureClass: fameClass.
	self compileClassAnnotation: fameClass
]

{ #category : #visiting }
FMAbstractCodeGenerator >> visitClassDone: fameClass [ 
	instVarNames do: [ :symbol | 
		(rbClass whoDefinesInstanceVariable: symbol) isNil 
			ifTrue: [ rbClass addInstanceVariable: symbol ]].
	self compileInitialize: initializeSource contents
]

{ #category : #visiting }
FMAbstractCodeGenerator >> visitPackage: famePackage [
]
