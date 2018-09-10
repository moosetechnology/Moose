Class {
	#name : #FamixStGlobalVariable,
	#superclass : #FamixStStructuralEntity,
	#traits : 'FamixTGlobalVariable',
	#classTraits : 'FamixTGlobalVariable classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStGlobalVariable class >> annotation [

	<MSEClass: #GlobalVariable super: #FamixStStructuralEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStGlobalVariable class >> generatedSlotNames [
	<generated>
	'FamixStGlobalVariable class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStGlobalVariable class >> generatedTraitNames [
	<generated>
	^ #(FamixTGlobalVariable)
]

{ #category : #meta }
FamixStGlobalVariable class >> requirements [

	<generated>
	^ { FamixStScopingEntity }
]

{ #category : #accessing }
FamixStGlobalVariable >> belongsTo [

	<generated>
	^ self parentScope

]

{ #category : #accessing }
FamixStGlobalVariable >> belongsTo: anObject [

	<generated>
	self parentScope: anObject

]

{ #category : #'moosechef-scoping-filtering' }
FamixStGlobalVariable >> packageScope [
	^ self parentPackage
]

{ #category : #'moosechef-scoping-filtering' }
FamixStGlobalVariable >> typeScope [
	"typeScope does not make sense for a global variable,
	so we return nil"

	^ nil
]
