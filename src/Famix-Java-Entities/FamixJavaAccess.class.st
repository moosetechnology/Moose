Class {
	#name : #FamixJavaAccess,
	#superclass : #FamixJavaAssociation,
	#traits : 'FamixTAccess',
	#classTraits : 'FamixTAccess classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAccess class >> annotation [

	<FMClass: #Access super: #FamixJavaAssociation>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixJavaAccess >> isRead [
	<FMProperty: #isRead type: #Boolean> <derived>
	<FMComment: 'Read access'>
	
	^ isWrite isNil ifTrue: [ false ] ifFalse: [ isWrite not ]
]

{ #category : #accessing }
FamixJavaAccess >> isReadWriteUnknown [
	<FMProperty: #isReadWriteUnknown type: #Boolean> <derived>
	<FMComment: ''>
	
	^ isWrite isNil
]

{ #category : #accessing }
FamixJavaAccess >> isWrite [

	<FMProperty: #isWrite type: #Boolean> 
	<derived>
	<FMComment: 'Write access'>
	^ isWrite ifNil: [ false ]
]

{ #category : #'as yet unclassified' }
FamixJavaAccess >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Access)'
]
