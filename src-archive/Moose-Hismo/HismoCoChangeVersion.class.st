Class {
	#name : #HismoCoChangeVersion,
	#superclass : #HismoAbstractVersion,
	#instVars : [
		'history1',
		'history2'
	],
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoCoChangeVersion class >> annotation [
	<MSEClass: #CoChangeVersion super: #HismoAbstractVersion>
	<package: #Hismo>
]

{ #category : #'instance creation' }
HismoCoChangeVersion class >> atReferenceVersion: aVersion [
	
	^(self new)
		referenceVersion: aVersion;
		yourself
]

{ #category : #'instance creation' }
HismoCoChangeVersion class >> atReferenceVersion: aVersion withHistory: aHistory [
	
	^(self new)
		referenceVersion: aVersion;
		history: aHistory;
		yourself
]

{ #category : #'instance creation' }
HismoCoChangeVersion class >> withHistory: aHistory1 withAnotherHistory: aHistory2 withRespectToVersion: aVersion [
	
	^(self new)
		referenceVersion: aVersion;
		history1: aHistory1;
		history2: aHistory2;
		yourself
]

{ #category : #printing }
HismoCoChangeVersion >> versionUniqueName [
	
	^(self history history1 mooseName , '-' , self history history2 mooseName)
		asSymbol
]
