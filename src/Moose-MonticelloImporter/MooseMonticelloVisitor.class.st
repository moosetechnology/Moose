"
I run over a structure obtained from a Monticello package. 

Instance Variables:
	importer	<MooseMonticelloImporter> the importer I should use to populate
"
Class {
	#name : #MooseMonticelloVisitor,
	#superclass : #Object,
	#instVars : [
		'importer'
	],
	#category : #'Moose-MonticelloImporter'
}

{ #category : #accessing }
MooseMonticelloVisitor >> importer [
	^ importer
]

{ #category : #accessing }
MooseMonticelloVisitor >> importer: anObject [

	importer := anObject
]

{ #category : #accessing }
MooseMonticelloVisitor >> importingContext [
	^ importer importingContext
]

{ #category : #visiting }
MooseMonticelloVisitor >> visitClassDefinition: def [
]

{ #category : #visiting }
MooseMonticelloVisitor >> visitClassTraitDefinition: definition [
]

{ #category : #visiting }
MooseMonticelloVisitor >> visitMetaclassDefinition: definition [
]

{ #category : #visiting }
MooseMonticelloVisitor >> visitMethodDefinition: definition [
]

{ #category : #visiting }
MooseMonticelloVisitor >> visitOrganizationDefinition: defintion [
]

{ #category : #visiting }
MooseMonticelloVisitor >> visitScriptDefinition: aMCPostscriptDefinition [ 
	"TODO"
]

{ #category : #visiting }
MooseMonticelloVisitor >> visitTraitDefinition: definition [
]
