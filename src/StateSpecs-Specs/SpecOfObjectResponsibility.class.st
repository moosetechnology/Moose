"
I describe all objects which responds to particular message.

	(10@230) should respondTo: #x

My instances can be created by 

	SpecOfObjectResponsibility requiredMessage: #x 
 
Internal Representation and Key Implementation Points.

    Instance Variables
	requiredMessage:		<Symbol>

"
Class {
	#name : #SpecOfObjectResponsibility,
	#superclass : #SpecOfObjectState,
	#instVars : [
		'requiredMessage'
	],
	#category : 'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfObjectResponsibility class >> for: aSelector [ 
	^self new requiredMessage: aSelector
]

{ #category : #testing }
SpecOfObjectResponsibility >> basicMatches: anObject [ 
	^anObject respondsTo: requiredMessage
]

{ #category : #displaying }
SpecOfObjectResponsibility >> defaultTitle [
	^'respond to ' , requiredMessage stringForSpecTitle 
]

{ #category : #accessing }
SpecOfObjectResponsibility >> requiredMessage [
	^requiredMessage
]

{ #category : #accessing }
SpecOfObjectResponsibility >> requiredMessage: aSymbol [ 
	requiredMessage := aSymbol
]
