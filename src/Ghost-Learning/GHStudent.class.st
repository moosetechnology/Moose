"
I am special ghost to study all messages which sent to me. On any messages I ask my teacher for real implementations for it. I save it and execute it. This behaviour is implemented by my learning instance.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	learning:		<Learning>
"
Class {
	#name : #GHStudent,
	#superclass : #GHObjectGhost,
	#instVars : [
		'learning'
	],
	#category : #'Ghost-Learning'
}

{ #category : #'instance creation' }
GHStudent class >> new [
	^self withTeacher: Object
]

{ #category : #'instance creation' }
GHStudent class >> withTeacher: aClass [
	^self basicNew 
		teacher: Object
]

{ #category : #accessing }
GHStudent >> ghostBehaviour [
	^learning
]

{ #category : #accessing }
GHStudent >> learning [
	^learning
]

{ #category : #accessing }
GHStudent >> teacher [
	^ learning teacher
]

{ #category : #accessing }
GHStudent >> teacher: anObject [
	learning := GHLearning by: anObject
]
