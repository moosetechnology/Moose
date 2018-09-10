Class {
	#name : #FMInferencer,
	#superclass : #FMParserClient,
	#instVars : [
		'nameDict',
		'stack',
		'index',
		'serial',
		'builder'
	],
	#category : #'Fame-ImportExport'
}

{ #category : #private }
FMInferencer >> attributeElementsAdd: any [ 
	
	| attribute |
	attribute := stack top key.
	attribute elements add: any.
	stack top value: stack top value + 1.
]

{ #category : #parsing }
FMInferencer >> beginAttribute: name [ 

	| element attribute |
	element := stack top.
	attribute := element attributes at: name ifAbsentPut: [ FMAbstractAttribute new name: name ].
	stack push: attribute -> 0.	
]

{ #category : #parsing }
FMInferencer >> beginDocument [
	nameDict := Dictionary new.
	index := IdentityDictionary new.
	stack := Stack new.
	serial := 0.
]

{ #category : #parsing }
FMInferencer >> beginElement: name [ 
	| element |
	element := nameDict at: name ifAbsentPut: [ 
		FMAbstractElement new 
			serial: self nextSerial;
			name: name ].
	stack isEmpty not ifTrue: [
		self attributeElementsAdd: element ].
	stack push: element.
]

{ #category : #accessing }
FMInferencer >> client [
	^ builder client
]

{ #category : #accessing }
FMInferencer >> client: anObject [ 
	builder := FMModelBuilder new client: anObject
]

{ #category : #private }
FMInferencer >> elements [
	^nameDict values
]

{ #category : #parsing }
FMInferencer >> endAttribute: name [ 
	
	| frame attribute |
	frame := stack pop.
	attribute := frame key.
	attribute addElementCount: frame value.
]

{ #category : #parsing }
FMInferencer >> endDocument [
	stack isEmpty should beTrue.
	self resolveReferences
]

{ #category : #parsing }
FMInferencer >> endElement: name [ 
	stack pop

]

{ #category : #inferring }
FMInferencer >> inferClass: anAbstractElement [ 
	
	builder new: 'FM3.Class' with: [
		builder id: anAbstractElement serial.
		builder add: 'name' with: anAbstractElement simpleName.
		builder add: 'attributes' with: [ 
			self inferProperties: anAbstractElement ]]
]

{ #category : #inferring }
FMInferencer >> inferClasses: aString [

	| selection |
	selection := self elements select: [ :each | each packageName = aString ].
	selection do: [ :elem |
		self inferClass: elem ].
	
	
]

{ #category : #inferring }
FMInferencer >> inferPackage: aString [ 
	builder 
		new: 'FM3.Package'
		with: 
			[ builder 
				a: 'name'
				of: aString.
			builder 
				a: 'classes'
				of: [ self inferClasses: aString ] ]
]

{ #category : #inferring }
FMInferencer >> inferPackages [

	self packageNames do: [ :name |
		self inferPackage: name.
	]
]

{ #category : #inferring }
FMInferencer >> inferProperties: anAbstractElement [

	anAbstractElement attributes do: [ :anAbstractAttribute |
		self inferProperty: anAbstractAttribute ]
	
	
]

{ #category : #inferring }
FMInferencer >> inferProperty: anAbstractAttribute [ 
	| type |
	builder 
		new: 'FM3.Property'
		with: 
			[ builder 
				a: 'name'
				of: anAbstractAttribute name.
			builder 
				a: 'type'
				of: 
					[ type := anAbstractAttribute inferElementType.
					type isSymbol 
						ifTrue: [ builder ref: type ]
						ifFalse: [ builder ref: type serial ] ].
			anAbstractAttribute inferMultivalued ifTrue: 
				[ builder 
					a: 'multivalued'
					of: true ] ]
]

{ #category : #private }
FMInferencer >> nextSerial [

	^serial := serial + 1
]

{ #category : #private }
FMInferencer >> packageNames [
	
	| names |
	names := Set new.
	self elements do: [ :each |
		names add: each packageName ].
	^names
]

{ #category : #parsing }
FMInferencer >> primitive: value [ 
	
	value isString ifTrue: [
		^self attributeElementsAdd: #String ].
	value isNumber ifTrue: [
		^self attributeElementsAdd: #Number ].
	value isBoolean  ifTrue: [
		^self attributeElementsAdd: #Boolean ].
	self error: 'Type of primitive value not known.'	
]

{ #category : #parsing }
FMInferencer >> referenceName: name [ 

	self halt
]

{ #category : #parsing }
FMInferencer >> referenceNumber: name [ 

	self attributeElementsAdd: name
]

{ #category : #private }
FMInferencer >> resolveReferences [

	self elements do: [ :elem |
		elem attributes values do: [ :attr |
			attr resolveReferences: index ] ]
]

{ #category : #inferring }
FMInferencer >> run [

	builder document: [
		self inferPackages ]
]

{ #category : #parsing }
FMInferencer >> serial: aNumber [
 
	| element |
	element := stack top.
	index at: aNumber put: element
]
