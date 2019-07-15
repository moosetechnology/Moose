Extension { #name : #FM3Element }

{ #category : #'*metanool-core' }
FM3Element class >> descriptionName [
	^ MAStringDescription new
		accessor: #name;
		default: 'noname';
		label: 'Name';
		priority: 100;
		beRequired;
		yourself
]

{ #category : #'*metanool-core' }
FM3Element >> magritteDescriptionName [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #name;
		default: 'noname';
		label: 'Name';
		priority: 100;
		beRequired;
		yourself
]
