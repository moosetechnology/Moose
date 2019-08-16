Class {
	#name : #FAMIXMetricsTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB'
}

{ #category : #tests }
FAMIXMetricsTest >> testNumberOfClasses [
	self assert: self packageP6InteractedReferee numberOfClasses equals: 2.
	self assert: self packageP3InteractedReferencer numberOfClasses equals: 4.
	self assert: self packagePExtensions numberOfClasses equals: 0
]

{ #category : #tests }
FAMIXMetricsTest >> testNumberOfClientPackages [
	self assert: self packageP6InteractedReferee numberOfClientPackages equals: 3.
	self assert: self packageP11FullReferee numberOfClientPackages equals: 4.
	self assert: self packageP1FullReferencer numberOfClientPackages equals: 0
]

{ #category : #tests }
FAMIXMetricsTest >> testRelativeImportanceForSystem [
	self assert: self packageP6InteractedReferee relativeImportanceForSystem equals: 3 / 14.
	self assert: self packageP11FullReferee relativeImportanceForSystem equals: 4 / 14.
	self assert: self packageP1FullReferencer relativeImportanceForSystem equals: 0
]
