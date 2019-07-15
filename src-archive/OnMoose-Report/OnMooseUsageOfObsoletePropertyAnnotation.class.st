Class {
	#name : #OnMooseUsageOfObsoletePropertyAnnotation,
	#superclass : #REPMooseQueryConcern,
	#category : #'OnMoose-Report'
}

{ #category : #accessing }
OnMooseUsageOfObsoletePropertyAnnotation >> computeResult [ 
	| tmp |
	tmp := OrderedCollection new.
	self obsoletePragmaNames do: [:each | 
		self model allAnnotationTypes 
				entityNamed: each 
				ifAbsent: [ OrderedCollection new ]
				ifPresent: [:ann | tmp addAll: ann annotatedEntities ] ].

	^ FAMIXMethodGroup withAll: tmp 
]

{ #category : #accessing }
OnMooseUsageOfObsoletePropertyAnnotation >> explanation [
	^ 'All <property: ... > pragmas should be replaced with <MSEProperty: ...> ones.
	
See:
http://code.google.com/p/moose-technology/issues/detail?id=706'
]

{ #category : #accessing }
OnMooseUsageOfObsoletePropertyAnnotation >> label [
	^ 'Use of obsolete <property:...> pragmas'
]

{ #category : #accessing }
OnMooseUsageOfObsoletePropertyAnnotation >> obsoletePragmaNames [
	^ #(
		property:longName:description:
		property:
		)
]

{ #category : #accessing }
OnMooseUsageOfObsoletePropertyAnnotation >> stakeholder [
	^ OnMoosePeople tudorGirba
]
