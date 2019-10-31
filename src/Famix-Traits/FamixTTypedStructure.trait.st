Trait {
	#name : #FamixTTypedStructure,
	#instVars : [
		'#declaredType => FMOne type: #FamixTWithTypedStructures opposite: #structuresWithDeclaredType'
	],
	#category : #'Famix-Traits-TypedStructure'
}

{ #category : #meta }
FamixTTypedStructure classSide >> annotation [

	<FMClass: #TTypedStructure super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTTypedStructure >> declaredType [
	"Relation named: #declaredType type: #FamixTWithTypedStructures opposite: #structuresWithDeclaredType"

	<generated>
	<FMComment: 'Type of the behavioral entity, if any'>
	^ declaredType
]

{ #category : #accessing }
FamixTTypedStructure >> declaredType: anObject [

	<generated>
	declaredType := anObject
]

{ #category : #'moose query' }
FamixTTypedStructure >> entityHasOutgoingTypeDeclarations [
	^ self hasDeclaredType
]

{ #category : #testing }
FamixTTypedStructure >> hasDeclaredType [
	^ self declaredType isNotNil
]

{ #category : #'moose query' }
FamixTTypedStructure >> outgoingTypeDeclarations [
	^ self declaredType ifNil: [ {} ] ifNotNil: [ :dt | {(MooseQueryTypeDeclarationAssociation newFrom: self to: dt)} ]
]
