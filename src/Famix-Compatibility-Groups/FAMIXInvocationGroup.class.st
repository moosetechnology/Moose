Class {
	#name : #FAMIXInvocationGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Compatibility-Groups'
}

{ #category : #meta }
FAMIXInvocationGroup class >> annotation [
	<MSEClass: #InvocationGroup super: #MooseGroup>
	<package: #FAMIX>

]

{ #category : #'as yet unclassified' }
FAMIXInvocationGroup >> exportToCsvStream: stream [
	stream 
		nextPutAll: 'FromNamespace,FromClass,FromMethod,ToNamespace,ToClass,ToMethod';
		cr.
	self 
		do: [ :inv |
			stream 
				nextPutAll: '"';
				nextPutAll: inv from namespaceScope mooseName;
				nextPutAll: '","';
				nextPutAll: inv from typeScope name;
				nextPutAll: '","';
				nextPutAll: inv from signature;
				nextPutAll: '","';
				nextPutAll: inv anyCandidate namespaceScope mooseName;
				nextPutAll: '","';
				nextPutAll: inv anyCandidate typeScope name;
				nextPutAll: '","';
				nextPutAll: inv anyCandidate signature;
				nextPutAll: '"' ]
		separatedBy: [ stream cr ]
]

{ #category : #'as yet unclassified' }
FAMIXInvocationGroup >> mooseFinderListIn: composite [
	composite fastTable
		beMultiple;
		installExportToCSV;
		display: [ self ];
		column: 'From' evaluated: [ :each | each from ];
		column: 'To' evaluated: [ :each | each anyCandidate ];
		send:
				[ :each | 
			each isNil
				ifTrue: [ nil ]
				ifFalse: [ each size = 1
						ifTrue: [ each first ]
						ifFalse: [ each asMooseGroup ] ] ];
		icon: #mooseIcon;
		title: [ :each | each mooseInterestingEntity size asString , ' items' ];
		titleIcon: MooseIcons mooseList;
		when:
				[ :input | 
			(input mooseInterestingEntity isKindOf: MooseGroup)
				or: [ input mooseInterestingEntity isKindOf: Collection ] ];
		dynamicActionsOnSelection: [ :list | list selection mooseInterestingEntity mooseFinderActions ];
		updateOn: MooseEntityAdded from: [ :anObject | MooseFinder announcerFor: anObject ];
		updateOn: MooseEntityRemoved from: [ :anObject | MooseFinder announcerFor: anObject ]
]
