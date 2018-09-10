Class {
	#name : #FAMIXMetricsTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB'
}

{ #category : #tests }
FAMIXMetricsTest >> testNumberOfClasses [
	"self debug: #testNumberOfClasses"
 
	self assert: 2
			 equals: self packageP6InteractedReferee numberOfClasses .
			
	self assert: 4
			 equals: self packageP3InteractedReferencer numberOfClasses.
			
	self assert: 0
			 equals: self packagePExtensions numberOfClasses  
]

{ #category : #tests }
FAMIXMetricsTest >> testNumberOfClientPackages [
	"self debug: #testNumberOfClientPackages"

	self assert: 3
			 equals: self packageP6InteractedReferee numberOfClientPackages.
	
	self assert: 4
			 equals: self packageP11FullReferee numberOfClientPackages.
			
	self assert: 0
				equals: self packageP1FullReferencer numberOfClientPackages
]

{ #category : #tests }
FAMIXMetricsTest >> testRelativeImportanceForSystem [
	"self debug: #testRelativeImportanceForSystem"

	self assert: 3 / 14
			 equals: self packageP6InteractedReferee relativeImportanceForSystem.
	
	self assert: 4 / 14
			 equals: self packageP11FullReferee relativeImportanceForSystem.
			
	self assert: 0
				equals: self packageP1FullReferencer relativeImportanceForSystem.
]
