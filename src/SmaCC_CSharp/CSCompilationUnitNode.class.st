Class {
	#name : #CSCompilationUnitNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'directives',
		'_attributes',
		'declarations'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSCompilationUnitNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSCompilationUnitNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSCompilationUnitNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCompilationUnit: self
]

{ #category : #generated }
CSCompilationUnitNode >> compositeNodeVariables [
	^ #(#directives #_attributes #declarations)
]

{ #category : #generated }
CSCompilationUnitNode >> declarations [
	^ declarations
]

{ #category : #generated }
CSCompilationUnitNode >> declarations: anOrderedCollection [
	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #generated }
CSCompilationUnitNode >> directives [
	^ directives
]

{ #category : #generated }
CSCompilationUnitNode >> directives: anOrderedCollection [
	self setParents: self directives to: nil.
	directives := anOrderedCollection.
	self setParents: self directives to: self
]

{ #category : #'generated-initialize-release' }
CSCompilationUnitNode >> initialize [
	super initialize.
	directives := OrderedCollection new: 2.
	_attributes := OrderedCollection new: 2.
	declarations := OrderedCollection new: 2.
]
