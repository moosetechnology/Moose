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
		'#isWrite',
		'#mySlot',
		'#variable => FMOne type: #FamixTAccessible opposite: #incomingAccesses'
	],
	#category : #'Famix-Traits-Access'
}

{ #category : #meta }
FamixTAccess classSide >> annotation [

	<MSEClass: #TAccess super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTAccess classSide >> generatedSlotNames [
	<generated>
	'FamixTAccess class>>#generatedSlotNames'.
	^ #(accessor isWrite variable)
]

{ #category : #generator }
FamixTAccess classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTAccess >> accessor [

	<generated>
	<MSEComment: 'Behavioural entity making the access to the variable. from-side of the association'>
	<source>

	^ accessor
]

{ #category : #accessing }
FamixTAccess >> accessor: anObject [

	<generated>
	accessor := anObject

]

{ #category : #accessing }
FamixTAccess >> from [
	^ self accessor 
]

{ #category : #accessing }
FamixTAccess >> from: anAccessor [
	self accessor: anAccessor 
]

{ #category : #testing }
FamixTAccess >> isAccess [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTAccess >> isRead [
	<MSEProperty: #isRead type: #Boolean> <derived>
	<MSEComment: 'Read access'>
	
	^ isWrite isNil ifTrue: [ false ] ifFalse: [ isWrite not ]
]

{ #category : #accessing }
FamixTAccess >> isReadWriteUnknown [
	<MSEProperty: #isReadWriteUnknown type: #Boolean> <derived>
	<MSEComment: ''>
	
	^ isWrite isNil
]

{ #category : #accessing }
FamixTAccess >> isWrite [

	<MSEProperty: #isWrite type: #Boolean> 
	<derived>
	<MSEComment: 'Write access'>
	^ isWrite ifNil: [ false ]
]

{ #category : #accessing }
FamixTAccess >> isWrite: anObject [

	<generated>
	isWrite := anObject

]

{ #category : #accessing }
FamixTAccess >> to [	
	^ self variable 
]

{ #category : #accessing }
FamixTAccess >> to: aVariable [
	self variable: aVariable
]

{ #category : #accessing }
FamixTAccess >> variable [

	<generated>
	<MSEComment: 'Variable accessed. to-side of the association'>
	<target>

	^ variable
]

{ #category : #accessing }
FamixTAccess >> variable: anObject [

	<generated>
	variable := anObject

]
