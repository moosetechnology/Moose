"
Root ot the SVG Elements

An SVG Element has 
	- attributes		
	- id		
	- parent

Pay attention that some methods contain _ because of an automatic conversion.
Read 
	attributeSetter: aString
		""fill-opacity   =>>  fill_opacity:
		x =>> x:
		""
"
Class {
	#name : #ASElement,
	#superclass : #Object,
	#instVars : [
		'parent',
		'id',
		'attributes'
	],
	#classVars : [
		'EmptyDict'
	],
	#category : #'Athens-SVG'
}

{ #category : #'as yet unclassified' }
ASElement class >> convertXML: aXMLElement [ 
	^ self new convertXML: aXMLElement
]

{ #category : #'as yet unclassified' }
ASElement class >> initialize [
	EmptyDict := IdentityDictionary new.
]

{ #category : #'as yet unclassified' }
ASElement class >> translateNode: xmlNode [
	| nodeClass |
	nodeClass := ASVGNodeClasses fromName: xmlNode name.
	^ nodeClass new translate: xmlNode
]

{ #category : #'as yet unclassified' }
ASElement class >> translateNode: xmlNode parent: aParent [
	| nodeClass |
	nodeClass := ASVGNodeClasses fromName: xmlNode name.
	^ nodeClass new translate: xmlNode parent: aParent
]

{ #category : #'attribute management' }
ASElement >> attributeAt: name [
	^ attributes at: name ifAbsent: nil
]

{ #category : #'attribute management' }
ASElement >> attributeAt: name put: value [
	attributes == EmptyDict
		ifTrue: [ attributes := IdentityDictionary new ].
	^ attributes at: name put: value
]

{ #category : #operations }
ASElement >> attributeSetter: aString [
	"fill-opacity   =>>  fill_opacity:
	x =>> x:"
	| sel |
	sel := aString collect: [ :c | ('-:' includes: c) ifTrue: [ $_] ifFalse: [ c ]].
	^ (sel copyWith: $:) asSymbol 
]

{ #category : #attributes }
ASElement >> color: aByteString [ 
	self attributeAt: #color put: aByteString 
]

{ #category : #'attribute management' }
ASElement >> defaultAttributeAt: aName [
	^ self defaultAttributes at: aName ifAbsent: nil
]

{ #category : #attributes }
ASElement >> display [
	^ self attributeAt: #display 
]

{ #category : #attributes }
ASElement >> display: aString [
	self attributeAt: #display put: aString
]

{ #category : #attributes }
ASElement >> fill [
	^ self inheritedAttributeAt: #fill ifAbsent: [ ASColorPaint new color: Color black ]
]

{ #category : #attributes }
ASElement >> fill: anObject [
	self attributeAt: #fill put: (ASFillConverter new translate: anObject)
]

{ #category : #attributes }
ASElement >> fill_opacity [
	^ self inheritedAttributeAt: #fill_opacity ifAbsent: [ self opacity ]
]

{ #category : #attributes }
ASElement >> fill_opacity: aString [ 
	self attributeAt: #fill_opacity  put: (self translateNumber: aString)
]

{ #category : #attributes }
ASElement >> fill_rule: aString [
	self attributeAt: #fill_rule put: aString
]

{ #category : #attributes }
ASElement >> filter: aString [ 
	"<uri> | none | inherit"
	self attributeAt: #filter put: aString
]

{ #category : #attributes }
ASElement >> font_size: aString [ 
	self attributeAt: #font_size put: aString
]

{ #category : #accessing }
ASElement >> id [
	^ id
]

{ #category : #accessing }
ASElement >> id: aString [ 
	id := aString.
	self registerId.
]

{ #category : #'attribute management' }
ASElement >> ignoredAttribute [
	"just a stub to indicate an ignored attribute"

]

{ #category : #'attribute management' }
ASElement >> inheritedAttributeAt: name [
	^ attributes at: name ifAbsent: [ parent
		ifNil: [ self error: 'Attribute ', name asString, ' not found.' ]
		ifNotNil: [ parent inheritedAttributeAt: name ] ]
]

{ #category : #'attribute management' }
ASElement >> inheritedAttributeAt: name ifAbsent: aBlock [

	^ attributes at: name ifAbsent: [ parent
		ifNil: [ aBlock value ]
		ifNotNil: [ parent inheritedAttributeAt: name ifAbsent: aBlock ] ]
]

{ #category : #initialize }
ASElement >> initialize [ 

	attributes := EmptyDict.


]

{ #category : #attributes }
ASElement >> marker: aString [ 
	self attributeAt: #marker put: aString
]

{ #category : #attributes }
ASElement >> marker_mid: aString [ 
	self attributeAt: #marker_mid put: aString
]

{ #category : #attributes }
ASElement >> marker_start: aByteString [ 
	self attributeAt: #marker_start put: aByteString 
]

{ #category : #accessing }
ASElement >> noFill [
	^ ASNoFill soleInstance 
]

{ #category : #attributes }
ASElement >> opacity [
	^ self inheritedAttributeAt: #opacity ifAbsent: 1
]

{ #category : #attributes }
ASElement >> opacity: aString [ 
	self attributeAt: #opacity put: (self translateNumber: aString)
]

{ #category : #accessing }
ASElement >> parent [
	^ parent

]

{ #category : #accessing }
ASElement >> parent: anObject [
	parent := anObject
]

{ #category : #internal }
ASElement >> registerId [
	"register receiver in global id table"
	self root setId: id for: self
]

{ #category : #rendering }
ASElement >> renderOn: aCanvas [
	"render on Athens canvas"

	self transform
		ifNotNil: [ :tr | 
			aCanvas pathTransform
				restoreAfter: [ 
					aCanvas pathTransform multiplyBy: tr.
					self renderShapeOn: aCanvas ] ]
		ifNil: [ self renderShapeOn: aCanvas ]
]

{ #category : #rendering }
ASElement >> renderShapeOn: aCanvas [

]

{ #category : #internal }
ASElement >> resolveIdForAttribute: aName dict: dict [
	| value |
	value := self perform: aName.
	value class == ASLink
		ifTrue: [ self attributeAt: aName put: (value resolveIds: dict) ]
]

{ #category : #internal }
ASElement >> resolveIds: idDict [
	self resolveMyIds: idDict
]

{ #category : #internal }
ASElement >> resolveMyIds: idDict [
	#(#fill #stroke #xlink_href) 
		do: [ :each | self resolveIdForAttribute: each dict: idDict ]
]

{ #category : #accessing }
ASElement >> root [

	^ parent ifNil: [ self ] ifNotNil: [ parent root ]
]

{ #category : #attributes }
ASElement >> stroke [
	^ self inheritedAttributeAt: #stroke ifAbsent: [ ASNoFill soleInstance ]
]

{ #category : #attributes }
ASElement >> stroke: anObject [ 
	self attributeAt: #stroke put: (ASFillConverter new translate: anObject )
]

{ #category : #attributes }
ASElement >> stroke_dasharray [
	^ self inheritedAttributeAt: #stroke_dasharray ifAbsent: nil
]

{ #category : #attributes }
ASElement >> stroke_dasharray: aString [ 
	self attributeAt: #stroke_dasharray put: aString
]

{ #category : #attributes }
ASElement >> stroke_dashoffset [
	^ self inheritedAttributeAt: #stroke_dashoffset ifAbsent: 0
]

{ #category : #attributes }
ASElement >> stroke_dashoffset: aString [ 
	self attributeAt: #stroke_dashoffset put: (self translateLength: aString)
]

{ #category : #attributes }
ASElement >> stroke_linecap [
	^ self inheritedAttributeAt: #stroke_linecap ifAbsent: #butt
]

{ #category : #attributes }
ASElement >> stroke_linecap: aString [ 
	self attributeAt: #stroke_linecap put: aString
]

{ #category : #attributes }
ASElement >> stroke_linejoin [
	^ self inheritedAttributeAt: #stroke_linejoin ifAbsent: #miter
]

{ #category : #attributes }
ASElement >> stroke_linejoin: aString [ 
	self attributeAt: #stroke_linejoin put: aString
]

{ #category : #attributes }
ASElement >> stroke_miterlimit [
	^ self inheritedAttributeAt: #stroke_miterlimit ifAbsent: 4
]

{ #category : #attributes }
ASElement >> stroke_miterlimit: aString [
	self attributeAt: #stroke_miterlimit put: (self translateNumber: aString)

]

{ #category : #attributes }
ASElement >> stroke_opacity [
	^ self inheritedAttributeAt: #stroke_opacity ifAbsent: [ self opacity ]
]

{ #category : #attributes }
ASElement >> stroke_opacity: aString [ 
	self attributeAt: #stroke_opacity  put: (self translateNumber: aString)
]

{ #category : #attributes }
ASElement >> stroke_width [
	^ self inheritedAttributeAt: #stroke_width ifAbsent: 1
]

{ #category : #attributes }
ASElement >> stroke_width: aString [ 
	self attributeAt: #stroke_width  put: (self translateNumber: aString)
]

{ #category : #operations }
ASElement >> style: aString [ 
	| values |
	values := aString substrings: ';'.
	
	values do: [:keyval | | key val setter |
		key := (keyval copyUpTo: $:) trimBoth.
		val := (keyval copyAfter: $:) trimBoth.
		setter := self attributeSetter: key.
		(self respondsTo: setter) ifTrue: [ self perform: setter with: val ]
		ifFalse: [ self attributeAt: setter allButLast asSymbol  put: val ]
		]

]

{ #category : #operations }
ASElement >> transform [
	^ self attributeAt: #transform
]

{ #category : #operations }
ASElement >> transform: aString [
	" rotate(10) scale (1) translate (100,10) "

	self attributeAt: #transform put: (ASTransformConverter new translateString: aString)
]

{ #category : #translate }
ASElement >> translate: xmlNode [
	self translateAttributes: xmlNode attributes.

]

{ #category : #translate }
ASElement >> translate: aXMLElement parent: node [ 
	parent := node.
	^ self translate: aXMLElement
]

{ #category : #translate }
ASElement >> translateAttributes: attrs [
	attrs associationsDo: [:assoc |
		| setter |
		setter := self attributeSetter: assoc key.
		(self respondsTo: setter) ifTrue: [
			self perform: setter with: assoc value trimBoth ]
		ifFalse: [ self attributeAt: setter allButLast asSymbol put: assoc value trimBoth ]
	]
]

{ #category : #translate }
ASElement >> translateColor: aString [ 
	"right now we do like that"
	^ Color fromString: aString
]

{ #category : #translate }
ASElement >> translateLength: aString [ 

	^ self translateNumber: aString
]

{ #category : #translate }
ASElement >> translateNumber: aString [ 

	^ (ASConverter new stream: aString readStream ) nextNumber 

]

{ #category : #attributes }
ASElement >> xlink_actuate: aString [ 
	self ignoredAttribute 
]

{ #category : #attributes }
ASElement >> xlink_href [
	^ self attributeAt: #xlink_href
]

{ #category : #attributes }
ASElement >> xlink_href: aString [ 
	self attributeAt: #xlink_href put: (ASLink url: aString)
]

{ #category : #attributes }
ASElement >> xlink_show: aByteString [ 
	self ignoredAttribute 
]

{ #category : #attributes }
ASElement >> xlink_type: aString [ 

	self ignoredAttribute
]
