Extension { #name : #Collection }

{ #category : #'*moose-finder' }
Collection >> mooseFinderListIn: composite [
	<moosePresentationOrder: 1>
	composite list
		beMultiple;
		showOnly: 50;
		searchOn: [:text :each | Smalltalk compiler evaluate: ' | entity each | each := self. entity := each.', text for: each logged: false];
		display: #mooseInterestingEntity;
		send: [:each | each isNil ifTrue: [nil] ifFalse: [each asMooseGroup]];
		format: #displayString;
		icon: #mooseIcon;
		title: [ :each | each mooseInterestingEntity size asString, ' items'];
		titleIcon: MooseIcons mooseList;
		when: [:input | (input mooseInterestingEntity isKindOf: MooseGroup) or: [input mooseInterestingEntity isKindOf: Collection] ];
		dynamicActionsOnSelection: [ :list | list selection mooseInterestingEntity mooseFinderActions ];
		updateOn: MooseEntityAdded from: [ :anObject | MooseFinder announcerFor: anObject ];
		updateOn: MooseEntityRemoved from: [ :anObject | MooseFinder announcerFor: anObject ];
		helpMessage: 'A selection boolean statement using ''each'' to refer to each element', String cr, 'For example: ', String cr, 'each beginsWith:''C'''.
]
