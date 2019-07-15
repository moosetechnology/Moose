Extension { #name : #String }

{ #category : #'*Famix-MetamodelBuilder-Core' }
String >> splitOnLastNumber [

	"'123abc456' splitOnLastNumber >>> #('123abc' '456')"

	| anIndex aLastIndex |
	
	aLastIndex := self size + 1.
	anIndex := self size.
	[ anIndex > 0 and: [ (self at: anIndex) isDigit ] ] 
		whileTrue: [ 
			aLastIndex := anIndex.
			anIndex := anIndex - 1 ].
		
	^ { self copyFrom: 1 to: anIndex. self copyFrom: aLastIndex to: self size  }
	
]
