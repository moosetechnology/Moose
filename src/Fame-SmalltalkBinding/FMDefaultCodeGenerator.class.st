Class {
	#name : #FMDefaultCodeGenerator,
	#superclass : #FMAbstractCodeGenerator,
	#category : #'Fame-SmalltalkBinding'
}

{ #category : #compiling }
FMDefaultCodeGenerator >> compileDerivedGetter: fameProperty [
	rbClass 
		compile: ('<1s><n><t><2s><n><t>^self shoudBeImplemented' 
				expandMacrosWith: (self methodNameFor: fameProperty)
				with: (self annotationStringForProperty: fameProperty))
		classified: #accessing
]

{ #category : #compiling }
FMDefaultCodeGenerator >> compileGetter: fameProperty [
	rbClass 
		compile: ('<1s><n><t><2s><n><t>^<3s>' 
				expandMacrosWith: (self methodNameFor: fameProperty)
				with: (self annotationStringForProperty: fameProperty)
				with: (self instvarNameFor: fameProperty))
		classified: #accessing
]

{ #category : #compiling }
FMDefaultCodeGenerator >> compileManyToAnySetter: fameProperty [
	rbClass 
		compile: ('<1s>: <2s><n><t><3s> value: <2s>' 
			expandMacrosWith: (self methodNameFor: fameProperty)
			with: (self parameterNameFor: fameProperty type)
			with: (self instvarNameFor: fameProperty))
		classified: #accessing
]

{ #category : #compiling }
FMDefaultCodeGenerator >> compileOneToManySetter: fameProperty [
	| pattern |
	pattern := '<1s>: <2s>
	<3s> := FMMultivalueLink on: self
					update: #<4s>
					from: self <1s>
					to: <2s>'.
	rbClass 
		compile: (pattern 
			expandMacrosWith: (self methodNameFor: fameProperty)
			with: (self parameterNameFor: fameProperty type)
			with: (self instvarNameFor: fameProperty)
			with: (self instvarNameFor: fameProperty opposite))
		classified: #accessing
]

{ #category : #compiling }
FMDefaultCodeGenerator >> compileOneToOneSetter: fameProperty [
	| pattern |
	pattern := '<1s>: <2s>
	<3s> ~= <2s> ifTrue: [ | old |
		old := <3s>.
		<3s> := <2s>.
		old notNil ifTrue: [ old <4s>: nil ].
		<2s> notNil ifTrue: [ <2s> <4s>: self ]]'.
	rbClass
		compile: (pattern 
			expandMacrosWith: (self methodNameFor: fameProperty)
			with: (self parameterNameFor: fameProperty type)
			with: (self instvarNameFor: fameProperty)
			with: (self methodNameFor: fameProperty opposite))
		classified: #accessing
]

{ #category : #compiling }
FMDefaultCodeGenerator >> compileSimpleSetter: fameProperty [
	rbClass 
		compile: ('<1s>: <2s><n><t><3s> := <2s>' 
			expandMacrosWith: (self methodNameFor: fameProperty)
			with: (self parameterNameFor: fameProperty type)
			with: (self instvarNameFor: fameProperty))
		classified: #accessing
]

{ #category : #visiting }
FMDefaultCodeGenerator >> visitDerivedManyProperty: fameProperty [
	self visitDerivedProperty: fameProperty
]

{ #category : #visiting }
FMDefaultCodeGenerator >> visitDerivedManyToManyProperty: fameProperty [
	self visitManyToManyProperty: fameProperty
]

{ #category : #visiting }
FMDefaultCodeGenerator >> visitDerivedManyToOneProperty: fameProperty [
	self visitManyToOneProperty: fameProperty
]

{ #category : #visiting }
FMDefaultCodeGenerator >> visitDerivedOneProperty: fameProperty [
	self visitDerivedProperty: fameProperty
]

{ #category : #visiting }
FMDefaultCodeGenerator >> visitDerivedOneToOneProperty: fameProperty [
	self visitDerivedProperty: fameProperty
]

{ #category : #visiting }
FMDefaultCodeGenerator >> visitDerivedProperty: fameProperty [
	self skipDerivedMethods 
		ifFalse: [ self compileDerivedGetter: fameProperty ].

]

{ #category : #visiting }
FMDefaultCodeGenerator >> visitManyProperty: fameProperty [
	self initializeProperty: fameProperty with: 'OrderedCollection new'.
	self compileGetter: fameProperty.
	self compileSimpleSetter: fameProperty.	
]

{ #category : #visiting }
FMDefaultCodeGenerator >> visitManyToManyProperty: fameProperty [ 
	self initializeProperty: fameProperty with: ('FMMultiMultivalueLink on: self opposite: #<1s>' "no colon!"
		expandMacrosWith: (self methodNameFor: fameProperty opposite)).
	self compileGetter: fameProperty.
	self compileManyToAnySetter: fameProperty.
]

{ #category : #visiting }
FMDefaultCodeGenerator >> visitManyToOneProperty: fameProperty [
	self initializeProperty: fameProperty with: ('FMMultivalueLink on: self opposite: #<1s>:' "with colon"
		expandMacrosWith: (self methodNameFor: fameProperty opposite)).
	self compileGetter: fameProperty.
	self compileManyToAnySetter: fameProperty.
]

{ #category : #visiting }
FMDefaultCodeGenerator >> visitOneProperty: fameProperty [
	self initializeProperty: fameProperty with: 'nil'.
	self compileGetter: fameProperty.
	self compileSimpleSetter: fameProperty.	
]

{ #category : #visiting }
FMDefaultCodeGenerator >> visitOneToManyProperty: fameProperty [
	self initializeProperty: fameProperty with: 'nil'.
	self compileGetter: fameProperty.
	self compileOneToManySetter: fameProperty.	
]

{ #category : #visiting }
FMDefaultCodeGenerator >> visitOneToOneProperty: fameProperty [
	self initializeProperty: fameProperty with: 'nil'.
	self compileGetter: fameProperty.
	self compileOneToOneSetter: fameProperty.	
]
