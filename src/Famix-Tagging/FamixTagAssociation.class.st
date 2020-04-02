"
Description
--------------------

I represent the link between a tag and the tagged entity. 
For more information on my usefulness, read the comment of FamixTag.	

The tag I reference is referenced weakly. 
This allows one to change of model and my associations will find the tags of the updated model by searching for a tag with the right id.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	entity:		<aFamixEntity>		The tagged entity.
	tag:			<aFamixTag>			A weak reference to the tag tagging the entity.
	tagId:			<aNumber>				The id of the tag used in case we lose the reference.

"
Class {
	#name : #FamixTagAssociation,
	#superclass : #MooseEntity,
	#instVars : [
		'#tagId',
		'#entity',
		'#tag => WeakSlot'
	],
	#category : #'Famix-Tagging-Model'
}

{ #category : #meta }
FamixTagAssociation class >> annotation [
	<MSEClass: #Association super: #MooseEntity>
	<package: #Tagging>
	<abstract>
]

{ #category : #'import-export' }
FamixTagAssociation class >> fuelIgnoredInstanceVariableNames [
    ^#('mooseID')
]

{ #category : #'instance creation' }
FamixTagAssociation class >> newForEntity: entity tag: aTag [
	^ self new
		entity: entity tag: aTag;
		yourself
]

{ #category : #accessing }
FamixTagAssociation >> announceUpdate [
	self mooseModel ifNotNil: [ :model | model announcer announce: FamixTagModifiedAnnouncement ]
]

{ #category : #ston }
FamixTagAssociation >> checkingDoubleTagging [
	^ (self entity tagAssociations \ { self }) anySatisfy: [ :anAssociation | anAssociation tag = self tag ]
]

{ #category : #accessing }
FamixTagAssociation >> entity [
	<MSEProperty: #entity type: #MooseEntity>
	<MSEComment: 'Tagged entity'>
	^ entity
]

{ #category : #accessing }
FamixTagAssociation >> entity: anEntity [
	"The tag association must be stored in the same model as the entity"

	self setEntityTo: anEntity.
	self announceUpdate
]

{ #category : #accessing }
FamixTagAssociation >> entity: anEntity tag: aTag [
	self
		setEntityTo: anEntity;
		setTagTo: aTag;
		announceUpdate
]

{ #category : #ston }
FamixTagAssociation >> fromSton: aTagStonReader [
	| actions failed |
	failed := false.
	actions := {(#entityMooseName
		-> [ :anEntityMooseId | 
			(aTagStonReader model entityNamed: anEntityMooseId)
				ifNotNil: [ :anEntity | self entity: anEntity ]
				ifNil: [ failed := true.
					aTagStonReader report missedEntity: anEntityMooseId ] ])} asDictionary.
	aTagStonReader
		parseMapDo: [ :instVarName :value | 
			failed
				ifFalse: [ actions
						at: instVarName
						ifPresent: [ :aBlock | aBlock value: value ]
						ifAbsent: [ | resolved |
							resolved := value isStonReference
								ifTrue: [ aTagStonReader resolveReference: value ]
								ifFalse: [ value ].
							self perform: (instVarName , ':') asSymbol with: resolved ] ] ].
	(failed not and: [ self checkingDoubleTagging ]) ifTrue: [ self remove ]
]

{ #category : #initialization }
FamixTagAssociation >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #testing }
FamixTagAssociation >> isCodeTagAssociation [
	^ false
]

{ #category : #testing }
FamixTagAssociation >> isEntityTagAssociation [
	^ false
]

{ #category : #accessing }
FamixTagAssociation >> mooseModel: aMooseModel [
	"We add the association at the beginning of the model entity storage because the user can delete associations but not entities. It is much faster to delete entities at the beginning of the collection. On a big model it can take several second to delete some tags."

	aMooseModel addTaggingEntityFirst: self.
	self privateSetMooseModel: aMooseModel
]

{ #category : #printing }
FamixTagAssociation >> mooseNameOn: aStream [

	aStream nextPutAll: self name
]

{ #category : #printing }
FamixTagAssociation >> printOn: aStream [
	aStream
		nextPutAll: 'TagAssociation(';
		print: self tagId;
		nextPut: $)
]

{ #category : #tagging }
FamixTagAssociation >> remove [
	self entity: nil.
	tag := nil.
	self mooseModel removeTaggingEntity: self
]

{ #category : #accessing }
FamixTagAssociation >> setEntityTo: anEntity [
	anEntity ifNotNil: [ anEntity mooseModel ifNotNil: [ :model | self mooseModel: model ] ].
	entity := FMMultivalueLink
		on: self
		update: #tagAssociations
		from: self entity
		to: anEntity
]

{ #category : #accessing }
FamixTagAssociation >> setTagTo: aTag [
	self tagId: aTag id.
	self mooseModel ifNil: [ self mooseModel: aTag mooseModel ].
	tag := aTag
]

{ #category : #ston }
FamixTagAssociation >> stonContainSubObjects [
	^ false
]

{ #category : #ston }
FamixTagAssociation >> stonMapForTagModel: aTagModel [
	^ OrderedDictionary new
		at: #entityMooseName put: self entity mooseName;
		at: #tag put: (self tagInTagModel: aTagModel);
		yourself
]

{ #category : #ston }
FamixTagAssociation >> stonOn: stonWriter [
	stonWriter writeObject: self do: [ stonWriter encodeMap: (self stonMapForTagModel: stonWriter tagModel) ]
]

{ #category : #accessing }
FamixTagAssociation >> tag [
	<MSEProperty: #tag type: #FamixTag>
	<derived>
	<MSEComment: 'The tag referenced by the association; because of the link between Tag model and regular MooseModel, the link is weak so be careful using it'>
	tag
		ifNil: [ [ self tagInTagModel: self mooseModel ]
				on: NotFound
				do: [ FamixTagUnamedFailure signal: 'Unreachable tag, be careful using this method; designed for performance' ] ].
	^ tag ifNil: [ FamixTagWeakReferenceLostFailure signal: 'Weak reference to tag has been lost' ]
]

{ #category : #accessing }
FamixTagAssociation >> tag: aTag [
	self setTagTo: aTag.
	self announceUpdate
]

{ #category : #accessing }
FamixTagAssociation >> tagId [
	<MSEProperty: #tagId type: #Number>
	<MSEComment: 'The moose id of a tag placed on an entity (not directly the tag because it have to work on multi version'>
	^ tagId
]

{ #category : #accessing }
FamixTagAssociation >> tagId: aTagId [
	tagId := aTagId
]

{ #category : #accessing }
FamixTagAssociation >> tagInTagModel: aTagModel [
	aTagModel ifNil: [ NotFound signalFor: self in: aTagModel ].

	^ tag := aTagModel findTagWithId: self tagId
]
