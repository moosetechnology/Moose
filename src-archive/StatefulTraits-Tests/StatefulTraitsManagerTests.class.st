Class {
	#name : #StatefulTraitsManagerTests,
	#superclass : #TestCase,
	#category : #'StatefulTraits-Tests'
}

{ #category : #tests }
StatefulTraitsManagerTests >> testEmpty [

	| manager |
	
	manager := StatefulTraitsManager new.
	self assert: manager mergedClasses isEmpty.
]

{ #category : #tests }
StatefulTraitsManagerTests >> testManage [

	| manager |
	
	manager := StatefulTraitsManager new.
	manager manage: self testingClass.
	self assert: manager mergedClasses size equals: 1.
	manager manage: self testingClass.
	self assert: manager mergedClasses size equals: 1.	
]

{ #category : #tests }
StatefulTraitsManagerTests >> testManages [

	| manager |
	
	manager := StatefulTraitsManager new.
	self deny: (manager manages: self testingClass).
	manager manage: self testingClass.
	self assert: (manager manages: self testingClass).

]

{ #category : #accessing }
StatefulTraitsManagerTests >> testingClass [

	^ StatefulTraitsTestingMergedClass 
]
