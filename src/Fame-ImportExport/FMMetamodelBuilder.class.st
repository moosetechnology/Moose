Class {
	#name : #FMMetamodelBuilder,
	#superclass : #FMModelBuilder,
	#instVars : [
		'indexDict',
		'stack',
		'serial'
	],
	#category : #'Fame-ImportExport'
}

{ #category : #DSL }
FMMetamodelBuilder >> class: name with: aBlock [

	self new: 'FM3.Class' with: [
		stack addLast: name.
		self id: self nextSerial.
		self add: 'name' with: name.
		self add: 'attributes' with: aBlock.
		stack removeLast. ].
]

{ #category : #DSL }
FMMetamodelBuilder >> derivedProperty: name with: typeName [
	
	self property: name type: typeName opposite: nil multivalued: false derived: true

]

{ #category : #DSL }
FMMetamodelBuilder >> derivedProperty: name with: typeName opposite: oppositeName [ 
	
	self property: name type: typeName opposite: oppositeName multivalued: false derived: true
]

{ #category : #DSL }
FMMetamodelBuilder >> derivedProperty: name withMany: typeName [
	
	self property: name type: typeName opposite: nil multivalued: true derived: true

]

{ #category : #DSL }
FMMetamodelBuilder >> derivedProperty: name withMany: typeName opposite: oppositeName [ 
	
	self property: name type: typeName opposite: oppositeName multivalued: true derived: true
]

{ #category : #'initialize-release' }
FMMetamodelBuilder >> initialize [
	
	indexDict := Dictionary"<String,Integer>" new.
	stack := OrderedCollection"<String>" new.
	serial := 0.
]

{ #category : #private }
FMMetamodelBuilder >> lookup: name [

	"if it is a primitive type, return the name, metamodel will take care of this"
	FM3MetaDescription constantsDo: [ :prim | 
		prim name asString = name ifTrue: [ ^ name ] ].
	^ self lookupSerial: name

]

{ #category : #private }
FMMetamodelBuilder >> lookupSerial: name [
	^indexDict at: name ifAbsentPut: [ serial := serial + 1 ].
]

{ #category : #private }
FMMetamodelBuilder >> nextSerial [
	| name |
	name := String new writeStream.
	stack do: [ :each | name nextPutAll: each ] separatedBy: [ name nextPut: $. ].
	^self lookupSerial: name contents.
]

{ #category : #DSL }
FMMetamodelBuilder >> package: name with: aBlock [

	self new: 'FM3.Package' with: [
		stack addLast: name.
		self add: 'name' with: name.
		self add: 'classes' with: aBlock.
		stack removeLast ].
]

{ #category : #DSL }
FMMetamodelBuilder >> property: name type: typeName opposite: oppositeName multivalued: multivalued [
	
	self property: name type: typeName opposite: oppositeName multivalued: multivalued derived: false
]

{ #category : #DSL }
FMMetamodelBuilder >> property: name type: typeName opposite: oppositeName multivalued: multivalued derived: derived [
	
	self new: 'FM3.Property' with: [
		stack addLast: name.
		self id: self nextSerial.
		self add: 'name' with: name.
		self add: 'type' with: [ self ref: (self lookup: typeName) ].
		multivalued ifTrue: [ self add: 'multivalued' with: true ].
		derived ifTrue: [ self add: 'derived' with: true ].
		oppositeName ifNotNil: [
			self add: 'opposite' with: [ self ref: (self lookupSerial: typeName, '.', oppositeName) ] ].
		stack removeLast ].
]

{ #category : #DSL }
FMMetamodelBuilder >> property: name with: typeName [
	
	self property: name type: typeName opposite: nil multivalued: false

]

{ #category : #DSL }
FMMetamodelBuilder >> property: name with: typeName opposite: oppositeName [ 
	
	self property: name type: typeName opposite: oppositeName multivalued: false
]

{ #category : #DSL }
FMMetamodelBuilder >> property: name withMany: typeName [
	
	self property: name type: typeName opposite: nil multivalued: true

]

{ #category : #DSL }
FMMetamodelBuilder >> property: name withMany: typeName opposite: oppositeName [ 
	
	self property: name type: typeName opposite: oppositeName multivalued: true
]
