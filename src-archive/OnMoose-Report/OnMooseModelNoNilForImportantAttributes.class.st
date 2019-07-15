Class {
	#name : #OnMooseModelNoNilForImportantAttributes,
	#superclass : #REPMooseQueryConcern,
	#category : #'OnMoose-Report'
}

{ #category : #accessing }
OnMooseModelNoNilForImportantAttributes >> computeResult [ 
	^ self model allMethods select: [:each | each belongsTo isNil]
]
