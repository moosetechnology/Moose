Extension { #name : #FamixTSourceEntity }

{ #category : #'*Moose-Finder' }
FamixTSourceEntity >> mooseFinderParentFolderIn: composite [
	<moosePresentationOrder: 10>
	self sourceAnchor ifNil: [ ^ self ].
	self sourceAnchor isFileAnchor ifFalse: [ ^ self ].
	(self sourceAnchor fileReference parent gtInspectorItemsIn: composite) titleIcon: MooseIcons mooseFolder
]

{ #category : #'*Moose-Finder' }
FamixTSourceEntity >> mooseFinderSourceTextIn: composite [
	<moosePresentationOrder: 10>
	composite text
		title: 'Source';
		titleIcon: MooseIcons mooseSourceText;
		format: [ self mooseInterestingEntity formattedSourceText ];
		when: [ self mooseInterestingEntity sourceText isNotEmpty ]
]

{ #category : #'*Moose-Finder' }
FamixTSourceEntity >> spotterPreviewSourceIn: composite [
	<spotterPreview: 0>
	composite text 
		title: [ self mooseName ];
		display: #yourself;
		entity: self sourceText
]
