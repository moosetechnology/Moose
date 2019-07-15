"
I am root of hierarchy of specifications for objects relationship

My instances can be created by 

	SpecOfObjectRelationship requiredClass: String

Internal Representation and Key Implementation Points.

    Instance Variables
	requiredClass:		<Class>
"
Class {
	#name : #SpecOfObjectRelationship,
	#superclass : #SpecOfObjectState,
	#instVars : [
		'requiredClass'
	],
	#category : 'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfObjectRelationship class >> requiredClass: aClass [ 
	^self new requiredClass: aClass
]

{ #category : #displaying }
SpecOfObjectRelationship >> clauseKeyword [
	self subclassResponsibility
]

{ #category : #displaying }
SpecOfObjectRelationship >> defaultTitle [
	^self clauseKeyword , ' ' , requiredClass name
]

{ #category : #accessing }
SpecOfObjectRelationship >> requiredClass [
	^requiredClass
]

{ #category : #accessing }
SpecOfObjectRelationship >> requiredClass: aClass [ 
	requiredClass := aClass
]
