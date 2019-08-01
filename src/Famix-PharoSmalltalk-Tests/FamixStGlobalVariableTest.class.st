Class {
	#name : #FamixStGlobalVariableTest,
	#superclass : #FamixStNamedEntityTest,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #helpers }
FamixStGlobalVariableTest >> actualClass [ 
		^ FamixStGlobalVariable
]

{ #category : #tests }
FamixStGlobalVariableTest >> testClassScope [ 
	self assert: self actualClass new typeScope isNil
]

{ #category : #tests }
FamixStGlobalVariableTest >> testPackageScope [ 
	self assert: self actualClass new packageScope isNil
]
