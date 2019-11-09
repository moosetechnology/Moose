Class {
	#name : #FMHeinekenExample,
	#superclass : #TestCase,
	#category : #'Fame-Tests'
}

{ #category : #resources }
FMHeinekenExample class >> metamodelMSE [

	^'((FM3.Package 
		(name ''HNK'')
		(classes
			(FM3.Class (id: 3)
				(name ''Beer'')
				(properties
					(FM3.Property
						(name ''name'')
						(type (ref: String)))
					(FM3.Property
						(name ''alcvol'')
						(type (ref: Number)))
					(FM3.Property
						(name ''price'')
						(type (ref: Number)))
					(FM3.Property
						(name ''instock'')
						(type (ref: Number)))
					(FM3.Property
						(name ''vol'')
						(type (ref: Number)))
					))
			(FM3.Class (id: 2)
				(name ''Customer'')
				(properties
					(FM3.Property
						(name ''name'')
						(type (ref: String)))
					(FM3.Property
						(name ''address'')
						(type (ref: String)))
					(FM3.Property (id: 22)
						(name ''orders'')
						(multivalued true)
						(opposite (ref: 11))
						(type (ref: 1)))
					))
			(FM3.Class (id: 1)
				(name ''Order'')
				(properties
					(FM3.Property
						(name ''date'')
						(type (ref: String)))
					(FM3.Property
						(name ''amount'')
						(type (ref: Number)))
					(FM3.Property (id: 11)
						(name ''customer'')
						(opposite (ref: 22))
						(type (ref: 2)))
					(FM3.Property
						(name ''item'')
						(type (ref: 3)))
					))
	)))'.
]

{ #category : #resources }
FMHeinekenExample class >> modelMSE [

	^'((HNK.Beer (id: 1)
			(name ''Heineken'')
			(alcvol 5)
			(price 0.6)
			(vol 0.5)
			(instock 1000))
		(HNK.Order (id: 2)
			(item (ref: 1))
			(amount 6)
			(date ''2008-08-25 11:45'')
			(customer (ref: 4)))
		(HNK.Order (id: 3)
			(item (ref: 1))
			(amount 12)
			(date ''2008-08-17 18:30'')
			(customer (ref: 4)))
		(HNK.Customer (id: 4)
			(name ''Joe Example'')
			(address ''Levittown''))	
	)'.
]

{ #category : #resources }
FMHeinekenExample class >> modelMSEWithDanglingReferences [

	^'((HNK.Beer (id: 1)
			(name ''Heineken'')
			(alcvol 5)
			(price 0.6)
			(vol 0.5)
			(instock 1000))
		(HNK.Order (id: 2)
			(item (ref: 1))
			(amount 6)
			(date ''2008-08-25 11:45'')
			(customer (ref: 4)))
		(HNK.Order (id: 3)
			(item (ref: 1))
			(amount 12)
			(date ''2008-08-17 18:30'')
			(customer (ref: 4)))
	)'.
]

{ #category : #tests }
FMHeinekenExample >> testImportMetamodelAndCreateClasses [
	| gen |
	gen := FMDefaultCodeGenerator new.
	gen visit: (FMMetaModel fromString: self class metamodelMSE).
	gen previewChangesIfShiftPressed
]
