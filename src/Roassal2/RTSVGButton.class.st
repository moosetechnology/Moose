"
A RTSVGButton represents buttons that changes the elements attributes. Since is defined just like any other interaction, is treated as it.
"
Class {
	#name : #RTSVGButton,
	#superclass : #RTSVGInteraction,
	#instVars : [
		'name',
		'id',
		'val'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #'as yet unclassified' }
RTSVGButton class >> on: anExporter name: aName targets: aRTShape [
	| generator |
	generator := [ :e |  self new target: e; name: aName; yourself ].
	self on: anExporter targets: aRTShape generator: generator
]

{ #category : #'as yet unclassified' }
RTSVGButton class >> on: anExporter name: aName values: values targets: aRTShape [
	| generator |
	generator := [ :e |  self new target: e; name: aName; val: values; yourself ].
	self on: anExporter targets: aRTShape generator: generator
]

{ #category : #'button effect' }
RTSVGButton >> addContribution: aStream [
	aStream nextPutAll: self fixedName , '_data["',self targetNameAttribute,self target identityHash asString,'"]  = "',(self dataAsString: (self val rtValue: self target model)),'";', String cr.
]

{ #category : #adding }
RTSVGButton >> addEventHandlers: aStream id: aString element: element center: aNumber [
	aStream
		nextPutAll: self fixedName,' '
]

{ #category : #adding }
RTSVGButton >> addFunctions: aStream [
	aStream
		nextPutAll:
			'
    function button_' , self fixedName
				,
					'(evt) {
      var elements = document.getElementsByClassName("' , self fixedName
				,
					'");
      var color;
      for (e in elements) {
        value = ' , self fixedName
				,
					'_data[elements[e].id];
        ' , self changeFunction
				,
					' = value;
      }
    }
    var ' , self fixedName , '_data = { };'.
	self addContribution: aStream.
]

{ #category : #adding }
RTSVGButton >> addGlobalHandlers: aStream [
	"do nothing"
]

{ #category : #adding }
RTSVGButton >> addSelf: stream startingPoint: startingPoint [
	|box width height converter|
	box := TRLabelShape new text: self fixedName; encompassingRectangle.
	 width := box width.
	height := box height.
	converter := RTSVGStringConverter new.
	stream
		nextPutAll: '<g onmouseup="button_',self fixedName,'(evt)" cursor="pointer">
  <text x="',(startingPoint x + (width /10) rounded) asString,'" y="',(startingPoint y + (3*height/4) rounded) asString,'">',(converter convertString: self getName),'</text>
  <rect x="',startingPoint x asString,'" y="',startingPoint y asString,'" rx="5" ry="5"
        width="',width asString,'" height="',height asString,'" style="fill-opacity:0;stroke:black;stroke-width:1"/>
</g>', String cr.
	^(startingPoint x + width + 5)@(startingPoint y)
]

{ #category : #'button effect' }
RTSVGButton >> changeFunction [
	| attr |
	attr := self targetColorAttribute.
	^'if (elements[e].style != null)
		elements[e].style["',attr,'"]'
]

{ #category : #'button effect' }
RTSVGButton >> dataAsString: color [
	^color asHTMLColor
]

{ #category : #accessing }
RTSVGButton >> fixedName [
	|result|
	result := name copy.
	^result replaceAll: $  with: $_
]

{ #category : #accessing }
RTSVGButton >> getName [
	|result|
	result := name copy.
	^result replaceAll: $_ with: $ .
]

{ #category : #initialization }
RTSVGButton >> initialize [
	super initialize.
	contained := true.
	external := false.
	self name: ''.
	self type: 'button'.
]

{ #category : #accessing }
RTSVGButton >> name: anObject [
	name := anObject
]

{ #category : #accessing }
RTSVGButton >> type [
	^ type,name
]

{ #category : #accessing }
RTSVGButton >> val [
	^ val
]

{ #category : #accessing }
RTSVGButton >> val: anObject [
	val := anObject
]
