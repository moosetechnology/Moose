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
Trait {
	#name : #FamixTAccess,
	#instVars : [
		'#accessor => FMOne type: #FamixTWithAccesses opposite: #accesses',
		'#isWrite => FMProperty',
		'#variable => FMOne type: #FamixTAccessible opposite: #incomingAccesses'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-Access'
}

{ #category : #meta }
FamixTAccess classSide >> annotation [

	<FMClass: #TAccess super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTAccess >> accessor [
	"Relation named: #accessor type: #FamixTWithAccesses opposite: #accesses"

	<generated>
	<FMComment: 'Behavioural entity making the access to the variable. from-side of the association'>
	<source>
	^ accessor
]

{ #category : #accessing }
FamixTAccess >> accessor: anObject [

	<generated>
	accessor := anObject
]

{ #category : #testing }
FamixTAccess >> isAccess [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTAccess >> isRead [
	<FMProperty: #isRead type: #Boolean> <derived>
	<FMComment: 'Read access'>
	
	^ isWrite isNil ifTrue: [ false ] ifFalse: [ isWrite not ]
]

{ #category : #accessing }
FamixTAccess >> isReadWriteUnknown [
	<FMProperty: #isReadWriteUnknown type: #Boolean> <derived>
	<FMComment: ''>
	
	^ isWrite isNil
]

{ #category : #accessing }
FamixTAccess >> isWrite [

	<FMProperty: #isWrite type: #Boolean> 
	<derived>
	<FMComment: 'Write access'>
	^ isWrite ifNil: [ false ]
]

{ #category : #accessing }
FamixTAccess >> isWrite: anObject [
	<generated>
	isWrite := anObject
]

{ #category : #accessing }
FamixTAccess >> source [
	^ self accessor
]

{ #category : #accessing }
FamixTAccess >> source: anAccessor [
	self accessor: anAccessor 
]

{ #category : #accessing }
FamixTAccess >> target [
	^ self variable 
]

{ #category : #accessing }
FamixTAccess >> target: aTarget [
	self variable: aTarget
]

{ #category : #accessing }
FamixTAccess >> variable [
	"Relation named: #variable type: #FamixTAccessible opposite: #incomingAccesses"

	<generated>
	<FMComment: 'Variable accessed. to-side of the association'>
	<target>
	^ variable
]

{ #category : #accessing }
FamixTAccess >> variable: anObject [

	<generated>
	variable := anObject
]
