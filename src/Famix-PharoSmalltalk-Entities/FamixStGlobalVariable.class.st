Class {
	#name : #FamixStGlobalVariable,
	#superclass : #FamixStNamedEntity,
	#traits : 'FamixStStructuralEntity + FamixTGlobalVariable',
	#classTraits : 'FamixStStructuralEntity classTrait + FamixTGlobalVariable classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStGlobalVariable class >> annotation [

	<MSEClass: #GlobalVariable super: #FamixStNamedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
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
