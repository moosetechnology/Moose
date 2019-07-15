Class {
	#name : #HismoCoChangeHistory,
	#superclass : #HismoAbstractHistory,
	#instVars : [
		'history1',
		'history2'
	],
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoCoChangeHistory class >> annotation [
	<MSEClass: #CoChangeHistory super: #HismoAbstractHistory>
	<package: #Hismo>

]

{ #category : #'instance creation' }
HismoCoChangeHistory class >> withHistory: aHistory withAnotherHistory: anotherHistory [
	
	^(self new)
		history1: aHistory;
		history2: anotherHistory;
		yourself
]

{ #category : #accessing }
HismoCoChangeHistory >> history1 [
	
	^history1
]

{ #category : #accessing }
HismoCoChangeHistory >> history1: anObject [
	
	history1 := anObject
]

{ #category : #accessing }
HismoCoChangeHistory >> history2 [
	
	^history2
]

{ #category : #accessing }
HismoCoChangeHistory >> history2: anObject [
	
	history2 := anObject
]

{ #category : #'public interface' }
HismoCoChangeHistory >> isRelatedToHistory: aHistory [
	
	^self history1 = aHistory or: [self history2 = aHistory]
]
