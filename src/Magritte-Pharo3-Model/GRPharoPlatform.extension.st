Extension { #name : #GRPharoPlatform }

{ #category : #'*Magritte-Pharo3-Model' }
GRPharoPlatform >> magritteAllSubInstancesOf: aClass do: aBlock [
	"Evaluate the aBlock for all instances of aClass and all its subclasses."

	aClass allSubInstancesDo: aBlock
]

{ #category : #'*Magritte-Pharo3-Model' }
GRPharoPlatform >> magritteClassNamed: aString [
	"Return the class named aString, nil if the class can't be found."

	^ Smalltalk classNamed: aString
]

{ #category : #'*Magritte-Pharo3-Model' }
GRPharoPlatform >> magritteColorClass [
	"Return a Color class"
	
	^ Color
]

{ #category : #'*Magritte-Pharo3-Model' }
GRPharoPlatform >> magritteEvaluatorClassFor: aClass [
	"Answer an evaluator class appropriate for evaluating expressions in the 
	context of this class."
	
	^ aClass compilerClass
]

{ #category : #'*Magritte-Pharo3-Model' }
GRPharoPlatform >> magritteTimeStampClass [
	"Return the platform's TimeStamp class. It is currently assumed that all platforms
	have one, though this may not be correct and could require moving timestamp stuff
	to its own package in order to resolve."
	
	^ DateAndTime
]

{ #category : #'*Magritte-Pharo3-Model' }
GRPharoPlatform >> magritteTimeStampIfAbsent: absentBlock [
	"Return the TimeStamp class, or if the platform does not have a TimeStamp
	return the result of evaluating absentBlock."
	
	^ DateAndTime
]

{ #category : #'*Magritte-Pharo3-Model' }
GRPharoPlatform >> magritteUniqueObject [
	"Answer a random object, such as a UUID, that is extremely likely to
	be unique over space and time."

	^ ByteArray withAll: UUID new
]
