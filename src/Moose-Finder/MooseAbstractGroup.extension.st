Extension { #name : #MooseAbstractGroup }

{ #category : #'*moose-finder' }
MooseAbstractGroup >> displayStringOn: aStream [
	super displayStringOn: aStream.
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
		sortBlock: [ :a :b | a displayString < b displayString ];
		send: [ :each | 
			each ifNotNil: [ 
					each size = 1
						ifTrue: [ each first ]
						ifFalse: [ each asMooseGroup ] ] ];
		format: #displayString;
		icon: #mooseIcon;
		title: [ :each | 
			each mooseInterestingEntity size asString , ' items' ];
		titleIcon: MooseIcons mooseList;
		when: [ :input | 
			(input mooseInterestingEntity isKindOf: MooseGroup) or: [ 
					input mooseInterestingEntity isKindOf: Collection ] ];
		dynamicActionsOnSelection: [ :list | 
			list selection mooseInterestingEntity mooseFinderActions ];
		updateOn: MooseEntityAdded
		from: [ :anObject | MooseFinder announcerFor: anObject ];
		updateOn: MooseEntityRemoved
		from: [ :anObject | MooseFinder announcerFor: anObject ]
]

{ #category : #'*moose-finder' }
MooseAbstractGroup >> mooseSpecificSpotterProcessorsFor: aSpotterStep [
	"nothing because for large models we might get too many groups and it is not particularly useful"
]
