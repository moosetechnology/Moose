Class {
	#name : #GNumberTest,
	#superclass : #TestCase,
	#category : 'Geometry-Test'
}

{ #category : #tests }
GNumberTest >> testIsBetween [
	self assert:(2 isBetween: 2.2 and: 5 with: 0.2 )
		equals: true.
	
	self assert:( 1.8 isBetween: 1.8 and: 5 with: 0.2 )
		equals: true.
		
	self assert:( 1.5 isBetween: 1.8 and: 5 with: 0.2 )
		equals: true.
		
	self assert:( 1.5 isBetween: 1.8 and: 5 with: 0.1 )
		equals: false.
		
	self assert:( 1.88 isBetween: 1.5 and: 5 with: 0.2 )
		equals: true.
]
