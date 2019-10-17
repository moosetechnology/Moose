Extension { #name : #Object }

{ #category : #'*Fame-ImportExport' }
Object >> handleFameProperty: aSymbol value: anObject [
	"override me if you want your object to deal with undefined properties loaded from MSE"
	Transcript show: 'Unknown property ''', aSymbol, ''' in ', self class asString.
	Transcript cr.

]
