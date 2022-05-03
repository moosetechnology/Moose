"
I show package containment.

I am built for a FamixTypeGroup.
I show all model packages and the classes they contain.
I highlight the types in the FamixTypeGroup.
"
Class {
	#name : #FamixTypeGroupNesting,
	#superclass : #MooseAbstractVisualization,
	#instVars : [
		'famixTypeGroup'
	],
	#category : #'Famix-Visualizations'
}

{ #category : #accessing }
FamixTypeGroupNesting class >> defaultTitle [
	^ 'Nesting'
]

{ #category : #public }
FamixTypeGroupNesting class >> forTypeGroup: aFamixTypeGroup [
	^ self new
		famixTypeGroup: aFamixTypeGroup;
		yourself
]

{ #category : #accessing }
FamixTypeGroupNesting class >> icon [
	^ MooseIcons mooseTreeMap
]

{ #category : #building }
FamixTypeGroupNesting >> build [
	canvas
		addAll: (self modelPackages collect: [ :c | self packageShapeFor: c ]).
	RSRectanglePackLayout new
		gap: 0.1;
		on: canvas nodes.
	super build
]

{ #category : #building }
FamixTypeGroupNesting >> buildLegend [
	| legend |
	legend := RSLegend new.
	legend container: self canvas.
	legend onDemand.
	legend title: self class defaultTitle.
	legend text: 'Boxes represent packages and the classes they contain.'.
	legend text: 'Selected classes' withBoxColor: Color blue muchLighter.
	legend build
]

{ #category : #shapes }
FamixTypeGroupNesting >> classShapeFor: aClass [
	^ RSBox new
		model: aClass;
		color:
			((famixTypeGroup includes: aClass)
				ifTrue: [ Color blue muchLighter ]
				ifFalse: [ Color white ]);
		borderColor: Color gray;
		size: (aClass numberOfMethods max: 5);
		popupText: [ :class | class name ];
		yourself
]

{ #category : #shapes }
FamixTypeGroupNesting >> entitiesIn: aContainer [
	^ (((aContainer toScope: FamixTPackage) copyWithout: aContainer)
		collect: [ :c | self entitiesIn: c ])
		,
			((aContainer toScope: FamixTType)
				reject: [ :class | class isStub ]
				thenCollect: [ :c | self classShapeFor: c ])
]

{ #category : #accessing }
FamixTypeGroupNesting >> famixTypeGroup: aFamixTypeGroup [
	famixTypeGroup := aFamixTypeGroup
]

{ #category : #accessing }
FamixTypeGroupNesting >> modelPackages [
	^ famixTypeGroup mooseModel allPackages
		select: [ :container | 
			container isRoot
				and: [ (container toScope: FamixTType) anySatisfy: [ :c | c isStub not ] ] ]
]

{ #category : #shapes }
FamixTypeGroupNesting >> packageShapeFor: aContainer [
	| composite |
	composite := RSComposite new
		model: aContainer;
		borderColor: Color gray;
		popupText: [ :c | c name ];
		yourself.
	composite addAll: (self entitiesIn: aContainer).
	RSRectanglePackLayout new on: composite nodes.
	composite padding: 2.
	^ composite
]
