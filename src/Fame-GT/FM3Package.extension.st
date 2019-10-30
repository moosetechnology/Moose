Extension { #name : #FM3Package }

{ #category : #'*Fame-GT' }
FM3Package >> gtInspectorClassesIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite fastList
		title: 'Classes';
		display: [ self classes sorted: [:x :y | x fullName < y fullName] ];
		format: [ :each | 
			each isAbstract 
				ifTrue: [ Text string: each fullName attribute: TextEmphasis italic ]
				ifFalse: [ Text fromString: each fullName ] ]
]

{ #category : #'*Fame-GT' }
FM3Package >> gtInspectorExtensionsIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite fastList
		title: 'Extensions';
		display: [ self extensions sorted: [:x :y | x fullName < y fullName] ];
		format: [ :each | each gtDisplayString ]
]
