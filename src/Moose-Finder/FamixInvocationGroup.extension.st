Extension { #name : #FamixInvocationGroup }

{ #category : #'*Moose-Finder' }
FamixInvocationGroup >> mooseFinderListIn: composite [
	composite fastTable
		beMultiple;
		installExportToCSV;
		display: [ self ];
		column: 'From' evaluated: [ :each | each from ];
		column: 'To' evaluated: [ :each | each anyCandidate ];
		send: [ :each | each ifNil: [ nil ] ifNotNil: [ each size = 1 ifTrue: [ each first ] ifFalse: [ each asMooseGroup ] ] ];
		icon: #mooseIcon;
		title: [ :each | each mooseInterestingEntity size asString , ' items' ];
		titleIcon: MooseIcons mooseList;
		when: [ :input | (input mooseInterestingEntity isKindOf: MooseGroup) or: [ input mooseInterestingEntity isKindOf: Collection ] ];
		dynamicActionsOnSelection: [ :list | list selection mooseInterestingEntity mooseFinderActions ];
		updateOn: MooseEntityAdded from: [ :anObject | MooseFinder announcerFor: anObject ];
		updateOn: MooseEntityRemoved from: [ :anObject | MooseFinder announcerFor: anObject ]
]
