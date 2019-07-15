Extension { #name : #MooseGroup }

{ #category : #'*moose-finder' }
MooseGroup class >> gtExampleEmptyCollection [
	<gtExample>
	<label: 'Empty collection'>
	
	^ {  } asMooseGroup
]

{ #category : #'*moose-finder' }
MooseGroup class >> gtExampleEmptyGroup [
	<gtExample>
	<label: 'Empty group'>
	
	^ self new
]

{ #category : #'*moose-finder' }
MooseGroup class >> gtExampleGroupWithEmptyEntities [
	<gtExample>
	<label: 'Group with empty entities'>
	
	^ self new
		add: MooseEntity new;
		add: MooseEntity new;
		add: MooseEntity new;
		yourself
]

{ #category : #'*moose-finder' }
MooseGroup >> mooseFinderNavigationIn: composite [
	"it is not valid here"
]

{ #category : #'*moose-finder' }
MooseGroup >> mooseIcon [
	^ MooseIcons mooseMetamodelGroup
]

{ #category : #'*moose-finder' }
MooseGroup >> mooseInterestingEntity [ 
	"For a group with one element,  it returns that element, instead of the group, useful in the finder to remove extra step when navigating"
	
	^self size = 1 
		ifTrue: [self first] 
		ifFalse: [super mooseInterestingEntity]
]

{ #category : #'*moose-finder' }
MooseGroup >> spotterItemsFor: aStep [
	<spotterOrder: 10>
	^ aStep listProcessor
		title: 'Items';
		candidatesLimit: 50;
		allCandidates: [ self entities ];
		itemName: [ :each | each gtDisplayString ];
		filter: GTFilterSubstring;
		wantsToDisplayOnEmptyQuery: true
]
