"
Builds a FAMIX model for testing tags on moose entities
"
Class {
	#name : #FamixTagMockModelBuilder,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Famix-Tagging-Tests'
}

{ #category : #running }
FamixTagMockModelBuilder class >> buildModel [
	^self new buildModel
]

{ #category : #running }
FamixTagMockModelBuilder class >> buildModelWithoutTags [
	^ self new simpleModel; model
]

{ #category : #'model-building' }
FamixTagMockModelBuilder >> buildCodeTag [
	| entity |
	entity := self entityToTag.
	(FamixTag named: 'dead-code')
		description: 'Not used code';
		color: Color red;
		addCategory: ((FamixTagCategory named: 'bookmark') mooseModel: self model);
		mooseModel: self model;
		tagInterval: (10 to: 300) forEntity: entity sourceAnchor: entity sourceAnchor
]

{ #category : #'model-building' }
FamixTagMockModelBuilder >> buildModel [
	self simpleModel.
	self buildTags.
	^ model
]

{ #category : #'model-building' }
FamixTagMockModelBuilder >> buildTag [
	(FamixTag named: 'database')
		description: 'Implements database functionality';
		color: Color green;
		addCategory: ((FamixTagCategory named: 'feature') mooseModel: self model);
		mooseModel: self model;
		tagEntity: self entityToTag
]

{ #category : #'model-building' }
FamixTagMockModelBuilder >> buildTags [
	self buildCodeTag.
	self buildTag.
]

{ #category : #helpers }
FamixTagMockModelBuilder >> createEntitiesFor: counter [
	(FamixTagTestClass named: 'Class' , counter asString model: model)
		typeContainer: (FamixTagTestPackage named: 'Package' , counter asString model: model);
		sourceAnchor:
			(FamixTagTestSourceTextAnchor new
				source: self sourceText;
				mooseModel: model;
				yourself)
]

{ #category : #helpers }
FamixTagMockModelBuilder >> entityToTag [
	^ model entityNamed: 'Package1::Class1'
]

{ #category : #helpers }
FamixTagMockModelBuilder >> model [
	^ model
]

{ #category : #'model-building' }
FamixTagMockModelBuilder >> simpleModel [
	model := FamixTagTestModel named: 'Tagging-Model'.
	self
		createEntitiesFor: 1;
		createEntitiesFor: 2
]

{ #category : #helpers }
FamixTagMockModelBuilder >> sourceText [
	^ '// HelloWorld.java

public class HelloWorld {
	public static void main(String[] args) {
		System.out.println("Hello World!");
	}
}'
]
