"
I am an abstract bridge between examples and SUnit.

Subclasses can specify the packages from which I should collect the examples and run them as tests.
"
Class {
	#name : #GtExampleTestCase,
	#superclass : #TestCase,
	#instVars : [
		'result'
	],
	#category : #'GToolkit-Examples-Testing'
}

{ #category : #testing }
GtExampleTestCase class >> isAbstract [
	^ self name = #GTExampleTestCase
]

{ #category : #private }
GtExampleTestCase >> package: package matchesPackagePattern: packageName [
	^ package packageName = packageName
		or: [ (packageName match: package packageName) 
			or: [ [ package packageName matchesRegexIgnoringCase: packageName ] 
						on: Error 
						do: [ false ] ] ]
]

{ #category : #configuration }
GtExampleTestCase >> packageNames [
	^ {  }
]

{ #category : #private }
GtExampleTestCase >> packages: aCollection [
	| packages |
	packages := OrderedCollection new.
	RPackageOrganizer default packages do: [ :package |
		aCollection do: [ :packageName |
			(self package: package matchesPackagePattern: packageName) ifTrue: [ 
				packages add: package ] ] ].
	^ packages
]

{ #category : #private }
GtExampleTestCase >> run: aResult [
	result := aResult.
	[ super run: aResult ] ensure: [ result := nil ]
]

{ #category : #private }
GtExampleTestCase >> runCase [
	result ifNil: [ result := self classForTestResult new " fake for debug runner " ].
	super runCase. 
]

{ #category : #private }
GtExampleTestCase >> runExample: example [
	" this is not the testing tool we have in mind, but a temporary solution to integrate examples into the currently existing testing tools "
	| exampleResult |
	example ignoreTest ifTrue: [ ^ self ].
	self shouldnt: [ exampleResult := example run ] raise: Error.
	exampleResult isError 
		ifTrue: [ ^ self classForTestResult signalErrorWith: exampleResult gtDisplayString  ].
	exampleResult isFailure 
		ifTrue: [ ^ self classForTestResult signalFailureWith: exampleResult gtDisplayString  ].
	^ exampleResult
]

{ #category : #private }
GtExampleTestCase >> runExampleContainers: aCollection [
	| allExamples |
	(allExamples := aCollection gather: [ :container | container gtExamplesContained ])
		do: [ :example | self runExample: example ]
		displayingProgress: 'Running ' , allExamples size asString , ' Examples'
]

{ #category : #tests }
GtExampleTestCase >> testExamples [
	" default testcase "
	self runExampleContainers: (self packages: self packageNames)
]
