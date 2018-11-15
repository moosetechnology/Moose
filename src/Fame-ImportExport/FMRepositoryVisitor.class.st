Class {
	#name : #FMRepositoryVisitor,
	#superclass : #Object,
	#instVars : [
		'repository',
		'wrapperDict',
		'printer',
		'index',
		'nb',
		'progBar',
		'roots',
		'lastUpdate'
	],
	#category : #'Fame-ImportExport'
}

{ #category : #'instance creation' }
FMRepositoryVisitor class >> new [
	^self basicNew initialize
]

{ #category : #exporting }
FMRepositoryVisitor >> basicRun [

	self exportHeader.
	self roots do: [ :each |
		self exportElement: each ].
	self exportFooter.
]

{ #category : #exporting }
FMRepositoryVisitor >> exportElement: each [ 
	
	| meta serial properties |

	meta := repository metaDescriptionOf: each.
	self flag: 'ideally, there should be no nil check here. Currently, we need it to accommodate the case in which we export a model based on a partial meta-model'. 
	meta ifNotNil: [
		serial := self indexOf: each.
		printer beginElement: meta fullName.
		printer serial: serial.
		properties := self sortAttributes: meta allAttributes.
		properties do: [ :property | 
			self 
				exportProperty: property
				for: each ].
		printer endElement: meta fullName
		].
	self increment. "UI stuff"
]

{ #category : #exporting }
FMRepositoryVisitor >> exportFooter [
	printer endDocument
]

{ #category : #exporting }
FMRepositoryVisitor >> exportHeader [

	printer beginDocument.
]

{ #category : #exporting }
FMRepositoryVisitor >> exportProperty: property for: each [
	| values |
	(self shouldIgnoreProperty: property) ifTrue: [ ^ self ].
	values := repository get: property element: each.
	(self shouldIgnoreProperty: property withAll: values)
		ifTrue: [ ^ self ].
	self exportProperty: property withAll: values
]

{ #category : #exporting }
FMRepositoryVisitor >> exportProperty: property withAll: values [
	printer beginAttribute: property name.
	property type isPrimitive
		ifTrue: [ values do: [ :each | printer primitive: each ] ]
		ifFalse: [ property isComposite
				ifTrue: [ values
						do: [ :each | 
							((self isPrimitiveTypeOrObject: each) and: [ self shouldIgnoreProperty: each ])
								ifFalse: [ self exportElement: each ] ] ]
				ifFalse: [ values
						do: [ :each | 
							(self isPrimitiveTypeOrObject: each)
								ifTrue: [ printer referenceName: each name ]
								ifFalse: [ printer referenceNumber: (self indexOf: each) ] ] ] ].
	printer endAttribute: property name
]

{ #category : #exporting }
FMRepositoryVisitor >> increment [
	nb := nb + 1.
	(progBar isNotNil and: [ (Time millisecondsSince: lastUpdate) >= 500 ])
		ifTrue: [ 
			progBar value: nb.
			lastUpdate := Time millisecondClockValue ]
]

{ #category : #private }
FMRepositoryVisitor >> indexOf: each [
	each isNil ifTrue: [ self error ].
	^index at: each ifAbsentPut: [ index size + 1 ]
]

{ #category : #'initialize-release' }
FMRepositoryVisitor >> initialize [
	"Gofer new squeaksource: 'ht'; addPackage: 'Hashtable'; load."
	index := IdentityHashTable new.
]

{ #category : #private }
FMRepositoryVisitor >> isPrimitiveTypeOrObject: each [

	^each == FM3MetaDescription object or: [
		each == FM3MetaDescription string or: [
			each == FM3MetaDescription number or: [
				each == FM3MetaDescription boolean]]]
]

{ #category : #accessing }
FMRepositoryVisitor >> model: aRepository [
	repository := aRepository.
	roots := nil. "reset cache for roots"
]

{ #category : #accessing }
FMRepositoryVisitor >> printer: aPrinter [
	printer := aPrinter
]

{ #category : #private }
FMRepositoryVisitor >> roots [
	self
		flag:
			'VBL - Add a test to detect that the repository is a meta model or not. If  it is, the exporter works normally else, only the roots are exported (issue was detected when adding the container pragmas). I don''t know if it is the better fix to do.'.
	^ roots
		ifNil:
			[ roots := repository elements select: [ :each | (self isPrimitiveTypeOrObject: each) not and: [ repository isMetamodel not or: [ (repository containerOf: each) isEmptyOrNil ] ] ] ]
]

{ #category : #exporting }
FMRepositoryVisitor >> run [
	nb := 0.
	UIManager default
		displayProgress: 'Writing ' , printer stream localName
		from: 0
		to: self roots size
		during: [ :bar | 
			progBar := bar.
			lastUpdate := 0.
			self basicRun ]
]

{ #category : #exporting }
FMRepositoryVisitor >> shouldIgnoreProperty: property [

	(((repository metamodel includes: property) and: [property isContainer]))
		ifTrue: [ ^ false ].
		
	^ (repository metamodel includes: property) not or: [ property isDerived ]
]

{ #category : #exporting }
FMRepositoryVisitor >> shouldIgnoreProperty: property withAll: values [
	
	values ifNil: [ ^ true ].
	
	^ values isEmpty or: [
		property type == FM3MetaDescription boolean and: [
			values size == 1 and: [ 
				values first == false ]]]
]

{ #category : #private }
FMRepositoryVisitor >> sortAttributes: properties [

	| names composites sorted |
	sorted := properties asArray sorted: [:n1 :n2 | n1 name < n2 name ].
	names := sorted select: [ :each | each name == #name ].
	composites := sorted select: [ :each | each isComposite ].
	^names, (sorted copyWithoutAll: (names union: composites)), composites
]
