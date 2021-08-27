Extension { #name : #MooseObject }

{ #category : #'*Moose-Finder' }
MooseObject >> bookmarkEntity [
	<menuItem: 'Bookmark Entity' category: 'Utilities'>
	
	| groupName |
	groupName := UIManager default 
		request: 'Enter description'
		initialAnswer: self description.
	(groupName isNil or: [ groupName size = 0 ]) ifTrue: [ ^ self ].
	self bookmarkAs: groupName		
]

{ #category : #'*Moose-Finder' }
MooseObject >> complexPropertyPragmas [
	| navProps definedProps |
	navProps := self navigationPragmas sorted: [ :pragma | pragma argumentNamed: #navigation ] ascending.
	definedProps := (self allDeclaredProperties reject: [ :a | a type isPrimitive ])
		flatCollect: [ :prop | prop compiledMethod pragmas select: [ :each | each selector beginsWith: 'FMProperty:' ] ].
	^ (OrderedCollection withAll: definedProps)
		addAll: navProps;
		yourself
]

{ #category : #'*Moose-Finder' }
MooseObject class >> formatForNavigationPresentation [
	^ 'All ', self name, ' - '
]

{ #category : #'*Moose-Finder' }
MooseObject >> mooseDescriptionsOfNumberProperties [
	^ self mooseDescription allProperties select: [ :each | each type = FM3Number instance ]
]

{ #category : #'*Moose-Finder' }
MooseObject >> mooseFinderFameDescription: composite [
	<moosePresentationOrder: 400>
	self mooseDescription ifNil: [ ^ self ].
	(self mooseDescription gtInspectorRelationsIn: composite)
		title: 'Fame';
		titleIcon: MooseIcons mooseFame
]

{ #category : #'*Moose-Finder' }
MooseObject >> mooseFinderNavigationIn: composite [
	<moosePresentationOrder: 1>
	self mooseDescription ifNil: [ ^ composite custom: GLMCompositePresentation new].
	composite custom: MooseNavigationPresentation new
]

{ #category : #'*Moose-Finder' }
MooseObject >> mooseFinderPropertiesIn: composite [
	<moosePresentationOrder: 2>
	composite table
		noSelection;
		title: 'Properties';
		titleIcon: MooseIcons mooseProperties;
		display: [ :anObject | anObject mooseInterestingEntity mooseDescription allPrimitiveProperties ];
		sorted: [ :x :y | x name < y name ];
		column: 'Properties' evaluated: [ :each | each name ];
		column: 'Value'
			evaluated: [ :each :anObject | 
			[ (anObject mooseInterestingEntity mmGetProperty: each) asString ]
				on: Error
				do: [ 'error' ] ];
		when: [ :anObject | 
			(anObject mooseInterestingEntity isKindOf: MooseObject)
				and: [ anObject mooseInterestingEntity mooseDescription isNotNil and: [ anObject mooseInterestingEntity mooseDescription allPrimitiveProperties isNotEmpty ] ] ]
]

{ #category : #'*Moose-Finder' }
MooseObject >> mooseIcon [
	^ MooseIcons mooseMetamodelEntity
]

{ #category : #'*Moose-Finder' }
MooseObject >> mooseSpecificSpotterProcessorsFor: aSpotterStep [

	| entity assocs pragmaValueAssociations |
	entity := self mooseInterestingEntity.
	pragmaValueAssociations := entity complexPropertyPragmas 
			collect: [ :pragma | 
				pragma -> ([ 
			        self mooseInterestingEntity perform:
				     pragma methodSelector ] onErrorDo: [ nil ]) mooseInterestingEntity ].
	
	assocs := (pragmaValueAssociations reject: [ :association | 
		           association value isNil or: [ 
			           association value isCollection and: [ 
				           association value isEmpty ] ] ]) sorted: [ :a :b | 
		          (a key argumentAt: 1) asLowercase asString
		          < (b key argumentAt: 1) asLowercase asString ].
	
	assocs do: [ :assoc | 
		aSpotterStep listProcessor
			allCandidates: [ assoc value asMooseGroup ];
			title: (assoc key argumentAt: 1);
			itemIcon: #mooseIcon;
			filter: GTFilterSubstring;
			itemName: #displayString;
			order: 1 ]
]

{ #category : #'*Moose-Finder' }
MooseObject >> spotterProcessorsFor: aSpotterStep [
	super spotterProcessorsFor: aSpotterStep.
	[ self mooseSpecificSpotterProcessorsFor: aSpotterStep ]
		on: NotFound
		do: [ Transcript crTrace: 'The entity description is not present in its moose model metamodel' ]
]
