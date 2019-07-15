"
FamixMetamodelBuilderClassAlias
"
Class {
	#name : #FmxMBClassAlias,
	#superclass : #Object,
	#traits : 'FmxMBRelationSideTrait',
	#classTraits : 'FmxMBRelationSideTrait classTrait',
	#instVars : [
		'subject',
		'trait'
	],
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #accessing }
FmxMBClassAlias >> addRelation: aRelation with: anotherClass [

	^ self subject addRelation: aRelation with: anotherClass
]

{ #category : #'relations - named' }
FmxMBClassAlias >> asRelationSideNamed: aPropertyName [

	^ self trait property: aPropertyName
]

{ #category : #accessing }
FmxMBClassAlias >> builder [

	^ trait builder
]

{ #category : #testing }
FmxMBClassAlias >> isMetamodelClass [

	^ false
]

{ #category : #testing }
FmxMBClassAlias >> isMetamodelTrait [

	^ false
]

{ #category : #testing }
FmxMBClassAlias >> isRemote [

	^ subject isRemote
]

{ #category : #associations }
FmxMBClassAlias >> link: propertyName to: aFmxMBBehavior [

	| aRelation |
	
	aRelation := trait relations detect: [ :relation | relation side name = propertyName ] ifNone: [ self error: ('No property named {1}' format: propertyName) ].
	
	aFmxMBBehavior subclassOf: aRelation oppositeSide relatedClass. 
]

{ #category : #'relations - named' }
FmxMBClassAlias >> pluralPropertyName [

	^ self trait pluralPropertyName
]

{ #category : #accessing }
FmxMBClassAlias >> property: propertyName type: aTypeName [

	^ self trait property: propertyName type: aTypeName
]

{ #category : #'relations - named' }
FmxMBClassAlias >> propertyName [

	^ self trait propertyName
]

{ #category : #accessing }
FmxMBClassAlias >> relatedEntity [

	^ self trait
]

{ #category : #accessing }
FmxMBClassAlias >> relatedEntityName [

	^ self relatedEntity name
]

{ #category : #'relations - named' }
FmxMBClassAlias >> singularPropertyName [

	^ self trait singularPropertyName 
]

{ #category : #accessing }
FmxMBClassAlias >> subject [
	^ subject
]

{ #category : #accessing }
FmxMBClassAlias >> subject: anObject [
	subject := anObject
]

{ #category : #accessing }
FmxMBClassAlias >> trait [
	^ trait
]

{ #category : #accessing }
FmxMBClassAlias >> trait: anObject [
	trait := anObject
]

{ #category : #accessing }
FmxMBClassAlias >> traitName [

	^ self trait name
]
