"
FAMIXAccess represents an access to a variable by a behavioural entity (for example, a function or a method). 

For example if the method foo accesses the instance variable x, there is an access with the following information:
	(i) From: aFAMIXMethod (foo)
	(ii) To: aFAMIXAttribute (x)
	
aFAMIXMethod (foo) can be accessed using the message accessor (and from)
aFAMIXAttribute (x) can be accessed using the message variable (and to). 

Furthermore it can be tagged as read or write using isWrite: aBoolean.

For each access in the source code, there is one famix access created even if it is from the same behavioral entity towards the same variable.
	

"
Class {
	#name : #FAMIXAccess,
	#superclass : #FAMIXAssociation,
	#instVars : [
		'isWrite',
		'accessor',
		'variable'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXAccess class >> annotation [
	<MSEClass: #Access super: #FAMIXAssociation>
	<package: #FAMIX>
	^self
]

{ #category : #accessing }
FAMIXAccess >> accessor [
	<MSEProperty: #accessor type: #FAMIXBehaviouralEntity opposite: #accesses>
	<MSEComment: 'Behavioural entity making the access to the variable. from-side of the association'>
	<source>
	^ accessor 
]

{ #category : #accessing }
FAMIXAccess >> accessor: aBehaviouralEntity [ 
	accessor := FMMultivalueLink 
		on: self
		update: #accesses
		from: self accessor
		to: aBehaviouralEntity
]

{ #category : #accessing }
FAMIXAccess >> from [
	^ self accessor 
]

{ #category : #accessing }
FAMIXAccess >> from: anAccessor [
	self accessor: anAccessor 
]

{ #category : #accessing }
FAMIXAccess >> isRead [
	<MSEProperty: #isRead type: #Boolean> <derived>
	<MSEComment: 'Read access'>
	
	^ isWrite isNil ifTrue: [ false ] ifFalse: [ isWrite not ]
]

{ #category : #accessing }
FAMIXAccess >> isReadWriteUnknown [
	<MSEProperty: #isReadWriteUnknown type: #Boolean> <derived>
	<MSEComment: ''>
	
	^ isWrite isNil
]

{ #category : #accessing }
FAMIXAccess >> isWrite [
	<MSEProperty: #isWrite type: #Boolean>
	<MSEComment: 'Write access'>
	
	^ isWrite ifNil: [ false ]
]

{ #category : #accessing }
FAMIXAccess >> isWrite: aBoolean [
	isWrite := aBoolean
]

{ #category : #accessing }
FAMIXAccess >> to [	
	^ self variable 
]

{ #category : #accessing }
FAMIXAccess >> to: aVariable [
	self variable: aVariable
]

{ #category : #accessing }
FAMIXAccess >> variable [
	<MSEProperty: #variable type: #FAMIXStructuralEntity opposite: #incomingAccesses>
	<MSEComment: 'Variable accessed. to-side of the association'>
	<target>
	^ variable 
]

{ #category : #accessing }
FAMIXAccess >> variable: aStructuralEntity [
	(aStructuralEntity isKindOf: FAMIXAnnotationInstanceAttribute) ifFalse: [  
	variable := FMMultivalueLink on: self
					update: #incomingAccesses
					from: self variable
					to: aStructuralEntity]
]
