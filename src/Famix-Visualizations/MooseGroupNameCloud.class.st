"
I show keywords in a Moose group entities names.

Those keywords are ordered by number of entities in which name they are present.
"
Class {
	#name : #MooseGroupNameCloud,
	#superclass : #MooseAbstractVisualization,
	#instVars : [
		'mooseGroup'
	],
	#category : #'Famix-Visualizations'
}

{ #category : #accessing }
MooseGroupNameCloud class >> defaultTitle [
	^ 'Name cloud'
]

{ #category : #'as yet unclassified' }
MooseGroupNameCloud class >> forMooseGroup: aMooseGroup [
	^ self new
		mooseGroup: aMooseGroup;
		yourself
]

{ #category : #accessing }
MooseGroupNameCloud class >> icon [
	^ Smalltalk ui theme iconNamed: #glamorousCloud
]

{ #category : #building }
MooseGroupNameCloud >> build [
	self buildLabels.
	self normalizeLabels.
	self setLayout.
	super build
]

{ #category : #building }
MooseGroupNameCloud >> buildLabels [
	canvas
		addAll:
			(self keywordsInGroupEntitiesNames
				collect: [ :each | 
					RSLabel new
						model: each;
						text: each key;
						popupText: each value size asString ])
]

{ #category : #building }
MooseGroupNameCloud >> buildLegend [
	| legend |
	legend := RSLegend new.
	legend container: self canvas.
	legend onDemand.
	legend title: self class defaultTitle.
	legend text: 'Keywords presents in entities names, by frequency'.
	legend build
]

{ #category : #keywords }
MooseGroupNameCloud >> entityAndItsKeywords: anEntity [
	| keywords |
	keywords := (anEntity name substrings: self class separators)
		flatCollect: [ :substring | 
			substring piecesCutWhereCamelCase
				collect: [ :y | MalStemmer English stem: y ] ].
	^ keywords
		reject: [ :keyword | self class stopWordList includes: keyword ]
		thenCollect: [ :keyword | keyword -> anEntity ]
]

{ #category : #keywords }
MooseGroupNameCloud >> keywordsInGroupEntitiesNames [
	^ ((mooseGroup
		flatCollect: [ :entity | self entityAndItsKeywords: entity ])
		groupedBy: #key
		affect: [ :association | association collect: #value ]) associations
		sortDescending: [ :keyWordAndEntities | keyWordAndEntities value size ]
]

{ #category : #accessing }
MooseGroupNameCloud >> mooseGroup: anObject [
	mooseGroup := anObject
]

{ #category : #building }
MooseGroupNameCloud >> mooseInterestingEntityForNode: node [
	^ node model value asMooseGroup specialize
]

{ #category : #building }
MooseGroupNameCloud >> normalizeLabels [
	RSNormalizer fontSize
		shapes: canvas nodes;
		normalize: [ :each | each value size ]
]

{ #category : #building }
MooseGroupNameCloud >> setLayout [
	RSFlowLayout new
		alignMiddle;
		gapSize: 20;
		on: canvas nodes
]
