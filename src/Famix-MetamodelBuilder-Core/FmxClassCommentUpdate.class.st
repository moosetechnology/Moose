"
Description
--------------------

I represent a change that would update a class comment during a Famix generation.

Examples
--------------------

	FmxClassCommentUpdate className: FmxClassCommentUpdate comment: 'This is the new comment of my class.'
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	comment:		<aString>		The new comment of the class.

"
Class {
	#name : #FmxClassCommentUpdate,
	#superclass : #FmxLazyClassChange,
	#instVars : [
		'comment'
	],
	#category : #'Famix-MetamodelBuilder-Core-Changes'
}

{ #category : #'instance creation' }
FmxClassCommentUpdate class >> className: aSymbol comment: aString [
	^ self new
		className: aSymbol;
		comment: aString;
		yourself
]

{ #category : #accessing }
FmxClassCommentUpdate >> apply [
	self realClass comment: self comment
]

{ #category : #accessing }
FmxClassCommentUpdate >> comment [
	^ comment
]

{ #category : #accessing }
FmxClassCommentUpdate >> comment: anObject [
	comment := anObject
]
