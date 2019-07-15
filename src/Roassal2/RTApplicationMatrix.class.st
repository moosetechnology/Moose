Class {
	#name : #RTApplicationMatrix,
	#superclass : #RTBuilder,
	#instVars : [
		'items'
	],
	#category : #'Roassal2-Builder-ApplicationMatrix'
}

{ #category : #adding }
RTApplicationMatrix >> add: anItem [
	items add: anItem
]

{ #category : #'accessing vectorwise' }
RTApplicationMatrix >> columns [
	items ifEmpty: [ ^ #() ].
	^ (items collect: #column) removeDuplicates asArray
]

{ #category : #hooks }
RTApplicationMatrix >> createShapeBuilder [
	^ ((RTBox new height: 20; width: 200; color: #color) + (RTLabel new text: #itemName))
	"| b |
	b := super createShapeBuilder.
	b rectangle width: 250; height: 20; color: #color.
	^ b"
]

{ #category : #examples }
RTApplicationMatrix >> example01 [
	"
	self new example01
	"

	| b item01 item02 item03 item04 |
	b := RTApplicationMatrix new.
	item01 := RTAMItem new.
	item01 itemName: 'Contract Management'.
	item01 row: 'Australia'.
	item01 column: 'Corporate Services'.
	item01 color: Color lightRed.
	
	item02 := RTAMItem new.
	item02 itemName: 'Bonus Card Use Watch'.
	item02 row: 'Australia'.
	item02 column: 'Corporate Services'.

	item03 := RTAMItem new.
	item03 itemName: 'MailSnake'.
	item03 row: 'Australia'.
	item03 column: 'Customer Relationship'.

	item04 := RTAMItem new.
	item04 itemName: 'Saleforce light'.
	item04 row: 'France'.
	item04 column: 'Customer Relationship'.
	item04 color: Color lightGreen.
	
	b add: item01; add: item02; add: item03; add: item04.
	^ b
]

{ #category : #initialization }
RTApplicationMatrix >> initialize [
	super initialize.
	items := OrderedCollection new.
	
]

{ #category : #accessing }
RTApplicationMatrix >> itemsAtRow: row andColumn: column [
	^ (items select: [ :item | item row = row and: [ item column = column ] ]) asArray
]

{ #category : #accessing }
RTApplicationMatrix >> numberOfColumns [
	^ self columns size
]

{ #category : #accessing }
RTApplicationMatrix >> numberOfItems [
	^ items size
]

{ #category : #accessing }
RTApplicationMatrix >> numberOfRows [
	^ self rows size
]

{ #category : #hooks }
RTApplicationMatrix >> renderIn: aView [

	| cells el elementsAsGroup itemsPerCell rowElements  |
	cells := OrderedCollection new.
	
	"First line"
	cells add: (RTLabel elementOn: 'AppMatrix').
	self columns do: [ :cName | 
		el := RTLabel elementOn: cName.
		view add: el.
		cells add: el.
	].
	
	self rows do: [ :row |
		el := RTLabel elementOn: row.
		view add: el.
		cells add: el.
		
		rowElements := RTGroup new.
		self columns do: [ :column |
			itemsPerCell := self itemsAtRow: row andColumn: column.
			
			"elementsAsGroup := ((RTBox new height: 20; width: 200) + (RTLabel new text: #itemName)) elementsOn: itemsPerCell."
			elementsAsGroup := self elementsOn: itemsPerCell.
		
			view addAll: elementsAsGroup.
			RTVerticalLineLayout new gapSize: 1; on: elementsAsGroup.
			cells add: elementsAsGroup.
			rowElements addAll: elementsAsGroup.
		].
	].
	RTCellLayout new lineItemsCount: self numberOfColumns + 1; on: cells.
	
]

{ #category : #'accessing vectorwise' }
RTApplicationMatrix >> rows [
	items ifEmpty: [ ^ #() ].
	^ (items collect: #row) removeDuplicates asArray
]
