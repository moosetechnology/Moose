Extension { #name : #GRPackage }

{ #category : #'*Grease-Pharo30-Core' }
GRPackage class >> greasePharo30Core [
	^ self new
		name: 'Grease-Pharo30-Core';
		addDependency: 'Grease-Core';
		url: #greaseUrl;
		yourself
]
