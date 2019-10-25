Class {
	#name : #FamixCSharpMooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-CSharp-Entities'
}

{ #category : #'import-export' }
FamixCSharpMooseModel class >> importFrom: aStream withMetamodel: aMetamodel [
	| tower importer copyReplace |
	tower := FMCompleteTower new.
	tower metamodel addAll: aMetamodel elements.
	importer := MSEImporter new.
	importer repository: tower model.
	copyReplace := FMCopyReplaceTranslationUnit new
		replacing: 'FAMIX' with: '@';
		replacing: 'Famix' with: '@';
		replacing: '@' with: 'Famix-CSharp-Entities';
		replacing:'CSharp.CSharp' with: 'Famix-CSharp-Entities.';
		replacing:'CSharp.' with: 'Famix-CSharp-Entities.';
		yourself.
	importer translationUnit: copyReplace.
	importer stream: aStream.
	importer run.
	tower model updateCache.
	^ tower model
]

{ #category : #initialization }
FamixCSharpMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FamixCSharpGenerator) metamodel
]
