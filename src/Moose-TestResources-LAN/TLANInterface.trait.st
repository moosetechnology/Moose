Trait {
	#name : #TLANInterface,
	#category : #'Moose-TestResources-LAN'
}

{ #category : #'as yet unclassified' }
TLANInterface >> originate [ 
	 
	| dialogModel dialogBuilder returnVal packet dialogOriginator dialogAddressee dialogContents | 
	"the next three lines create ValueHolders to support the three dialog widgets" 
	dialogOriginator := nil asValue. 
	dialogAddressee := nil asValue. 
	dialogContents := String new asValue.	"next two lines create a new SimpleDialog object and retrieves the builder" 
	dialogModel := Smalltalk at: #SimpleDialog new. 
	dialogBuilder := dialogModel builder.	"the following lines connect  the widgets of the interface with the ValueHolders created" 
	dialogBuilder aspectAt: #originator put: dialogOriginator. 
	dialogBuilder aspectAt: #addressee put: dialogAddressee. 
	dialogBuilder aspectAt: #contents put: dialogContents.	"the following lines ask the LANInterface for the originators and outputters menus.  
	You will write these next, so select proceed when VisualWorks when VisualWorks indicates that they are new messages." 
	returnVal := dialogModel openFor: self interface: #originateDialog.	"returnvalue will be true if the user selected Accept, otherwise it will be false" 
	returnVal 
		ifTrue: 
			["create a new packet, fill it in and give it to the workstation" 
			packet := (LANPacket new) 
				addressee: 
						(LANSingleDestinationAddress new id: dialogAddressee value name); 
				contents: dialogContents value. 
			dialogOriginator value originate: packet]
]
