"
I decorated a builder with a nice continuous popup
"
Class {
	#name : #RTContinuousDecorator,
	#superclass : #RTAbstractGrapherDecorator,
	#instVars : [
		'popupDo',
		'legendLabel',
		'icons',
		'pointFor'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #public }
RTContinuousDecorator >> basic [
	self titleWith: nil.
]

{ #category : #public }
RTContinuousDecorator >> buildLegendFor: x in: group [
	| g temp |
	temp := RTGroup new.
	temp addAll: group.
	group removeAll.
	builder datasets reverse do: [ :ds | | xx |
		xx := ds getValuesX.
		(x between: xx first and: xx last)  
			ifTrue: [ 
				g := RTGroup new.
				g add: ((self iconAt: ds) elementOn: ds->x).
				g add: (legendLabel elementOn: ds->x).
				RTHorizontalLineLayout new alignCenter; on: g.
				temp add: g ]
		 ].
	RTVerticalLineLayout on: temp.
	"hack because remove last popup does not work with rtgroup"
	temp do: [ :m | 
		m isCollection
			ifTrue: [ group addAll: m ]
			ifFalse: [ group add: m ] ].
	
]

{ #category : #public }
RTContinuousDecorator >> buildPointerFor: x in: g [
	self datasets do: [ :ds | | e xx | 
		xx := ds getValuesX.
		(x between: xx first and: xx last)  
			ifTrue: [ 
				e := (self iconAt: ds) elementOn: ds->x.
				e translateTo: (builder getPixelPositionOf: (self 
					calculatePointFor: ds and: x)).
				g add: e ].
		].
]

{ #category : #accessing }
RTContinuousDecorator >> calculatePointFor: as [
	^ self calculatePointFor: as key and: as value
]

{ #category : #accessing }
RTContinuousDecorator >> calculatePointFor: aData and: x [
	^ pointFor value: aData value: x.
]

{ #category : #public }
RTContinuousDecorator >> defaultsForPopup: popup [
	popup 
		blockValidArea: [ :pos | self isPointOverTheBuilder: pos ];
		alphaPopupBackground: 0.7.
		
]

{ #category : #accessing }
RTContinuousDecorator >> iconAt: aData [
	| color |
	^ icons at: aData ifAbsent: [ | aux |
		aux := RTElement new.
		color := aData shouldConnect
			ifTrue: [ aData lineShape color rtValue: aux]
			ifFalse: [ Color white ].
		RTEllipse new size: 10; color: color.
		 ]
]

{ #category : #accessing }
RTContinuousDecorator >> iconAt: dataset put: aShape [
	icons at: dataset put: aShape.
]

{ #category : #initialization }
RTContinuousDecorator >> initialize [
	super initialize.
	self basic.
	legendLabel := RTShapeBuilder new.
	legendLabel label text: [:as | | pos |
		pos := self calculatePointFor: as key and: as value.
		pos y asString].
	icons := Dictionary new.
	"you can change the way to get a position of the element"
	self pointFor: [ :ds :x | | elsx elsy i e1 e2 res |
		elsx := ds getValuesX. 
		elsy := ds getValuesY.
		i := elsx indexOf: x.
		
		i isZero ifTrue: [ 
			res := elsx first @ elsy first.
			1 to: elsx size -1 do: [ :k | 
				e1 := elsx at: k.
				e2 := elsx at: k +1.
				(x between: e1 and: e2) ifTrue: [ 
					res := x < ((e1 + e2) / 2)
						ifTrue: [ e1 @ (elsy at: k) ]
						ifFalse: [ e2 @ (elsy at: k + 1) ] 
					 ]
				].
			res
			]
			ifFalse: [ (elsx at: i) @ (elsy at: i) ] ].
	



]

{ #category : #accessing }
RTContinuousDecorator >> legendLabel [
	^ legendLabel
]

{ #category : #accessing }
RTContinuousDecorator >> pointFor: aBlock [
	pointFor := aBlock
]

{ #category : #accessing }
RTContinuousDecorator >> popupDo: aBlock [
	popupDo := aBlock
]

{ #category : #hooks }
RTContinuousDecorator >> render [
	
	| popup |
	popup := RTContinuousPopup new.
	popupDo value: popup.
	builder view @ popup.
]

{ #category : #public }
RTContinuousDecorator >> title: aBlock [
	self titleWith: (RTLabel new text: aBlock).
	
]

{ #category : #public }
RTContinuousDecorator >> titleWith: labelShape [
	self popupDo: [ :popup |
		self defaultsForPopup: popup.
		
		popup background: Color white group: [ :group  :evt | | x |
			x := self xFor: evt.
			labelShape
				ifNotNil: [ group add: (labelShape elementOn: x) ].
			self buildLegendFor: x in: group ].
		
		popup pointers: [ :g :evt | | x |
			x := self xFor: evt.
			self buildPointerFor: x in: g.
			 ]
		 ].
]

{ #category : #public }
RTContinuousDecorator >> xFor: evt [ 
	^ (builder getPositionFromPixelPosition: evt position) x


]
