Extension { #name : #GRPackage }

{ #category : #'*magritte-model' }
GRPackage class >> magritteModel [
	^ self new
		name: 'Magritte-Model';
		description: 'The Magritte metamodel.';
		addDependency: 'Grease-Core';
		url: #magritteUrl;
		yourself
]

{ #category : #'*magritte-model' }
GRPackage >> magritteUrl [
	^ 'http://source.lukas-renggli.ch/magritte2'
]
