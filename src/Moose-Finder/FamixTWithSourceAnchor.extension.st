Extension { #name : #FamixTWithSourceAnchor }

{ #category : #'*Moose-Finder' }
FamixTWithSourceAnchor >> mooseFinderParentFolderIn: composite [
	<moosePresentationOrder: 10>
	self sourceAnchor ifNil: [ ^ self ].
	self sourceAnchor isFile
		ifFalse: [ ^ self ].
	(self sourceAnchor fileReference parent gtInspectorItemsIn: composite) titleIcon: MooseIcons mooseFolder
]

{ #category : #'*Moose-Finder' }
FamixTWithSourceAnchor >> mooseFinderSourceTextIn: composite [
	<moosePresentationOrder: 10>
	composite text
			title: 'Source';
			titleIcon: MooseIcons mooseSourceText;
			format: [ self mooseInterestingEntity formattedSourceText ];
			when: [ self mooseInterestingEntity sourceText notEmpty ]
]

{ #category : #'*Moose-Finder' }
FamixTWithSourceAnchor >> spotterPreviewSourceIn: composite [
	<spotterPreview: 0>
	composite text 
		title: [ self mooseName ];
		display: #yourself;
		entity: self sourceText
]
