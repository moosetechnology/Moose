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
