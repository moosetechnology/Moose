Extension { #name : #Object }

{ #category : #'*grease-core' }
Object >> greaseDeprecatedApi: apiString details: detailsString [ 
	GRDeprecatedApiNotification new
		details: detailsString;
		signal: apiString
]
