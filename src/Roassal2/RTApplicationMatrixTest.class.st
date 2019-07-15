Class {
	#name : #RTApplicationMatrixTest,
	#superclass : #RTTest,
	#instVars : [
		'b'
	],
	#category : #'Roassal2-Builder-ApplicationMatrix'
}

{ #category : #running }
RTApplicationMatrixTest >> setUp [
	super setUp.
	b := RTApplicationMatrix new.
]

{ #category : #tests }
RTApplicationMatrixTest >> testBasic [
	| item01 item02 item03 |
	item01 := RTAMItem new.
	item01 itemName: 'Contract Management'.
	item01 row: 'Australia'.
	item01 column: 'Corporate Services'.
	
	item02 := RTAMItem new.
	item02 itemName: 'Bonus Card Use Watch'.
	item02 row: 'Australia'.
	item02 column: 'Corporate Services'.

	item03 := RTAMItem new.
	item03 itemName: 'MailSnake'.
	item03 row: 'Australia'.
	item03 column: 'Customer Relationship'.
	
	b add: item01; add: item02; add: item03.
	self assert: b numberOfItems equals: 3.
	b renderIn: RTView new.
	
	self assert: b numberOfItems equals: 3.
	self assert: b rows equals: #('Australia').
	self assert: b columns equals: #('Corporate Services' 'Customer Relationship').
	
	self 
		assert: (b itemsAtRow: 'Australia' andColumn: 'Customer Relationship') 
		equals: (Array with: item03).
	self 
		assert: (b itemsAtRow: 'Australia' andColumn: 'Corporate Services') 
		equals: (Array with: item01 with: item02).
]

{ #category : #tests }
RTApplicationMatrixTest >> testEmpty [

	self assert: b numberOfItems equals: 0.
	self assert: b numberOfRows equals: 0.
	self assert: b numberOfColumns equals: 0.
	self assert: b rows equals: #().
	self assert: b columns equals: #().
	
]

{ #category : #tests }
RTApplicationMatrixTest >> testRender [

	b renderIn: RTView new
]
