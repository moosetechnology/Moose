Extension { #name : #Object }

{ #category : #'*Famix-MetamodelBuilder-Core' }
Object >> <- anObject [
	"Answer an Association between self and anObject"
	"the code of Association>>#key:value: is inline here for speed"
	^Association basicNew key: anObject value: self
]
