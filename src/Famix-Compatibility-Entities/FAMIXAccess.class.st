Class {
	#name : #FAMIXAccess,
	#superclass : #FAMIXAssociation,
	#traits : 'FamixTAccess',
	#classTraits : 'FamixTAccess classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXAccess class >> annotation [

	<FMClass: #Access super: #FAMIXAssociation>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Moose-Query-Extensions' }
FAMIXAccess class >> fromMethod [
	^ self lookupSelector: #accessor
]

{ #category : #'Moose-Query-Extensions' }
FAMIXAccess class >> toMethod [
	^ self lookupSelector: #variable
]

{ #category : #testing }
FAMIXAccess >> isAccess [
	^true
]

{ #category : #accessing }
FAMIXAccess >> isRead [
	<FMProperty: #isRead type: #Boolean> <derived>
	<FMComment: 'Read access'>
	
	^ isWrite isNil ifTrue: [ false ] ifFalse: [ isWrite not ]
]

{ #category : #accessing }
FAMIXAccess >> isReadWriteUnknown [
	<FMProperty: #isReadWriteUnknown type: #Boolean> <derived>
	<FMComment: ''>
	
	^ isWrite isNil
]

{ #category : #accessing }
FAMIXAccess >> isWrite [

	<FMProperty: #isWrite type: #Boolean> 
	<derived>
	<FMComment: 'Write access'>
	^ isWrite ifNil: [ false ]
]

{ #category : #'Famix-Implementation' }
FAMIXAccess >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Access)'
]
