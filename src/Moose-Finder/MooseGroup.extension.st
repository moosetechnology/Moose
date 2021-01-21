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

{ #category : #'*Moose-Finder' }
MooseGroup >> mooseInterestingEntity [
	^ self specialize
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
