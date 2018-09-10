Class {
	#name : #OnMooseTranscriptUsages,
	#superclass : #REPMooseQueryConcern,
	#category : #'OnMoose-Report'
}

{ #category : #'as yet unclassified' }
OnMooseTranscriptUsages >> classesToIgnore [
	^ #(#OSProcess
		#UnixProcess 
		#AioEventHandlerExample 
		#UnixOSProcessAccessor 
		#LANNode 
		#WorkStation 
		#TheRoot 
		#DictionarySpeedTest 
		#ObjectTester 
		#FileServer 
		#DudeAClass 
		#DudeAnotherClass
		'LAN*')
]

{ #category : #'as yet unclassified' }
OnMooseTranscriptUsages >> computeResult [
	| transcript allTranscriptAccessors |
	transcript := self model allGlobalVariables entityNamed: #Transcript.
	allTranscriptAccessors := transcript incomingAccesses collectAsSet: [ :anAccess | anAccess accessor ].
	^ (allTranscriptAccessors
		reject: [ :each | each parentType isStub or: [ 
				self classesToIgnore anySatisfy: [ :toIgnore | 
					toIgnore match: each parentType name ] ] ]) asMooseGroup
]

{ #category : #'as yet unclassified' }
OnMooseTranscriptUsages >> explanation [
	^'Transcript should not be used in the code'
]

{ #category : #'as yet unclassified' }
OnMooseTranscriptUsages >> label [ 
	^'Transcript usages'
]

{ #category : #accessing }
OnMooseTranscriptUsages >> stakeholder [
	^ OnMoosePeople tudorGirba
]

{ #category : #'as yet unclassified' }
OnMooseTranscriptUsages >> statusValue [ 
	^ nil
]
