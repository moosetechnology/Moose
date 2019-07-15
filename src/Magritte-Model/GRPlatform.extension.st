Extension { #name : #GRPlatform }

{ #category : #'*magritte-model' }
GRPlatform >> magritteAllSubInstancesOf: aClass do: aBlock [
	"Evaluate the aBlock for all instances of aClass and all its subclasses."
	
	self subclassResponsibility
]

{ #category : #'*magritte-model' }
GRPlatform >> magritteClassNamed: aString [
	"Return the class named aString, nil if the class can't be found."
	
	self subclassResponsibility
]

{ #category : #'*magritte-model' }
GRPlatform >> magritteColorClass [
	"Return a Color class"
	
	self subclassResponsibility
]

{ #category : #'*magritte-model' }
GRPlatform >> magritteEvaluatorClassFor: aClass [
	"Answer an evaluator class appropriate for evaluating expressions in the 
	context of this class."
	
	self subclassResponsibility
]

{ #category : #'*magritte-model' }
GRPlatform >> magritteTimeStampClass [
	"Return the platform's TimeStamp class. It is currently assumed that all platforms
	have one, though this may not be correct and could require moving timestamp stuff
	to its own package in order to resolve."
	
	self subclassResponsibility
]

{ #category : #'*magritte-model' }
GRPlatform >> magritteUniqueObject [
	"Answer a random object, such as a UUID, that is extremely likely to
	be unique over space and time."
	
	self subclassResponsibility
]
