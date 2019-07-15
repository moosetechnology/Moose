Trait {
	#name : #FamixTTraitUsage,
	#instVars : [
		'#trait => FMOne type: #FamixTTrait opposite: #incomingTraitUsages',
		'#user => FMOne type: #FamixTTraitUser opposite: #outgoingTraitUsages'
	],
	#category : #'Famix-Traits-Trait'
}

{ #category : #meta }
FamixTTraitUsage classSide >> annotation [

	<MSEClass: #TTraitUsage super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTTraitUsage classSide >> generatedSlotNames [
	<generated>
	'FamixTTraitUsage class>>#generatedSlotNames'.
	^ #(trait user)
]

{ #category : #generator }
FamixTTraitUsage classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTTraitUsage >> from [
	^ self user
]

{ #category : #accessing }
FamixTTraitUsage >> from: anObject [
	self user: anObject
]

{ #category : #accessing }
FamixTTraitUsage >> to [
	^ self trait
]

{ #category : #accessing }
FamixTTraitUsage >> to: anObject [
	self trait: anObject
]

{ #category : #accessing }
FamixTTraitUsage >> trait [

	<generated>
	<source>

	^ trait
]

{ #category : #accessing }
FamixTTraitUsage >> trait: anObject [

	<generated>
	trait := anObject

]

{ #category : #accessing }
FamixTTraitUsage >> user [

	<generated>
	<target>

	^ user
]

{ #category : #accessing }
FamixTTraitUsage >> user: anObject [

	<generated>
	user := anObject

]
