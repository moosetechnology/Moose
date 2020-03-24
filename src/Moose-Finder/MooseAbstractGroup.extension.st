Extension { #name : #MooseAbstractGroup }

{ #category : #'*moose-finder' }
MooseAbstractGroup >> customNavigationItems [
	| classes result |
	classes := self metamodel allImplementingClasses select: [ :each | each inheritsFrom: MooseObject ].

	result := OrderedCollection new.
	classes
		do: [ :each | 
			| aGroup |
			aGroup := self allWithType: each.
			aGroup isEmpty ifFalse: [ result add: each -> (self allWithType: each) ] ].
	^ result
]

{ #category : #'*moose-finder' }
MooseAbstractGroup >> gtDisplayOn: aStream [
	super gtDisplayOn: aStream.
	aStream nextPut: $(.
	aStream print: self size.
	aStream nextPut: $)
]

{ #category : #'*moose-finder' }
MooseAbstractGroup >> mooseFinderListIn: composite [
	<moosePresentationOrder: 1>
	composite fastList
		beMultiple;
		showOnly: 50;
		display: #mooseInterestingEntity;
		sortBlock: [ :a :b | a gtDisplayString < b gtDisplayString ];
		send: [ :each | each ifNil: [ nil ] ifNotNil: [ each size = 1 ifTrue: [ each first ] ifFalse: [ each asMooseGroup ] ] ];
		format: #gtDisplayString;
		icon: #mooseIcon;
		title: [ :each | each mooseInterestingEntity size asString , ' items' ];
		titleIcon: MooseIcons mooseList;
		when: [ :input | (input mooseInterestingEntity isKindOf: MooseGroup) or: [ input mooseInterestingEntity isKindOf: Collection ] ];
		dynamicActionsOnSelection: [ :list | list selection mooseInterestingEntity mooseFinderActions ];
		updateOn: MooseEntityAdded from: [ :anObject | MooseFinder announcerFor: anObject ];
		updateOn: MooseEntityRemoved from: [ :anObject | MooseFinder announcerFor: anObject ]
]

{ #category : #'*moose-finder' }
MooseAbstractGroup >> mooseSpecificSpotterProcessorsFor: aSpotterStep [
	"nothing because for large models we might get too many groups and it is not particularly useful"
]
