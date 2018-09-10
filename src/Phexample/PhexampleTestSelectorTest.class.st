Class {
	#name : #PhexampleTestSelectorTest,
	#superclass : #Phexample,
	#category : #'Phexample-Test'
}

{ #category : #tests }
PhexampleTestSelectorTest >> shouldAllowShouldInBeginningOfSelector [
	(Phexample isTest: #shouldBeTest) should be: true
]

{ #category : #tests }
PhexampleTestSelectorTest >> shouldAllowShouldInMiddleOfSelector [
	(Phexample isTest: #fooShouldBeAllowed) should be: true
]

{ #category : #tests }
PhexampleTestSelectorTest >> shouldNotAllowSelectorsWithArguments [
	(Phexample isTest: #shouldFoo:) should be: false.
	(Phexample isTest: #fooShould:NotBeAllowed:) should be: false.
]
