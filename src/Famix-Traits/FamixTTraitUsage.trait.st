Trait {
	#name : #FamixTTraitUsage,
	#instVars : [
		'#trait => FMOne type: #FamixTTrait opposite: #incomingTraitUsages',
		'#user => FMOne type: #FamixTTraitUser opposite: #outgoingTraitUsages'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-Trait'
}

{ #category : #meta }
FamixTTraitUsage classSide >> annotation [

	<FMClass: #TTraitUsage super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTTraitUsage >> source [
	^ self user
]

{ #category : #accessing }
FamixTTraitUsage >> source: anObject [
	self user: anObject
]

{ #category : #accessing }
FamixTTraitUsage >> target [
	^ self trait
]

{ #category : #accessing }
FamixTTraitUsage >> target: anObject [
	self trait: anObject
]

{ #category : #accessing }
FamixTTraitUsage >> trait [
	"Relation named: #trait type: #FamixTTrait opposite: #incomingTraitUsages"

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
	"Relation named: #user type: #FamixTTraitUser opposite: #outgoingTraitUsages"

	<generated>
	<target>
	^ user
]

{ #category : #accessing }
FamixTTraitUsage >> user: anObject [

	<generated>
	user := anObject
]
