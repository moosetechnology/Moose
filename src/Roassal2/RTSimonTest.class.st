Class {
	#name : #RTSimonTest,
	#superclass : #RTTest,
	#instVars : [
		'builder'
	],
	#category : #'Roassal2-Builder-Simon'
}

{ #category : #running }
RTSimonTest >> setUp [
	super setUp.
	builder := RTSimon new
]

{ #category : #tests }
RTSimonTest >> testBasic [

	builder models: (Array with: 10 with: 20 with: 30).
	self assert: builder view numberOfElements equals: 3.
	
	self assert: builder view elements anyOne shape class == RTArc.
]

{ #category : #tests }
RTSimonTest >> testDefault [

	self assert: builder view numberOfElements equals: 0
]
