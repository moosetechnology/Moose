"
RTGrapherDecorationExample new installTitle: 'RangeBelowXAxis' 
		code:
		'
	| b d |
	b := RTGrapher new.
	d := RTData new.
	d points: (1 to: 5).
	d y: #yourself.
	b add: d.
	b addDecorator: (RTRangeBelowXAxis new startValue: 2.5; endValue: 4; label: ''A'').
	b addDecorator: (RTRangeBelowXAxis new startValue: 0; endValue: 2; label: ''B'').
	^ b'
	
"
Class {
	#name : #RTGrapherExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-Builder-Grapher-Examples'
}

{ #category : #sources }
RTGrapherExample >> dataEbola [

^ 'FID,the_geom,Year,YearEnd,Country,latitude,longitude,Type,cases,deaths,PerFatalit,Descriptio
Ebola2.1,POINT (-9.696645 9.945587),2014-01-01T00:00:00,2015-01-01T00:00:00,Guinea,9.945587,-9.696645,ZEBOV,528,337,64%,"Outbreak is currently ongoing in southeastern Guinea, including the capital?Conakry?and the neighbour countries?Sierra Leone?andLiberia"
Ebola2.2,POINT (32.290275 1.373333),2012-01-01T00:00:00,-0002-12-29T00:00:00,Uganda,1.373333,32.290275,SEBOV,24,17,71%,Outbreak occurred in the?Kibaale District.[34]
Ebola2.3,POINT (15.827659 -0.228021),2012-01-01T00:00:00,-0002-12-29T00:00:00,Republic of Congo,-0.228021,15.827659,ZEBOV,77,36,,
Ebola2.4,POINT (32.290275 1.373333),2011-01-01T00:00:00,-0002-12-29T00:00:00,Uganda,1.373333,32.290275,SEBOV,1,1,,
Ebola2.5,POINT (121.774017 12.879721),2008-01-01T00:00:00,-0002-12-29T00:00:00,Philippines,12.879721,121.774017,REBOV,0,0,0%,Outbreak in the?Philippines?and the first known occurrence of REBOV in pigs. Strain closely similar to earlier strains. Six workers from the pig farm and slaughterhouse developed antibodies but did not become sick.[31][32]
Ebola2.6,POINT (21.758664 -4.038333),2008-01-01T00:00:00,2009-01-01T00:00:00,Democratic Republic of Congo,-4.038333,21.758664,ZEBOV,32,14,45%,Outbreak occurred in the Mweka and Luebo health zones of the Province of?Kasai-Occidental.[33]
Ebola2.7,POINT (21.758664 -4.038333),2007-01-01T00:00:00,-0002-12-29T00:00:00,Democratic Republic of Congo,-4.038333,21.758664,ZEBOV,264,187,71%,Outbreak occurred in?Kasai-Occidental Province. The outbreak was declared over on November 20. Last confirmed case on October 4 and last death on October 10.[30]
Ebola2.8,POINT (32.290275 1.373333),2007-01-01T00:00:00,2008-01-01T00:00:00,Uganda,1.373333,32.290275,Bundibugyo ebolavirus,149,37,25%,Outbreak occurred in?Bundibugyo District?in western Uganda. First reported occurrence of a new strain.[2][3][4]
Ebola2.9,POINT (30.217636 12.862807),2004-01-01T00:00:00,-0002-12-29T00:00:00,Sudan,12.862807,30.217636,SEBOV,17,7,41%,"Outbreak occurred in Yambio county in?Western Equatoria?of southern Sudan. This outbreak was concurrent with an outbreak of measles in the same area, and several suspected EHF cases were later reclassified as measles cases.[29]"
Ebola2.10,POINT (15.827659 -0.228021),2003-01-01T00:00:00,-0002-12-29T00:00:00,Republic of Congo,-0.228021,15.827659,ZEBOV,35,29,83%,"Outbreak occurred in Mbomo and Mbandza villages located in Mbomo district, Cuvette Ouest D?partement.[28]"
Ebola2.11,POINT (15.827659 -0.228021),2002-01-01T00:00:00,2003-01-01T00:00:00,Republic of Congo,-0.228021,15.827659,ZEBOV,143,128,90%,Outbreak occurred in the districts of Mbomo and K?ll? in Cuvette Ouest D?partement.[27]
Ebola2.12,POINT (11.609444 -0.803689),2001-01-01T00:00:00,2002-01-01T00:00:00,Gabon,-0.803689,11.609444,ZEBOV,65,53,82%,Outbreak occurred over the border of Gabon and the Republic of the Congo.[26]
Ebola2.13,POINT (15.827659 -0.228021),2001-01-01T00:00:00,2002-01-01T00:00:00,Republic of Congo,-0.228021,15.827659,ZEBOV,57,43,75%,Outbreak occurred over the border of Gabon and the Republic of the Congo. This was the first time that Ebola hemorrhagic fever was reported in the Republic of the Congo.[26]
Ebola2.14,POINT (32.290275 1.373333),2000-01-01T00:00:00,2001-01-01T00:00:00,Uganda,1.373333,32.290275,SEBOV,425,224,53%,"Occurred in Gulu, Masindi, and Mbarara districts of Uganda. The three most important risks associated with Ebola virus infection were attending funerals of Ebola hemorrhagic fever case-patients, having contact with case-patients in one''s family, and prov"
Ebola2.15,POINT (11.609444 -0.803689),1996-01-01T00:00:00,-0002-12-29T00:00:00,Gabon,-0.803689,11.609444,ZEBOV,37,21,57%,Occurred in Mayibout area. A chimpanzee found dead in the forest was eaten by people hunting for food. Nineteen people who were involved in the butchery of the animal became ill; other cases occurred in family members.[19]
Ebola2.16,POINT (11.609444 -0.803689),1996-01-01T00:00:00,1997-01-01T00:00:00,Gabon,-0.803689,11.609444,ZEBOV,60,45,75%,Occurred in Boou? area with transport of patients to Libreville. Index case-patient was a hunter who lived in a forest camp. Disease was spread by close contact with infected persons. A dead chimpanzee found in the forest at the time was determined to be
Ebola2.17,POINT (22.937506 -30.559482),1996-01-01T00:00:00,-0002-12-29T00:00:00,South Africa,-30.559482,22.937506,ZEBOV,2,1,50%,"A medical professional traveled from Gabon to Johannesburg, South Africa, after having treated Ebola virus-infected patients and thus having been exposed to the virus. He was hospitalized, and a nurse who took care of him became infected and died.[22]"
Ebola2.18,POINT (-95.712891 37.09024),1996-01-01T00:00:00,-0002-12-29T00:00:00,USA,37.09024,-95.712891,REBOV,0,0,0%,REBOV was introduced into a quarantine facility in Texas by monkeys imported from the Philippines. No human infections were identified.[23]
Ebola2.19,POINT (121.774017 12.879721),1996-01-01T00:00:00,-0002-12-29T00:00:00,Philippines,12.879721,121.774017,REBOV,0,0,0%,REBOV was identified in a monkey export facility in the Philippines. No human infections were identified.[24]
Ebola2.20,POINT (21.758664 -4.038333),1995-01-01T00:00:00,-0002-12-29T00:00:00,Democratic Republic of Congo (formerly Zaire),-4.038333,21.758664,ZEBOV,315,250,79%,Occurred in Kikwit and surrounding area. Traced to index case-patient who worked in forest adjoining the city. Epidemic spread through families and hospitals.[21]
Ebola2.21,POINT (11.609444 -0.803689),1994-01-01T00:00:00,-0002-12-29T00:00:00,Gabon,-0.803689,11.609444,ZEBOV,52,31,60%,Occurred in M?kouka and other gold-mining camps deep in the rain forest. Initially thought to be yellow fever; identified as Ebola hemorrhagic fever in 1995.[19]
Ebola2.22,POINT (-5.54708 7.539989),1994-01-01T00:00:00,-0002-12-29T00:00:00,Ivory Coast,7.539989,-5.54708,CIEBOV,1,0,0%,Scientist became ill after conducting an necropsy on a wild chimpanzee in the Tai Forest. The patient was treated in Switzerland.[20]
Ebola2.23,POINT (12.56738 41.87194),1992-01-01T00:00:00,-0002-12-29T00:00:00,Italy,41.87194,12.56738,REBOV,0,0,0%,REBOV was introduced into quarantine facilities in Siena by monkeys imported from the same export facility in the Philippines that was involved in the episodes in the United States. No humans were infected.[18]
Ebola2.24,POINT (-95.712891 37.09024),1990-01-01T00:00:00,-0002-12-29T00:00:00,USA,37.09024,-95.712891,REBOV,0,0,0%,REBOV was introduced once again into quarantine facilities in Virginia and Texas by monkeys imported from the Philippines. Four humans developed antibodies but did not get sick.[15]
Ebola2.25,POINT (-95.712891 37.09024),1989-01-01T00:00:00,-0002-12-29T00:00:00,USA,37.09024,-95.712891,REBOV,0,0,0%,REBOV was introduced into quarantine facilities in Virginia and Pennsylvania by monkeys imported from the Philippines.[14]
Ebola2.26,POINT (121.774017 12.879721),1989-01-01T00:00:00,1990-01-01T00:00:00,Philippines,12.879721,121.774017,REBOV,0,0,0%,High mortality among cynomolgus macaques in a primate facility responsible for exporting animals in the USA.[16]?Three workers in the animal facility developed antibodies but did not get sick.[17]
Ebola2.27,POINT (30.217636 12.862807),1979-01-01T00:00:00,-0002-12-29T00:00:00,Sudan,12.862807,30.217636,SEBOV,34,22,65%,"Occurred in Nzara, Maridi. Recurrent outbreak at the same site as the 1976 Sudan epidemic.[13]"
Ebola2.28,POINT (21.758664 -4.038333),1977-01-01T00:00:00,-0002-12-29T00:00:00,Zaire,-4.038333,21.758664,ZEBOV,1,1,100%,Noted retroactively in the village of Tandala.[12]
Ebola2.29,POINT (21.758664 -4.038333),1976-01-01T00:00:00,-0002-12-29T00:00:00,Zaire,-4.038333,21.758664,ZEBOV,318,280,88%,Occurred in Yambuku and surrounding area. Disease was spread by close personal contact and by use of contaminated needles and syringes in hospitals/clinics. This outbreak was the first recognition of the disease.[10]
Ebola2.30,POINT (30.217636 12.862807),1976-01-01T00:00:00,-0002-12-29T00:00:00,Sudan,12.862807,30.217636,SEBOV,284,151,53%,"Occurred in Nzara, Maridi and the surrounding area. Disease was spread mainly through close personal contact within hospitals. Many medical care personnel were infected.[11]"
'
]

{ #category : #sources }
RTGrapherExample >> exampleAdjustedAxes [
| c b1 ds1 b2 ds2 b3 ds3 |
c := RTComposer new.
c gap: 35.

"-------"
b1 := RTGrapher new.
b1 view: c view.
ds1 := RTData new.
ds1 dotShape color: Color red.
ds1 points: #(3 -3).
ds1 connectColor: Color red.
b1 add: ds1.
b1 build.
c group: #regular.
"-------"
b2 := RTGrapher new.
b2 view: c view.
b2 minX: 1.
b2 maxX: 3.
b2 withoutOrigin.
ds2 := RTData new.
ds2 dotShape color: Color red.
ds2 points: #(3 -3).
ds2 connectColor: Color red.
b2 add: ds2.
b2 build.
c group: #withoutOrigin.
"-------"
b3 := RTGrapher new.
b3 view: c view.
b3 yOffset: 30.
ds3 := RTData new.
ds3 dotShape color: Color red.
ds3 points: #(3 -3).
ds3 connectColor: Color red.
b3 add: ds3.
b3 build.
c group: #offset.
"-------"

c move: #withoutOrigin below: #regular.
c move: #offset below: #withoutOrigin.
c nameGroup: #regular as: 'Regular'.
c nameGroup: #withoutOrigin as: '#Without origin (0@0)'.
c nameGroup: #offset as: 'Y axis offset'.
^ c view
]

{ #category : #icons }
RTGrapherExample >> exampleAdjustedAxesIcon [
	^ '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'
]

{ #category : #sources }
RTGrapherExample >> exampleColoredAndInteractionLabel [

	| b |
	b := RTDoubleBarBuilder new.
	b interaction action: #inspect.
	b shape label 
		text: [ :cls | '<', cls name, '>' ];
		if: [ :cls | cls name endsWith: 'Shape' ] fillColor: Color green;
		if: [ :cls | cls name endsWith: 'Box' ] fillColor: Color red.
	
	b points: RTShape withAllSubclasses.
	b bottomValue: #numberOfMethods.
	b topValue: #numberOfVariables.
	^ b
]

{ #category : #icons }
RTGrapherExample >> exampleColoredAndInteractionLabelIcon [
	^ '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
AElFTkSuQmCC'
]

{ #category : #sources }
RTGrapherExample >> exampleDoubleBar [

| b |
	b := RTDoubleBarBuilder new.
	b points: RTShape withAllSubclasses.
	b bottomValue: #numberOfMethods.
	b topValue: #numberOfVariables.
	b build.
^ b view
]

{ #category : #icons }
RTGrapherExample >> exampleDoubleBarIcon [
	^ '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'
]

{ #category : #sources }
RTGrapherExample >> exampleDoubleYAXis [

	| b ds |
	b := RTDoubleGrapher new.
	b extent: 300 @ 200.
	
	ds := RTData new.
	ds points: #(4 3 2 2).
	ds barShape width: 40.
	b add: ds.
	
	ds := RTData new.
	ds points: (10 to: 13).
	ds dotShape color: Color blue.
	ds connectColor: Color red.
	b addRight: ds.
	
	b axisX noLabel.
	b axisYRight color: Color red.
	^ b
]

{ #category : #icons }
RTGrapherExample >> exampleDoubleYAXisIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAADmUlEQVR4XuXbW0vbYADGcb+Z
CPsKskvxbrsTvNIbQRRPg3oxRRAH0ot65YUXgspQUTyjFbEyL2wd4hQHlpXqPPTJ8sYJKk0T
NW2T/h8IrfYQ8/5M3jyx1lkWP2FKHX8I+CD88EH4IPzwQfgg/PBB+CD88EH4IPzwQfjhg/BB
+OGD8EH44YPwQfjhg/BB+OGD8MMH4YPwwwfhg/DDB+GD8MMH4YPwEy2QhoYGmduuri7Nzs7q
5eOyc3V15SxRHYxUSq/62d22t7m5WQcHB4rFYpqenlZPT48CBTk7O1Nra6vzpp2dnTIoxUC2
trZ0enrqunLznHQ6bZVaqhHF49LKir5/HNFrUH5PThbd3v7+frOp6u3tldt4BXLIur291fX1
teubHx0dlVxxWECUTMpB6OuTLi/fvEdrYaHka29ubpzHS41ZWeeQsIIom30YfIOwsxPYIdUL
pOqTelhAVChI3d36/OGHcl+/lW1O44N4AGhpSRobq9hJBR+kygB8kKevteeAT/Up5WMjoTmt
RoE4E/DiojMZh7W31DTIz+Vl61c8br33VBQBcn9/r5aWFt3d3TlFx22wTTst1dRfgjQ2/rGS
XxIORjWL4Vvz175iUWx7BwYGnO9NTU2pra1NTU1NwfeQ8fFxXVxc6OTkxBUk6KYe1mbv1dSH
h4efFejHy0qBguTzeVW6qYcdxO2QZcbIjNXTr2viLCuqIDV72ssH4YPwQfggfBA+CB+ED1Lb
IKaDTNolyNyfm5vT/v6+gmjqUQdxa+omKftvweZ2bW3tVZ8z8L2HDA4OOm/a0dEhewltUy/3
8/009fPzc/uS3MNFUfOLPDExESyIWYFBWF9f1/z8vMy1rbAesioJUuqQZUDMeI2Ojj5r7bg5
JCwg/EmdD8IH4YPwQfggfBA+CB8kkiC7u7uRaOqVBHFr6oeHh3q8NWNlelzgIBsbG/ym7rOp
JxIJFQoFewda0N7entrb24MH4Td1/4cs88kccw3LjNnq6mrR/6fhzyH8SZ0Pwgfhg/BB+CB8
ED4IH4QP4p2ZmRnPpr65ualsNotv6n7G610gx8fHyuVynk09k8loe3tb5vmEJZlMFm3qfsbr
3XvI0NCQvJq6/sfix9d4lX0O4Sdkkzo/fBA+CD98ED4IP3wQfvggfBB++CB8EH74IHwQfvgg
fBB++CD88EH4IPzwQfgg/PBB+CD88EH4IPzwQfjhg/BB+OGDRCn/ACEOsXsP+FT6AAAAAElF
TkSuQmCC'
]

{ #category : #sources }
RTGrapherExample >> exampleDynamicStacked [
	| b |
	b := RTDynamicStackedGrapher new.
	b numberOfBars: 10.
	b
		minY: -200;
		maxY: 200.
	b y: #yourself.
	b barShape color: (Color red alpha: 0.3).
	b view addMenu: '+ 1' callback: [ b add: 400 atRandom - 200 ].
	^ b
]

{ #category : #icons }
RTGrapherExample >> exampleDynamicStackedIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACMklEQVR4XuXcvWoiURiA4dyz
FyCIINh6ATZegohgodhoJyo2sRArC0Xt/P8SzsAsy7Ik22R0eV4YzGB3Hk4OnyO+fXz4vVJv
/hL4IH7/AnI+n6Pb7Ya/JE8G6XQ6vyDq9boP8io7ZDKZRLlc9lfEP0P8fBAfxM8H8UH8fBAf
xM8H8UH8fBA/H8QH8fNBfBA/H8QH8fNBfBA/H8TPB/FB/HwQH8TviSDD4TBarVZUKpVot9tR
q9WyL9ql+8fj4X/prmiQxWIRy+UyttttlEqlqFarGUK6Px6P2d+HwyHSl/D8pS7wX9bpdIr8
9Xq9Rn6ft1qtfJBXOkN8EB/EB/FBfBAfxAfxQXwQH+Q/HwzzyfyrSd0HKXiH+JO6P6n7IP4Z
4oP4ID6ID+Lng/ggPogPgoP0er1swafT6V+HQB+kYJDL5RKbzSZ7vp6u39/b7/cxGo1ivV4z
V/p04qkgjUYjxuNxtjtms5m/Q/wzxAfxQXwQH8QH8UH8fBAfxO9HQZrNZqQJvd/vR5rY03P2
/N4HKRhkPp9H+q3fcrmc/cTsn6/5pO4/Uy9wh6SFTx+dDAaDbFfc7/e43W7Zvb9D/DPEB/FB
fBAfxAfxQXwQH8QH8fsJkPf3d39Sf6VJPQ2A303q6fKXusBJfbfbfTmp+73YGeLng/ggfj6I
D+Lng/ggfj6Inw/ig/j5ID6Inw/ig/j5ID6Inw/i54P4IH4+iA/i54P4IH4+iA/i54P4+SA+
iN+3fQIe1z3fETJGzQAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTGrapherExample >> exampleEbola [

	"Preparing the data"
	| tab data b ds |
	tab := RTTabTable new input: (RTGrapherExample new dataEbola readStream) contents usingDelimiter: $,.
	tab removeFirstRow.
	tab replaceEmptyValuesWith: '0' inColumns: #(10 11).
	tab convertColumnsAsInteger: #(10 11).
	tab convertColumnsAsDateAndTime: #(3 4).
	data := tab values reversed.

	"Charting the data"
	b := RTGrapher new.
	b extent: 400 @ 200.

	ds := RTData new.
	ds interaction fixedPopupText: [ :row | row value at: 12 ]. 
	ds dotShape ellipse 
		color: (Color blue alpha: 0.3);
		size: [ :row  | (row at: 11) / 5 ].
	ds points: data.
	ds connectColor: Color blue.
	ds y: [ :r | r at: 10 ].
	ds highlightIf: [ :row | (row at: 10) > 100 ] using: [ :row | row third year ].
	b add: ds. 

	b axisX noLabel; numberOfTicks: tab values size.
	b axisY noDecimal.
	^ b
]

{ #category : #icons }
RTGrapherExample >> exampleEbolaIcon [
	^ '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
Ifwxffgff5Jw1WkAY5wAAAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherExample >> exampleFunctions [
	| b ds |
	b := RTGrapher new.
	b extent: 300 @ 300.
	
	(Array with: Color red with: Color blue with: Color green with: Color yellow) doWithIndex: [ :color :i |
		ds := RTData new.
		ds label: 'x^', i asString.
		ds dotShape ellipse size: 0.
		ds points: (0.0 to: 10.0 by: 0.1).
		ds connectColor: color.
		ds x: #yourself.
		ds y: [ :v | v raisedTo: i ].
		b add: ds.
	].
	
	b axisXWithNumberOfTicks: 3.
	b axisYWithNumberOfTicks: 4.
b legend right.
^ b
]

{ #category : #icons }
RTGrapherExample >> exampleFunctionsIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEl0lEQVR4XuXd3UobQRgG4FxB
r6S34WnxuLfgQY604oFrBAUj9a/QntjS0hapAQ+0LVbRqq2/YBUqGlsUBRUDkmBDFJW+2/km
TjDF2nWzyY55v2XIbjTr7D67M+bb7CTiuvxhU0T4dwE/CH/wg/CD8Ac/CD8If/CD8IPwBz8I
Pwh/8IPwBz8IPwh/8IPwg/AHPwg/SHGcn59DHvf393FxcaGLzMtzqVSq8DP+XVshkKWlJRwe
HkJ2/ubmpi6ZTAbRaBSxWExDyHI6ndbz8phMJl2zzBDAFioGUl9fj4mJCTQ3N2NsbEwXx3Ew
OTmJtrY2LCws6GUJ85rt7W2qMwZ4Dav7ECYQ4AzWd+pcIO38IHaBfOEHsQvkLT+IPRhHuBNv
DHlAevlB7ALp5wexC+QHP4g9GO8D2UZ+kMBAxvlBqq3/4AcJDOMgsO3zBbK3t4dcLqczvn+n
3M0yF0h/uCAjIyNIJBI609vS0oK6uroCjCybNLyEpN3n5uaqOv0OxMMFWVlZwfr6OpqamtDa
2oqpqSmdjl9cXNTLMzMz4DpDfocLwt+HlOfs4AcJBCTBD2IXSIofxB6M7sC3ix+kJJBBfhC7
QE74Qaq5ueIH4QepFoxc2baHH8SC9x78ICWDjPOD2IPxoqzb4jv9Lo+M6XdgwD6QhoYGmDQ7
U/odyJR9G3yByA4fHR3Vn3ZnSr+X++zg70NuDbLCD2IPxtOKbAM/iGeQD/wg9mA8q1j9+UE8
gTznB7EHY6SidecHsaTv4AexrKniB/EEMsMPYg/Gu1DqzA9yLUYOwAY/iD0gr0Krry+Q3d1d
nJ2dVeWn34E3odbVF8jx8fFtP/2Ou5B+B5KhNVUlgdTW1mJ+ft7Tp99lEJqtra2iwWjsBfkU
eh35+5ACRqsVdeQH0RgfrakfPQjwNfR+gx+kgLGoMOatqhstSP7MWLCuXpQgeYxZK89aOhDg
s8L4aW2fRgUC9FWkHtOY5h8E82aIWZT7QlM3utGjJv4z5EaIjIJ4GfjfVhk8JNT0TU3LauJv
sv4LkVIQnQjqDtkYYhhVk+M6GoO/D/GMkFDFf7MhO16OeDn6H6vpznXqZux3mb9pvPeNjWDf
CZ+cnKgdv6xKPqvsBUF2tBzhicubbbrQVTjiZX1B1y8UEDP2uxkL/rrfkbT72lqfe3r6SKV7
HVeKe/noZb5T7zY14T4cRFzn10NEo2nXUb9iygNnGRE1Y4osOw4ufw7XzHc6WbfohZclE41e
+/zV0nXPgRNR9fBQvj8ZDOcMMWO/Sype0u/XNyXAwcFBoOl3WV+QR7RN6ytrH+K1SfMaR0f5
cXF3dnZwddlvmDrJDpSLbuZGJL+RzWaLWop/tRqhgXhp0m4TPT35vmJgIH+fhln2Ex0dHRge
Htav7+3Nj7c7NDRUUh3j8XjRjUxXr5xaAeKlSfMa8o+B3LklX4chVyVXV1f1st/1yVXNxsZG
vb729nb9HSjJZNL3+mQMsZqamsIVU/P1HVb+28sf/CD8IPzBD8IPwh/8IPwg/MEPwh/8IPwg
/MEPwg/CH/wg/CD8wQ/CD8If/CD8YeIPX2amRIdH+ZAAAAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherExample >> exampleHighlightDataset [

| b data colors ds |
b := RTGrapher new.

data := Array
	with: (Array with: 0->0 with: 1->1 with: 2->3 with: 3->5 with: 4->7)
	with: (Array with: 0->0 with: 1->2 with: 2->4 with: 3->16 with: 4->32).

colors := Array with: Color blue with: Color red.

data withIndexDo: [ :each :i | |c|
	c := colors at: i.
	ds := RTData new.
	ds label: c.
	ds connectColor: (c alpha: 0.5).
	ds dotShape ellipse color: (c alpha: 0.5).
	ds points: each.
	ds x: #key.
	ds y: #value.
	
	ds interaction noInteractions.
	ds interaction highlightDataset: c.

	b add: ds.
].

b legend below.
b legend addText: 'Hover over one of the lines or legend entries'.
^ b
]

{ #category : #icons }
RTGrapherExample >> exampleHighlightDatasetIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAFLklEQVR4XuXdW3PaRhQH8Hzw
PuQxnyGeyUOn7Uwz02kfmmk6SYwdDA7FXAQGhIS4GNCFu4AABnNOhVSUuGNnYi72iv+Z0QDW
7iL2p9XRIsDPmPFDpHiG3wX4IPiBD4IPgh/4IPgg+IEPgg+CH/gg+CD4gQ+CH/gg+CD48egg
pmHSeLqk1f1LtULonUmdDj0piK6bZLcaNP48IlU6vbUxi8WCTk5OoJDo5Uui+ZyEPWQlk0kY
EGo2SfgcggJC4zGRbeODHNrowAfZBUYsRoE57T10kF2ODHwQgfIGPoigowMfRJC8sbuZum7Q
cMr3ztQPEWRfI2MnIB/TMtkThpmp7ytv4B+yBB0d+CCC5A18EAFHBj6IQHkDH0TQ0YEPIkje
wAcRcGTggwiUN3YGksxFaTbsEi+XdCgz9dV18acaHduDxH4lozWisVm9c6YeCoWCB3J0tPV1
cfxD1q4w4vEn3158EIEw8EEEw8AHEQwDHkQ0DGgQETFgQUTFgAQRGWNrkCUx3SyWpNUqVK2V
hJ+pi46xNUh7yNQoKVRyZukfknmhZ+pBwIA5ZO0bo1olymSIXr1y33XB/zrCY2GsO340otWl
ktUbwvifXNw3hiQRPUbHQ4FQt0vfg3FXx2saEX4O2RZgOvV6tN0mKhaJXr8mck4qHvNQAwly
q+MVhSh/+8xu3fGrSxrRqAfAAQshQWgyIXrxgsiyvtnxQdjjAwXyrT3+qZNrYGfqkxndO1NP
vPtEX3f8pN6m4huFwkc5kmWi4ZCo3yfK5YjOzryEen3tdXqpRJDfe98KxBgsaWm3752pv/vh
R6qU6tRsNh+8HB8fb1TvKevu4tP++D+tgZRD8EMgkEb+2B2+byXtwcN49fGiTeuW6vrGdXWz
s3FdVa5sXPdRQOI5jRbzBVXyiQdvYDTyceO64XB447qR2MXGdccz3rgu/iELP4fgBz4IPgh+
CAdi2zbPZjOopVAoiPvjM6PRCG6PVlU1GCCqWtr5i5ekgveWjdnjS9W+te7/j++L7y33dSzn
vWCDpFIpTlyEvc6rK2y2TVYbBpczaW8CZnc5k6+z7qw7jsQ5l8lwJ5/xyo/n7jp3ctlpcmNg
s+S016vlWcqW3b+nMxpniz3OX5ncsiy/o3tOG7Ws5NdTy2W/zdPf/vLLnUciXNE0lrMXflmv
Pct/Lesyq5i2im7b7k7hbMtqexU5H6wRYhgGp9Pei7DaYy4rMk9apvt42O84e7nlliFackHR
/HUlOfelvX6Xzf/KqOUrNi1vT5UvJba6M27bc5bSaf/5Vm0MLdOvl05n/TbX7a/KGXqT2x3d
GXGSX3bdXjaveOWcMp3+0L1PdMNV5zm9+972qkEDwc8h+CD4IPgg+CD4IPggAQfRdeZQyFvW
sZh+5k5vcG+9caOGD7IvkGSS+flzb1nHxcdT9/bkPM5XxpivqhWOhE45ITec6/LXrP39BzfK
MpcvYpz6dM6NlsWKbuGD7AuknD5nrVLlD5EzrtUHHJeLfPb+PUdTXXd95vdfuKYWWJaz/Obn
n7jcqHKtWsUHwc8h+CD4IPgg+CD4IPgg+CBfQAbOfEOWvQUfRACQO857E8mYe6soJR4vljwb
mM59xZmT6Dy7IZYTKe6aV84pcZvrjTo+yL5BIudRNvojlqsGp4pXfPlPmNVM1J+HWLEzDr39
07lgpfFo2MMHwc8hBwrS7Xa53+9DLc5Vx+D8yyP8wAfBB8EPfBB8EPzAB8EHwQ98EPzAB8EH
wQ98EHwQ/MAHOdz4F6JT5DYsMEvIAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTGrapherExample >> exampleLabelsInBar [

| b ds barElements someElements |
b := RTGrapher new.

ds := RTData new.
ds barShape.
barElements := ds points: #(1 2 3 2 1).
b add: ds.

b axisX noTick.
b build.


ds barShape createdElements do: [ :back |
	someElements := (RTLabel new color: Color red) elementsOn: (1 to: back model * 3).
	b view addAll: someElements.

	RTFlowLayout new maxWidth: back trachelShape width; on: someElements.
	someElements translateTo: back position.
	(RTConstraint  on: someElements background: back)
		top ; center ; inner; padding: 5; move.
].

^ b 
]

{ #category : #icons }
RTGrapherExample >> exampleLabelsInBarIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABwUlEQVR4XuXavYrCQBSAUd//
NcTW3krBEMFOIiRWBl/An0JS3UjCVq6Fu7jrmPPBYCMhMwenuDhqW7+UGvlH4IP4+SA+iJ8P
4oP4+SA+iJ8P4oP4+SB+PogP4ueD+CB+PogP4ueD+CB+PoifD+KD+PkgPoifD+KD+PkgPojf
MEB2u110n3meh3+cCYCUZRnX6zUmk0k8wprP5/+2mcPhEPv9vr1fl8sl/CvrKx/EB/FBfBAf
xAfxQXwQH8QH8UF8EB/EB/FBfBAfxAdJBaSu636zq9Xq26arqnrJcPF0OsXxeGzvV9M08RuQ
Z5/3kSCLxSLO53Os1+v4q1/Iswf96u/5V5YP4oP4ID6ID+KD+CA+iA/ig/ggPogP4oP4ID7I
sECyLOs3MZvN/FlWCiDj8bgfLk6n0x+DvOugU4Z765Xlg/ggPogP4oP4ID6ID+KD+CA+iA/i
g/ggPogPMnCQoij6l9tut/4sK5Vpb9dyuXz4V9IObLPZMKsbtCZ9Zfn5ID6Inw/ig/j5ID6I
nw/i54P4IH4+iA/i54P4IH4+iA/i54P4+SA+iJ8P4oP4+SA+iJ8P4oP4+SB+PogP4ueDfGI3
wxBGiYmHNxEAAAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherExample >> exampleLinesAndBars [
	| b d |
	b := RTGrapher new.

	d := RTData new.
	d points: #(3 4 3.5).
	d barShape.
	b add: d.
	
	d := RTData new.
	d points: #(3 4 3.5).
	d connectColor: Color red.
	b add: d.
	b maxX: 5.
	b axisX
		numberOfLabels: 5;
		noDecimal.
	^ b
]

{ #category : #icons }
RTGrapherExample >> exampleLinesAndBarsIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACvUlEQVR4XuXcz0vCYBzH8f76
/oOIoEvHqINgh6BDIYiX1cCDUB60sOksdYRIB/0sH2GRyye3NXX1/sCDP3im43m559kX5vbC
kJ8iZY8/BHwQfvggfBB++CB8EH74IHwQfvggfBB++CD88EH4IPzwQfgg/PBB+CD88EH4IPzw
Qfjhg/BB+OGD8EH44YPwQfj5OyCj0UjmsdfriT+cOwYxCLVaTZ7nyff9byCDwSBXpDn+Uhtc
XYVvJyeKv8+fsuaZTqffBl/z5LmzrVbrs/kHB5/Pn6rV0Ds7Cx/v7hav+SCWbArkZX9/CWcJ
6vAwVKkkPsg2QO7vw+eLCytG1BbffXMjXV4q733gg0SfdXsr7/x8LUZ8ytL7u3R9Lbmu+CA5
gchxpCBQEoyvIPHF/vX4WOZEpMgnAYUH0empVi3qSUDS9ueDrNv+6Ei2syw+yBZBFvP+fM34
6bSXD2IZ8KggXFWpZwExEKpWta4O4YPYa4PMlXp8ce12u6H/8GBddPkgCTKbzWRalkp90wPM
X0P4IHwQPggfhA/CB+GD8EH4IHyQ/1mp9/v9zJU6H2QDR4iBsFXqw+GQD7KrKYtfqfPXED4I
H4QPwgfhg/BB+CB8ED4IH2RbIEEQ8Cv1IoHU63V+pc6v1Pkg/DWED8IH4YPwQfggfBA+CB+E
D0IGiSp0fqVeAJCoQv+pUjdXwNta/Cp30z/+3uL/6Jb+tpa1fx5t50eIqdCzXv3+2/7/Mfx7
nZBAHMdJ9YtvNBqp+jebTaWdYs3RnLR/p9NJ9fmrpu1CgVQqlVQ7WEp5B4ZyuZyqf7vd1mQy
SbyN67qKbq6TJObfZOPxWPwpiz9l8cMH4YPwwwfhhw/CB+GHD8IH4YcPwgfhhw/CB+GHD8IH
4YcPwg8fhA/CDx+ED8IPH4QPwg8fhA/CDx+EHz4IH4SfDPkAjjgATwwDm+UAAAAASUVORK5C
YII='
]

{ #category : #sources }
RTGrapherExample >> exampleMethodSize [


	| b classes normalizer |
	b := RTGrapher new.
	b extent: 400 @ 200.
	
	classes := RTShape withAllSubclasses.
	normalizer := RTMultiLinearColorForIdentity new objects: classes.
	classes do: [ :c |
		| ds data |
		data := ((c rtmethods reverseSortedAs: #numberOfLinesOfCode ) collect: [ :m | m numberOfLinesOfCode ]).
		ds := RTData new.
		ds dotShape ellipse size: 0.
		ds points: data.
		ds connectColor: (normalizer rtValue: c).
		ds y: #yourself.
		b add: ds.
	].

	b axisXWithNumberOfTicks: 3.
	b axisYWithNumberOfTicks: 4.

	b build.
^ b view
]

{ #category : #sources }
RTGrapherExample >> exampleMethodSize2 [

	| b classes normalizer |
	b := RTGrapher new.
	b extent: 400 @ 200.
	
	classes := RTShape withAllSubclasses.
	normalizer := RTMultiLinearColorForIdentity new objects: classes.
	classes do: [ :c |
		| data ds |
		ds := RTData new.
		data := (c rtmethods reverseSortedAs: #numberOfLinesOfCode ).
		
		ds interaction popup.
		ds dotShape rectangle color: (normalizer rtValue: c).
		ds points: data.
		ds connectColor: (normalizer rtValue: c).
		ds y: #numberOfLinesOfCode.
		b add: ds.
	].

	b axisX.
	b axisY.
b build.
^ b view
]

{ #category : #icons }
RTGrapherExample >> exampleMethodSize2Icon [
	^ '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'
]

{ #category : #icons }
RTGrapherExample >> exampleMethodSizeIcon [
	^ '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
igib9zQAAAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherExample >> exampleMethods [
	| methods trachelMethods b ds |
	methods := Collection withAllSubclasses flatCollect: #rtmethods.
	trachelMethods := TRObject withAllSubclasses flatCollect: #rtmethods.
	b := RTGrapher new.
	b extent: 200 @ 200.

	"Data set 1"
	ds := RTData new.
	ds interaction popup.
	ds dotShape circle color: (Color red alpha: 0.3).
	ds points: methods.
	ds x: #numberOfLinesOfCode.
	ds y: [ :m | m sourceCode size ].
	b add: ds.

	"Data set 2"
	ds := RTData new.
	ds interaction popup.
	ds dotShape circle color: (Color blue alpha: 0.3).
	ds points: trachelMethods.
	ds x: #numberOfLinesOfCode.
	ds y: [ :m | m sourceCode size ].
	b add: ds.
	b axisX
		withThousandsSeparator;
		title: 'LOC'.
	b axisY
		noDecimal;
		title: 'Size'.
	b build.
	^ b view
]

{ #category : #icons }
RTGrapherExample >> exampleMethodsIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEZUlEQVR4XuWczUtUURiHr0Wt
gty0aJF/QK78B1oEItFGiqTATRAtBHc6fsTo+AkqSoMZigsDUQllFCF1xHFUVFqIo2AghPnt
oPhtI/n1s3mP3MHKcQwc53p/DxxmmHu4yn3uOe9577nnaMfH/BgJjf8S8Avhh18IvxB++IXw
C+GHXwi/EH74hfAL4YdfCD/8QviF8MMvhF8IP/xC+IXwwy+EXwg//EL44RfCL4QffiH8Qvgx
l5CpqSns7OxgdHQU/DoMIKS6uhpbW1soKipCfn4+Kisr4fP5wC8kQjQ0NMDpdCI5ORmNjY0o
Ly8Hfwvhh0OIxIbl5eXAHS9dk/wm39fW1vhjxlULKS0thc1mQ15eHvr7+5Gbm6t+k2Pd3d1/
CJmenlbFqMzNAVKurRCPx4P4+HgVqAcGBjA7O4usrCz1W09PD7Kzs/lbSKRiyMHBAf/F5w/q
/EL44RfCL4QffiH8QvgxqxDJxtfX19WQd2VlJZC1Ly4u8g+DI9VCXC4XRkZGUFVVpbL2lJQU
dHV1/SPE6Jm6KYTs7u6qC5+WloaMjAyVtff19aG4uJi/hUQyhgDgF8Af1PmF8MMvhF8IP/xC
+IXwY1YhMocuRc/a9Ux9ZmaGfxgcCSH19fUqEZTvMocumXp6ejr0eXX+TP2KhchjExGRk5Oj
5tAlU5eXHfgzdf5MnV8IP/xC+IXwwy/kv/D5AI/nesUvuhaC3l7wC+HHGEK2t7dxdHQUmEfX
M/WFhYWw3qXwz1RifBz8Qs6gpqYGJSUlaG9vD7wJX1BQwJ+pR0KICGhra1MCMjMzVabudruV
lLOSx3AnkHrL8d8d4M/U+eEI6ka+200vRHqb3clZqK5HyuvXgMmWxhlWiOrrW1rUxUZrK1yP
coGmJsBqBSoqAKcTmJ+HPyidfPpLOP6P1dVVdV5ZBSafw8PD4BQyNoa9cju8rm9AUhLc918C
sbFAQgIwOAhMTl5Jy+jo6Aism7fb7aBrIXKh9z47sPTmHX7euQerlgdERwMxMUBcHNDcfKVd
lMVikZHhcVlZGWR+R9bRHx4egkKI6qZSU1ESZcErrQEz2gM81now//Qt5rI/Ym7gB/hHWZfE
6fXqZ7G/v4/WZ5/wUJvADe0Qt7Q9PL/pwPvU7ycBfGgIej0pof5epOpdGyF6lh7s+ETXV0RF
Abe1X3hy9ws+vLCpruLv0tnZqcpZx8Jdb2NjwzwtRF+vHuy4PPeSEuo8Rq9nmhgSqksTZFsO
CahLS0vn1tUXCslmBaHOd5FFRPp2IPKgNNwPRg0jJFSXJni9XrULxEWGnzIi0t8JC8bprT+s
/vzmvHp1dXXY3NxEbW0th5BQXZrQ659ckrxAXiPy9+dB6+oLhRITE4PWO731h8PhCLotlF5P
WqW0uMLCQvA/OiGCXwi/EH74hfAL4YdfCL8QfviF8Avhh18IvxB++IXwwy+EXwg//EL4hfDD
L4RfCD/8QviF8MMvhB9+IfxC+OEXwi+En8vlN9AkwQP3P1GfAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTGrapherExample >> exampleMultiDataPoint [

| b d |
b := RTGrapher new.

d := RTHorizontalMultipleData new.
d barShape color: Color blue.
d points: #( #('hello' 1 2 1) #('world' 2 4 2) #('bonjour' 3 5 4) #('Gutten Morgen' -1 4 -5)).
d addMetric: #second.
d addMetric: #third.
d addMetric: #fourth.

"d barChartWithBarCenteredTitle: #first."
d barChartWithBarTitle: #first rotation: -30.

b add: d.
^ b 
]

{ #category : #icons }
RTGrapherExample >> exampleMultiDataPointIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABeCAYAAADVA7GfAAADrUlEQVR4XuXbS08TURiHcT6r
Cze6EzV+AhMTVm4QiJFE3UCCMSGmRg1U27SU3svFXqCUXkILhJJwCbTv6HvIGFKr7UCB6Tz/
5IRAO9OZ93fOmdN2GLEsftyUEX4J+CD88EH4IPzwQfgg/PBB+CD88EH4IPzwQfjhg/BB+OGD
8EH44YPwQfjhg/BB+OGD8MMH4YPwwwfhg/DDB+GD/CPtdluSyaTUajWpVqvS+fjGxoa48aRF
2nLRRDw3Qg4PD6XRaEi9Xpe/T1xcCdIau2daO/iBNWXxQfggfBA+CB/Eaqe/i13U64Jkcg0Z
exOxtKWz9Z7H25p8cvHarx4JH4QPwgfhg/BBvA9y3//OtI/FFB+ED8IH4YPwQTwA0poYvTix
ycc9T+xHLS92UQO1gnSCBOMVyy4qH4QPwgfhg/BBvAeixbAL0w1kYiZhCjM5kxQ+CB+ED8IH
uQEQLfjJyYlsb29LuVwWPsgdg+zv74u2dDptbnbofFxvctja2hrq9j78TR5+nLKefXrb9fEX
4z5L2/yX6J+/aSe9symr1WrJbb9TPzg4uLVvIu2R/TQ01/U17dGlo3Qol71669DZ2Zm5dWhz
c9PxPpvNpqyvr5tp8irHdH5+LolEQq4Coj0/n8+LnoMnQLRnBwIBWVxclL29va73cv0v+vxK
pWKmhWw262hb7QC5XE78fr+ZZp2APJh/bY3OTUkqlTIdoVgsDjfI7u6urK6uSigUMgjHx8eO
inl6eio+n88UU4txuSC9onhHR0dmVOrI0N+djMavmag8H38pn3/GTWfwxJSlU5PeSKc9TEeG
k2Lu7OyYKer3Pkzrd1u9gU+3zWQysrCwYDpDv9vq66ysrJjt9Rj09SORiLeuIU569eXMzs6K
jrB+n18qlcxztaBaxEKhYDpCv9vr8n16elqWlpYMSq/nD/1F/aajI0Eh9OKrU46TlZterOPx
uFlw9NsJ+CA9okWNxWLiZNkeDAYlGo3K8vKy4+PlgwwoOgr0zayu+vSn0xUfH2TA0VGhnzBo
u85++CDXiF4fdAms72F0JeVkscAHuYHoElbf2OkyWP+nZRD75IO47Jj4IC4LH4QPwgfhg/BB
+CB8ED7I4EF0Lb+2tmaKrt93dD6un7R6HSQQK4u2UrUprhgh4XDYfLVpw/Dj4imLHz4IH4Qf
PggfhB8+CB+EHz4IP3wQPgg/fBA+CD98ED4IP3wQPgg/fBB++CB8EH74IHwQfvggfBB++CB8
EH7uOr8Ao4yOPnBNaKAAAAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherExample >> exampleMultiGrapher [
|g g1 g2 ds1 ds2|
g := RTMultiGrapher new.

g1 := RTGrapher new.
ds1 := RTData new.
ds1 label: 'Red'.
ds1 dotShape color: Color red.
ds1 connectColor: Color red.
ds1 points: ((1 to: 10) collect: [ :each | 20 atRandom ]).
ds1 interaction highlightDataset: Color black.
g1 add: ds1.

g2 := RTGrapher new.
ds2 := RTData new.
ds2 label: 'Blue'.
ds2 dotShape color: Color blue.
ds2 connectColor: Color blue.
ds2 points: ((1 to: 10) collect: [ :each | 1000 atRandom ]).
ds2 interaction highlightDataset: Color purple.
g2 add: ds2.

g1 axisY
	title: 'y 1';
	color: Color red.
	
g2 axisY
	title: 'y 2';
	color: Color blue.

g add: g1.
g add: g2.
g legend.

^ g
]

{ #category : #icons }
RTGrapherExample >> exampleMultiGrapherIcon [
	^ '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
SDMMAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTGrapherExample >> exampleMultipleCurvesStacking [

| b points1 points2 minY maxY ds1 ds2 |
points1 := TRShape withAllSubclasses sortedAs: #numberOfVariables.
points2 := TRShape withAllSubclasses sortedAs: #numberOfMethods.

minY := 0.
maxY := (points1 maxValue: #numberOfVariables) max: (points2 maxValue: #numberOfMethods).

b := RTGrapher new.
b extent: 300 @ 200.

ds1 := RTData new.
ds1 points: points1.
ds1 connectColor: Color blue.
ds1 y: #numberOfVariables" min: minY max: maxY".
b add: ds1.

ds2 := RTData new.
ds2 points: points2.
ds2 connectColor: Color green.
ds2 y: #numberOfMethods" min: minY max: maxY".
b add: ds2.


b build.
^ b view
]

{ #category : #icons }
RTGrapherExample >> exampleMultipleCurvesStackingIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEnUlEQVR4XuWbX08TSxjG/Wrc
8DHgQ3DDXUONOa1GUqIo2iAXBVvbGDiBHKyQUAgeaJEQaZAARkMEqiD9A8tuoe2z7ju0pkGI
Wtvuts9vs5kSNu3M/nZ25p1395Zp8uMkbvGfAn4h/PAL4RfCD78QfiH88AvhF8IPvxB+Ifzw
C+GHXwi/EH74hfAL4YdfCL8QfviF8Avhh18IP/xC+IXwwy+EXwg//EL4hfDDL4RfCD+tL6S7
uxuRSARerxfyt9vtRqlUwtXjdF2H7Cwn9eLiArYIgcX+/j66urpUBY6OjpDNZn+qzNbWFg4O
DmiEjORHYBgGmi6k8qPSK+SquKkS6XQaTLedZ3gGR48hTEJKuNz4hTgEP/xw/CyLScgABviF
OIUNbKAl4hAWIROY4BfiFCTOmtVn+YU4BTfcKBaL9gmJxWIqCOzo6FCVCAaDWFtbg8fj+alS
EhS2c6Q+gpG6ta1mIeFwWAno6elRlVlcXFRlIpGgitSj+Whd21WXW1b12o2maWC5ZckKxdv0
W+cJYR1D/jbm4BdSRzaxiSKK/EKcwnM8b0ib+IXUwGR2smHt4RdSA768j1+IU4gj3tC28Av5
Q4IIOlfI9vY25ufnsby8rCoZjV4fJKVSqbaI1NNIN2RmVTchsnyysLCA3t5eVUm/34/rAsN2
idTruUTSECEul8tcWlqCLJtIL+nr62vbnLphGGaykHS2EJYxZBjDmDamUSgU+IXYQSaTMe/h
Ht5k3yB6Fm1q3fmFXB0XEcP7k/e2/T6/kCsykkjaWld+IWVeZ17bLoNfSJlHeISz8zNH1JFO
iOS9X+ZeQh5oC5wFMJwfdtTFUrOQlZUV1ZCBgcskzd7eHuLxOKS8eqzdOXV5tHM0NWpO4nKV
9vz8XJV/85S644RI7nx9fR2dnZ2qUZXlk/7+fkdF6jJQy9Yqs7yahfh8PszNzZmyS8+QUq64
oaEhW3Pq8oqE5LplXJhNzyKn5VoqBmq7MWTCmMChftiyKwNtJeQBHtgmQnqmTBg+fQK8Xu3a
RVYaIXIiXFmXbTKs7AIikYI1Tur8j5IKHnhQmTk1g8pvDQ4Cfv9Xq2cA/Lcsi2/Zb/jP2prZ
G0IhIBzO8eTUq6/0fD6P6pnTR2u7q93FK+0V5CE1a1UW9b7qBXlXUq7627cNBIMnCASAUCiH
x491ruX3EKztJIRAeZvKTKly/GIcKSP1W98hJ1OSSeXPZiWHIUvqFU5PT1H5/+hoEVbiE0+e
aOrEyx6LHaNlZ1mVPPrMzAw2Nq5/g2hnZwfHx5eNrJ59yMlLWZtX8+Kp/hS/6iHV0bWVpMTD
h4fqBI6Nlays5RfcuQN8+PBnQpqRdGqakN3dXVQaZ6VzISndm45bXV2FlIkvCfyTHMf9zX/x
/+47a1DU1e1gbExXn6ens6qUfWoqo8pwWMeLF9qPYz9/TqnvcvJuWw8ZtKYa5Uj9xhdWUMbk
xxljCD/8QviF8MMvhF8IP/xC+IXwwy+EH34h/EL44RfCL4QffiH8QvjhF8IvhB9+IfzwC+EX
wg+/EH4h/PAL4RfCD78QfiH88Avhh18IvxB+fsl3T+IO9OMHW7cAAAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherExample >> exampleNegativeY [

| b ds |
b := RTGrapher new.
b extent: 200 @ 200.

ds := RTData new.
ds points: (-3 to: 6).
ds y: [ :v | v - 4 ].
ds x: #yourself.
ds connect.
b add: ds.

b axisXWithNumberOfTicks: 4.
b axisYWithNumberOfTicks: 4.

b build.

^ b view
]

{ #category : #icons }
RTGrapherExample >> exampleNegativeYIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAD1ElEQVR4XuXcS0vzQBiGYf+j
P8GVW5cqCCriwqW4EF24EleiCIJ4ruBho9YzIiqIooLn8+GNfYKFWmvTfp+mk7kfCLUY0zJX
Z5J3JrUqCPhxKVX8JuCD8MMH4YPwwwfhg/DDB+GD8MMH4YPwwwfhhw/CB+GHD8IH4YcPwgfh
hw/CB+GHD8IPH4QPwg8fhA/CDx+ED8IPH4QPwg8fJJuNjQ3r6uoy/dzc3Gzv7++Wv8/r66s9
PDzY8/OzxfGeXl5eDAtimczNzYUNcH5+bldXV98a4/7+3qanp+3y8vLPG0ofiLOzM8MPWfpU
Pj4+/tgQy8vLsWAUew/8c0iMIJXG4IM4hsEH+czNzY1p419lOQCinnF3d2f8y14HQFwZpvgg
jmJUFGR/f7/s/YqBlHM8FZdRGKUezxuQ9fX14PDw0LQNDg6G28HBgbW1tVl3d7fNzMyEv1tc
XAz329vbs9HRUdvd3bXs3+Vu2f2iNu2noi9qP70/5JCVTqdte3vbNH2i5319fSrcbXZ21n67
Und1mKo4SEdHR9goQ0NDNjw8bLmVuh7f3t6stbXVxsbGLJVKWV1dnTU2Nlp/f/+3xsxCKu3t
7QUbe2tryzo7O0OMhoYGGxgYsJ6enoL7jo+Ph9M4mjvTvJr3IOoROzs79vT09KVn5DeKGkMo
ej4yMmJCqq6uLtpAS0tL9lPP6O3t/XKslpaWgvvq9ysrK6Y5taOjI0P0EM3aRs2m5g8tqhWK
ndR1vEL1xPX1tV1cXISzxLmvWez1NWRGzavxL3v/4bI3CecMDEgSMbwFSSqGlyA6ZyQVwzsQ
9Yw4VhQRIBMTE5aZrggvg09PTwuuqWeq7B/X1JM8TDkHMjk5aaurq3Z7e2tra2tWX19f1pq6
LxhO9ZCmpqZgamoq2NzcDCv0UocsnzASfw7JFn2BR0ksiG89I9EgvmIkEsRnjMSBaJbYZ4xE
gahnaF0j8DxVScFQz4jjVlI+yGe0cqhqXMXf/Py86ZI2FyOqUueD/FJUmdfW1lpNTU3Y0Lq5
QQ2vZdbcE3icd7/ze0gmqtIFoUfNa2kZ9eTkxKIqdT5IjOeMqEqdD1JBDD6IYxh8kJhTylcC
+CAx9oxSvhLAB3FgmOKDOIrBB/nj5N8ZqNs2VYdoKTdTi5S9ps4H+c/kfg9ca+oLCwvh88xS
rmk5Nz+q1I+Pj/mVepyVerYnaIokgIb/v074IPzwQfgg/PBB+CD88EH4IPzwQfgg/PBB+OGD
8EH44YPwQfjhg/BB+OGD8EH44YPwwwfhg/DDB+GD8MMH4YPwwwfhg/DjRj4AuTQugM8hpswA
AAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherExample >> exampleNestingElementsInBars [

| b ds back barElements someElements |
b := RTGrapher new.

ds := RTData new.
ds barShape.
barElements := ds points: #(1 2 3).
b add: ds.

b axisX noTick.
b build.


#(1 2 3) do: [ :value |
	back := b view elementFromModel: value.
	someElements := (RTBox new color: Color red) elementsOn: (1 to: back model * 20).
	b view addAll: someElements.

	RTFlowLayout new maxWidth: back trachelShape width; on: someElements.
	someElements translateTo: back position.
	(RTConstraint  on: someElements background: back)
		top ; center ; inner; padding: 5; move.
].

^ b view
]

{ #category : #icons }
RTGrapherExample >> exampleNestingElementsInBarsIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAB/0lEQVR4XuXbMYrCQACG0ZxK
j+Wt1NIbCFpaiI02EVHRlAELAxaTJZHtsmMhZmPeDzLtZh6fgqxJWfrr0hL/CnwQfz6ID+LP
B/FB/PkgPog/H8QH8eeD+PNBfBB/PogP4s8H8UH8+SA+iD8fxJ8P4oP480F8EH8+iA/izwfx
Qfz1AyTLslCd+/0++NfZAZDz+Ryqrdfr0IQ1n887DXW9XsPhcChfve73e+jFW9Y3gBSDQX3p
sdMHaREkm07ri4+dPohfiF+IX4hfiA/iF+IX4oP4hXx7IcPhs4TI6YO0Wchk8iwhcvogfiF+
Ib0o5HK51H/odrsNTQ/bBsjtdgt5npevXo/HI/S+kOVyGYqiCLvdLvxXIdWl5qNRfXmxs+lS
/c+QDoL4nyF+IT6IX4hfiA/iF+IX4oP4hfiF+IX4heiFjMfPEiKnD9IiSK/+Ue73S8XVahV8
kA6AzGaz+svFxWLxFsg7F+ODfOAtq7qYMknqh4+dPkiLIH4hPSrkHUwf5AOF+CB+IX4hfiF+
IX4hfiE+iA/ig/ggDkiaptHfqfsgLYNsNps/f6dePezpdArH45F5VV+0dvoty58P4oP480F8
EH8+iA/izwfx54P4IP58EB/Enw/ig/jzQXwQfz6IPx/EB/Hng/gg/nwQH8SfD+KD+PNB/Pkg
Pog/H+Qb9wNAW4BOOD56cQAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTGrapherExample >> exampleOccurrencesInBag [

	| b ds v |
	b := Bag new.
	b add: 1 withOccurrences: 5.
	b add: 3 withOccurrences: 4.
	b add: 6.

	v := RTGrapher new.
	ds:=RTData new.
	ds interaction popup.
	ds points: b valuesAndCounts keys.
	ds y:[:c|b valuesAndCounts at: c].
	ds x: [ :c | c ].
	ds barShape color: Color red.
	v add: ds.
	v axisX numberOfLabels: 6.
	^ v
]

{ #category : #sources }
RTGrapherExample >> exampleOccurrencesInBagIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACc0lEQVR4XuXcy2rqUBQGYN+4
j+ArCb6BE0EFLwMFRZ2IN7zNVNBtu4UOTm1MkFNN+/2wKehqQvMlO64msXC5+MlTCv4m8EH8
+CA+iB8fxAfx44P4IH58EB/Ejw/ixwfxQfz4ID6IHx/EB/Hjg/ggfnwQPz6ID+LHB/FB/Pgg
Poif/IMsFotwOBzC8XgM/mZ8Mcj5fA6DwSD0+/3Q6/X+AQkfGQ6HN0jx9UuxeEkboVgMPsiD
KEnvjUajW5BYX/hYXcoIhYIP8r/jg/ggPogP4oP4ID7ILwLZbreJfYgP8mSQ+XweqtVqYh/S
brefA5Khr7kOf8p60hGSYXnX4YP4ID6ID+KD+CA+iA/yK0DiR9t710N8kBccIePxOLEP6XQ6
PsizQXJxPcQH8c8hPogP4oP4ID6ID/Ln+pDlcun3IXk6QuI1Eb8P8acsH8QH8UF8EB/EB/FB
fJA/DrLb7fw+JE8gsdf4rg/5fO9Pg/zg/WD+lPXQVvu59fogPogP4oP4ID6ID6KDxH+/s31I
3kCm0+n1Rrl7fch6vb4ZXz+nb97ewnfPqX/9vfjc+6PLiyPr8h5d7zZhvU89Qk6nU+KevNls
Mu3lr6qLT3+9ou5l5xA/OQJpNBrXvaVer9/da7rdbqa6+BUeWeri9JmlbjKZZKqLU3KWungu
jXdxfv7duQOpVCphv9+H+PNeXalUylRXLpcz1dVqtUx1zWYzzGaz1Lp47/JqtUqtiztCq9VK
rfOnLH/K8uOD+CB+fBAfxI8P4scH8UH8+CA+iB8fxAfx44P4IH58ED8+iA/ixwfxQfz4ID6I
Hx/EB/Hjg/jxQXwQPyl5B0m1OSYuUujxAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTGrapherExample >> examplePointAspects [
	| b ds |
	b := RTGrapher new.

	ds := RTData new.
	ds dotShape rectangle color: Color red.
	ds points: (RTShape withAllSubclasses sortedAs: #ageInDays).
	ds y: [ :c | c ageInDays ].
	b add: ds.

	ds := RTData new.
	ds dotShape circle color: Color blue.
	ds points: (TRShape withAllSubclasses sortedAs: #ageInDays).
	ds y: [ :c | c ageInDays ].
	b add: ds.

	b axisX noDecimal; title: 'Classes'.
	b axisY noDecimal; title: 'Age in days'.

	b build.

	^ b view
]

{ #category : #icons }
RTGrapherExample >> examplePointAspectsIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAADx0lEQVR4XuWaPUtjQRSG82vE
znI7PwohpT/BdQsLS9E1FkaUVbSyE0H0F6hBLRZERQMJWqVQ1kYTxfgBalZFC8X37swNyYqb
3EQ2388DQy7cQ7iZ586cOTPxOQ6fWsLH7wK+ED58IXwhfPhC+EL48IXwhfDhC+EL4cMXwocv
hC+ED18IXwgfvhC+ED58IXwhfPhC+PCF8IXw4QvhC+HDF8IXwocvhC+ED18IH74QvhA+fCF8
IXz4QvhC+PCF8IWUg8vLS9nP+/t7PT09ycLv9ioKiUQiisVi6ujo0N7enlZWVv4RkkqlnKOj
I/ez0qRSMs+Ubva6qcm8MQsL0vGxNDIibW2lm7luCCHz8/NaWlpSf3+/Njc3FQ6Hc/6weDxe
0ZFjHkO9vdLpqRSNmtb+XeYB5QSDjhYXpZMT99rZ3k43e03KIaUQ8r7/7JseDKabzyclokl9
9SfV4os5v39GFPryQ2pvT4+C1lbxk3oZhCwvS8lkun28J/P99s2v1Jte80k9kUjo4eFBb29v
NTFloZe9Gxsbmp6edjt8bm4uZ1KPRqNVSeo4IX6/3yxStjQxMaHR0VGFQqGSjxCboLNTUw5q
fZqq2xzS3S3t7ko9PVJfn3R2JrW0yEiWTJnzt/Nt8/mc7DVfSGmF2KWpXaLmu6+2NrdWcCXw
pyxvXl5e9Pr6qvPz82zFzk/qVRSyv7/vdvT6+rp2dnZMXRB0/iepu1WzHRENNCoqKmRgYEDb
plIbHx/X9fW1AoHAp0ZIc7OUlWAKOPNl4o+QKuSQu7v0/lI9JeSGFmL3ksLfFvlCysHFxYVs
Ms8k9mKFuFsd/KReeiYnJ92OXTabTbnu8yv1CguZmZnRnUkK5swjpxBb0J3YEcE/vGqs3V6+
kFILeb/twRdSXpLmkMLrfr7p7CPPz881HVcXQq6urtyiMN99m8zNFr0TCPzS2Fhcthi0xWSu
Zs7knXz3yhlnFx0NI8QeSo14/EnAJnO7NC4mqdu4Ypfa1YhrmBxSaErLYE8eC8U8Pj66MTc3
Nyom7vb21jPu1Gw3f+YZ615IoSktgz0Czpw8epGJscvtQnG2RhoeHvaMs0Xt1NSUVldXGUIK
TWnvpzZ78lgorrOzU4eHhxocHFShuIODA83OznrGdXV1aW1tTUNDQ8JMWXz4QvhC+PCF8IXw
4QvhC+HDF8IXwocvhA9fCF8IH74QvhA+fCF8IXz4QvhC+PCF8OEL4QvhwxfCF8KHL4QvhA9f
CF8IH74QvhA+fCF8+EL4QvjwhfCF8OEL4QvhwxdC5g9sF+trm6wBMAAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTGrapherExample >> examplePopulationUSA [
<noTest>
| b  tab |
tab := RTTabTable new input: (TRPlatform current download: 'https://www.census.gov/popest/data/state/asrh/2013/files/SCPRC-EST2013-18+POP-RES.csv') contents usingDelimiter: $,.
tab removeFirstRow.
tab convertColumnsAsInteger: #('POPESTIMATE2013' 'POPEST18PLUS2013').

b := RTDoubleBarBuilder new.
b pointName: [ :row | row at: (tab indexOfName: 'NAME') ].
b points: tab values allButFirst. 
b bottomValue: [ :row | ((row at: (tab indexOfName: 'POPESTIMATE2013')) / 1000) asInteger ] titled: 'Pop estimate'.
b topValue: [ :row | ((row at: (tab indexOfName: 'POPEST18PLUS2013')) / 1000) asInteger ] titled: 'Pop +18 estimate'.
b build.
^ b view
]

{ #category : #icons }
RTGrapherExample >> examplePopulationUSAIcon [
	^ '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
XcWjA7UAAAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherExample >> examplePopupDecorators [

| b ds1 ds2 |
b := RTGrapher new.

ds1 := RTData new.
ds1 connectColor: Color blue.
ds1 points: (Array with: 0->0 with: 1->1 with: 2->3 with: 3->5 with: 4->7).
ds1 x: #key.
ds1 y: #value.

ds2 := RTData new.
ds2 connectColor: Color red.
ds2 points: (Array with: 0->0 with: 1->2 with: 2->4 with: 3->16 with: 4->32).
ds2 x: #key.
ds2 y: #value.

b add: ds1.
b add: ds2.

b addDecorator: (RTAverageDecorator new withLabel).

ds1 interaction noInteractions.
ds1 interaction popupDecorator: [ :model |
	RTAverageDecorator new
		lineColor: Color blue;
		withLabel: [ :num | 'average ', num asFloat asString ]
].

ds2 interaction noInteractions.
ds2 interaction popupDecorator: [ :model |
	RTAverageDecorator new
		lineColor: Color red;
		withLabel: [ :num | 'average ', num asFloat asString ];
		dataset: ds2
].

b build.
^ b view
]

{ #category : #icons }
RTGrapherExample >> examplePopupDecoratorsIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABeCAYAAADVA7GfAAAEKElEQVR4XuXcW08aQRwFcL9j
P5K+mPTFS3yojbcmXhIfaiqEVGvrHRWwaksJsoAgl6XiSrgKerY7izTeahVYduScxKQvW2bn
t/xnZme0R9f5I1N6+LuAH4Q//CD8IPzhB+EH4Q8/CD8If/hB+EH4ww/CH34QfhD+8IPwg/CH
H4QfhD/8IPwg/OEH4Q8/CD8If/hBqEHCkQh0AJlkAP7TFPi7U9cLhQJsAQkGg9jb28W3lSXE
lAACSvhOQ6LRKDweDxUSzs6gxeOQtmT5fD4ukNlZSD2GMIHAqBgi/CAyYBweAltbkH6WRQOy
u4tXMe1lAGnHuMEP0i6MzU28qoVhN4PA6wWqVX4QaUA2NiDXSh3XiJ8EkUmoUE4iiJ6EwALS
7nGjLSC5zClyWh5qTkfoYBVffP4HK/WdnR3wjxv8JcvaccNYc/CDyIBxfAwkk5bfDz/Ic0Fc
ro7cCz/IczDa9FqEH6QdGLGY5eMGP8izZ/bXwP5+R++BH+QpEBs22PhB/oXhcNjS9qZBshd5
s8GJxCmKl8bGzGWpa1bqYvHXjs2mjoJcFHVkjFV6KnSEdGAVrqO7e+pis/817qlXVBWF5WXb
2t1yybq+qqFbShY0DVa9NOQfQ14hBj/IbYxwWIq20oOIb4UsGPQgJobx7ZCpTbQgMmLQgsiK
QQki0wBOD2L11PZCjdp7lHT+04LZANeB8qAhsu2pd2Kd4VzftBfEc/ALtWoNEb8XMn9DOrno
01ocm7q+ZFmFkc0Cg4OAogDGqy/MzACXxkvWcrnMD2IlRjwOvH8PhELAwkL9h39Q78AKXHT4
wACgqlXDUdNFxzeeev5ZVisQqRSqU1MopR7/ncftbWB0FBAlp1IBpqetf+opQETHY3gYSKfN
z8DKCjAxARj7MLlcDk5nxSw14gkXHS8QBIYueaQFaQyOODoCxsZELYF56GBxEZib+7ujd7uu
i6deIHg85ZYHV3oQY9ECjIyYTzhqNVTGx4G1NfP6RmkRs5n7Mxy9y9JxELO03DzhovPL7ybg
HnJjaKjusbdneiASiaAx0IqZjk6SlkC8u/Up5Ve3+0GHiT314OxHhHs/YKQ3jaU3b5H4vG54
ZNHfn0VfXxYORxaxWNYYYLvnp1Qq2bcOiYT9opI/+KMBjSiKAjtWvK1OJs7Pz9GVJYs/koCI
c1pqOolEKv3oea3/vpa4OfMl/o+XXptR69cU88UXX3tmfO5VOV9vd4v3LhWIOKfV+Pf981rP
iTjzFf2tQ9defmNapn7N5Pzki68V5df743tTn32cSOGn22meUWum3ZaXLHFeq3Z13XTDaldV
PHXmy8rY2W7+MYRpHcIffhB+EP7wg/CD8IcfhB+EP/wg/OEH4QfhDz8IPwh/+EH4QfjDD8IP
wh9+EP7wg/CD8IcfhB+EP/wgXZo/l//Z8HRVBGQAAAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherExample >> examplePopupOnCurves [

	| b ds |
	b := RTGrapher new.

	b extent: 300 @ 200.

	ds := RTData new.
	ds points: (0 to: 100 by: 0.1).
	ds y: [ :x | (0.1 * x) sin  ].
	ds noDot.
	ds interaction popupText: 'sinus'.
	ds connectColor: Color blue.
	b add: ds.

	ds := RTData new.
	ds points: (0 to: 100 by: 0.1).
	ds y: [ :x | (0.1 * x) cos  ].
	ds noDot.
	ds interaction popupText: 'cosinus'.
	ds connectColor: Color red.
	b add: ds.

	b build.
	^ b view 
]

{ #category : #icons }
RTGrapherExample >> examplePopupOnCurvesIcon [
	^ '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'
]

{ #category : #sources }
RTGrapherExample >> examplePrimeNumberSpace [
	<noTest>
	| diag v ds anim |
	"Made by Serge Serge Stinckwich <serge.stinckwich@gmail.com>"
	v := RTView new.

	diag := RTGrapher new.
	diag view: v.
	ds := RTData new.
	ds dotShape ellipse color: (Color r: 0.9450000000000001 g: 0.768 b: 0.059000000000000004 alpha: 1.0); size: 0.1.
	ds points: ((0 to: 5e5) select:#isPrime);
	   y: [ :p |(p* (p cos))];
	   x: [ :p |(p* (p sin))].

	diag add: ds.
	diag axisX color: (Color black alpha:0); noTick; noLabel.
	diag axisY color: (Color black alpha:0); noTick; noLabel.
	diag build.

	anim := RTActiveAnimation new.
	anim intervalInMilliseconds: 100.
	anim blockToExecute: [ 
	    v canvas camera scale: v canvas camera scale + 0.2.
	    v signalUpdate.
	].
	anim inView: v.

	v canvas color: Color black.
	^ v
]

{ #category : #icons }
RTGrapherExample >> examplePrimeNumberSpaceIcon [
	^ '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
11sAAAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherExample >> exampleRandomCurves [

| b ds |
b := RTGrapher new.
b extent: 300 @ 200.

5 timesRepeat: [ 
	ds := RTData new.
	ds noDot.
	ds points: ((1 to: 500) collect: [ :i | 50 atRandom - 25 ]) cumsum.
	ds connectColor: Color green.
	b add: ds.
].
b axisX; axisY.
b build.
^ b view
]

{ #category : #icons }
RTGrapherExample >> exampleRandomCurvesIcon [
	^ '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'
]

{ #category : #sources }
RTGrapherExample >> exampleScatterPlot2 [

	| b ds |
	b := RTGrapher new.
	b extent: 290 @ 200.
	b interaction popup.
	
	ds := RTData new.
	ds dotShape ellipse size: 15; color: (Color red alpha: 0.3).
	ds points: RTObject withAllSubclasses.
	 
	ds x: #numberOfMethods; y: #numberOfVariables.
	ds dotSize: #numberOfLinesOfCode min: 4 max: 20 using: #sqrt.
	
	b add: ds.
	b axisXWithNumberOfTicks: 4.
	b axisYWithNumberOfTicks: 4.
	b build.

	^ b view
]

{ #category : #icons }
RTGrapherExample >> exampleScatterPlot2Icon [
	^ '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
VgAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTGrapherExample >> exampleScatterplotWithHighlighting [
	| b ds |
	b := RTGrapher new.
	b extent: 290 @ 200.
	
	ds := RTData new.
	ds interaction popup.
	ds dotShape ellipse size: 15; color: (Color red alpha: 0.3).
	ds points: RTObject withAllSubclasses.
	ds x: #numberOfMethods; y: #numberOfVariables.
	ds dotSize: #numberOfLinesOfCode min: 4 max: 20 using: #sqrt.
	ds highlightIf: [ :c | (c numberOfLinesOfCode > 2000) or: [ c numberOfVariables > 10 ] ] using: #name.
	b add: ds.
	
	b axisX 
			numberOfTicks: 4;
			title: 'LOC'.

	b axisY 
			numberOfTicks: 4;
			title: 'NOM'.
	
	b build.
	^ b view
]

{ #category : #icons }
RTGrapherExample >> exampleScatterplotWithHighlightingIcon [
	^ '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'
]

{ #category : #sources }
RTGrapherExample >> exampleSimpleCurve [

	| b ds |
	b := RTGrapher new.
	b extent: 300 @ 300.
	
	ds := RTData new.
	ds dotShape ellipse color: (Color blue alpha: 0.5).
	ds points: (0.0 to: 1.0 by: 0.05).
	ds connect.
	ds y: [ :v | v sqrt ].
	b add: ds.
	
	b axisXWithNumberOfTicks: 3.
	b axisYWithNumberOfTicks: 4.
b build.
^ b view
]

{ #category : #sources }
RTGrapherExample >> exampleSimpleCurve2 [

	| b ds |
	b := RTGrapher new.
	b extent: 300 @ 300.
	
	ds := RTData new.
	ds dotShape ellipse color: (Color blue alpha: 0.5).
	ds points: (RTObject withAllSubclasses sortedAs: #numberOfMethods).
	ds connect.
	ds y: #numberOfMethods.
	b add: ds.
	
	b axisXWithNumberOfTicks: 3.
	b axisYWithNumberOfTicks: 4.
b build.
^ b view
]

{ #category : #icons }
RTGrapherExample >> exampleSimpleCurve2Icon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAE4UlEQVR4XuWdS08TURiG0X/g
kqU/wB/gzgRI+AdqXBhNGm8bI7Hh1rQUEWgkLlyQsGFhAomRkEDBhAINF8PFGBIXCCEpLChI
gF7Tcil963ynjqKW2o6lM/q+yclwyZx853vObb4zc05FJsMvK6mC3wX8QPjFD4QfCL/4gfAD
4Rc/EH4g/OIHwg+EX/xA+MUPhB8Iv/iB8APhFz8QfiC/Kx6PY3d3F/JzMBhU152dHfC70yQg
Ho8HXV1dmJ2dhcPhUCBcLhdaWlp+grK+vp5ZWVmhcebWFvDqVQplBbK0tISamho0Nzejp6dH
gVlYWIDb7cb09PRvxmhQqFpOMpmEpccQNiDpdJofCP8six8IPxB+IPxAitbJyQn4gVhIgUCS
H4iV9OlTHNEo+GdZVlEsFuNvIVZSVGse/ED4gfADOUuRSIQfCD+QTDb8LleJ2xwfH+cNv/MD
KQMQCb/39vZCDFhcXMwbfp+fn6d5yg6Hw+UHoofft7TgvySbzcYffjcTCP8Ywg+EHwg/EGMK
hUL8QPiB8APhB8IPhB8I/6D+n7SQDD8Qa7UQfiD8Ywg/EH4g/ED+oEQiAdHR0ZEyIJVKQRI/
EJOASHR3cHAQfX19yoDV1VVIygGDKvxuGpCJiQnMzMxgeXlZhdzHxsZU4p9l8T+H8APhB8IP
hB8IPxBj4n8NiB8IP5B84n9zkR8IPxB+IP+Qrl+P8wPhn/byA8mpYBB4946/hVhGIyOA1wvz
gMgAtrm5CT30zh5+9/limj9MAjI1NQWn05kZHh7OG34PBAKYm5ujAOJwxEpSTkNA5FuQhoYG
yJvw2nrHmeF3WcRiaCGfPwMdHSYC4R9DfujNG+D27ahWMcEPxAqqqwtDm+2WrIz8QP5CN27E
0dp6XNLy8QMxoA8fgEePonj+PFXysvEDKVI3b6bx+HEI79/jXMrFD6QIDQwAL19GzrU8/EAK
0JcvwK1bcVRWnuDjR/ADMUtv3wI2WwrV1Qm8fo2ylIMfyCm9eCEAkqirC+HOnYiWknC7UVb7
aYFoUR88fRpS6eHDMJ48CeH+fUCgmGnXfw9EpqhOZ9b5TU3i9Kzz794tTTCQH0hGFoIAlyvr
aLneu5dERQVw8SLU9cIF4PLlI+X4Bw+i2sMbIOsV/0K3aRjI6c1mztp4RjaFXFtbw1kD5rNn
gMcD1U+LY3UnX72adbDuZPldnGu3h9RV+nhxsqSODuPdjNh3eHhYMlClyM8wEH2zmVybzuiS
8PuVK4lvtTZ9yslpXLqUxLVr/u+pujqbqqr8GiQ//H5/5tfk8/kgIf9c/zOSziM//XCCsgPR
N5uZnJxEW1tbTiMODg6wt7dXshootc/q+emnRlhuDCmkSytU+/v72N7e/p6H1EJZrTTy2o3s
7yWrm/KxkeQhf5P9v6S72djYgFH7dHv+9viOcwNSSJdWiNrb29HY2Kjul9XHzs5ODA0NQU4h
0DdPK0ayv9eItgAu3Yvdblf3C+zx8XH09/cbslMW53R78h3fYSqQQrq0QiQfBXV3d6O2tlb1
9ZJnfX29NqC3GspT9veSccPr9SqH6TaOjo6qPb+KHZTlXqkwYo90V386vsP0aS+/+IHwA+EX
PxB+IPziB8IPhF/8QPjFD4QfCL/4gfAD4Rc/EH4g/OIHwg+EX/xA+HVaXwHyHHqxNmVDtQAA
AABJRU5ErkJggg=='
]

{ #category : #icons }
RTGrapherExample >> exampleSimpleCurveIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAD/UlEQVR4XuWdTUsyURTH+3JC
Wz9JqwxaWL5BuOgL2BdoEYEICYkShRotbOlOAivd+N74fubxDPgw9KjP6IzOuff/BxmY4qLz
m3PPyz1z58g08SVJR/iXAB8IvvCB4APBFz4QfCD4wgeCDwRf+EDwgeALHwi+8IHgA8EXPhB8
IPjCB4IPZL36/T7x8fPzk/AvpQAgyWTSAtFut6nVav0DZXHerFar1hFFZ2dD8gVIpVKhQCBA
5XKZLi4uiLXq/2q1GoT19Ho9MgyDxPsQ3YEMBgO6uhqQMk5dVyAvLwaxVSgXZekGZDQaEQcz
uRyRkmGvLkCm0ymdnPRJ+TxEdSDZLFlT07qgBR/IgSOnu7spaZWpqwikWDSIoyflEkMdgXQ6
nb05bHwgWyga/aHhcOj7d4UHwhD2kU/gA9lSHDWFQj1x3w0SCCd2nOBJvFF2BrIsudfrdep2
u8RH6UAmkwklEgPRU+hOQBqNBjWbTeuHcYWTf2gqlVpZfl9Ug0WU3/mmmc1m4gOMnYDM53MK
h8P0+vpKsVjMAhKPx0VaCDvtWMxQJvTW2odwTqFaUqolEHbYkYihZMlGOyAcQangKyCAnJ93
lS/1awFkPB57sp6ND8QDPT8PiYGYmkhpIFyD8rMyiw/EplV9YPhAfAISj/e0bS1SCgiHs36t
5OED+aVcbqRNJKU8EAbx9DSGaEl1BWRZ8V1XevcCCE9Rh2rBURrI5eXlol4UsS5UKBRaecHc
lt8jkS7cYw47A8nn84vFnoTV/c5g1iVnu1oIr1+YgBLpQ3SPpJQCks0OoZ/GEgWEV/cKhRk+
EAlAOJJCyDOUAYLqxEUCOT3t4cOQAgR/mhIGREKDMz4QfL8hD8jt7QAfhhQgHOK+vU3wgUgB
omJHoXggy+737+/vjSX430C4CIlUTj8IEHv3O6tUKq3sfudGBP6bvSFB0tNK2gCxd78fHx/T
4+Pjyu53tgS2kKVF4OccwnzI9TW+dYgCIvUxMkgg+I5cGBDedQ7/cgsCgj9d4VsIPpBNQHi/
KfzLLQQIPgxhQPCnK2FA8B06voXgA9kEBD8pPBCQZcV3097vHx8fnsLwukApbTxPut/X7f3O
56LRpvnw8ECFQsH04nN/f296NdY+xisWi/5YiL37fd3e73zu6+vL0ymLx/PyjpY23l59iJMp
zamcrlBuOx4vmPFuRm7HY3nx+o69AXEypTmVfYVyMSXQ+/u7tS2UF+MFg0HLijOZjGsg/3t9
h69AnExpTmVfoby5uaF0Ov0XttvxeKWTx3MDmOX09R2+h734wgeCDwRf+EDwgeALHwg+EHzh
A8EXPhB8IPjCB4IPBF/4QPCB4AsfCD4QfOEDwZddfwAbTfhlYJ+zmQAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTGrapherExample >> exampleSimpleValues [

| b values ds |
b := RTGrapher new.
values := #(5 6 7 -1 -3).
b extent: 400 @ 300.

ds := RTData new.
ds interaction popup.
ds points: values.
ds connectColor: Color red.
ds y: #yourself.

b add: ds.

b build.
^ b view
]

{ #category : #icons }
RTGrapherExample >> exampleSimpleValuesIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEeUlEQVR4XuWdy0srMRTG/evc
ubkLt/4ZLlwI4srrC6XgRgVRXAiCouLbIkWsIL6QqqAot1gfqFXRatXj7QkdL9zJTMe0M570
+2BwwDkk5jf5kpOEsebzE1+SVIPfBPhA8IUPBB8IvvCB4APBFz4QfCD4wgeCDwRf+EDwhQ8E
Hwi+8IHgA8EXPhB8IPjCB4IP5J9ubm6orq6O+L61tZXm5+dJF/j8/Ex82fqH5/N5sqaHjIyM
qMq2tLQQQ9E9c3h4SOfn51YCoY4OysVilMvlyBrL4jfIr8Lck6yCMD1NNDlJlMl81Zt+/6aq
GUNsAELpNNHUlAKh/f3gID6QqCyJr5LPPT7iA4nSkgLFCbMta4HwGFfKkgIBEWZbVgKp5CxJ
mm1ZA8TUkmyzLdFAlCUVQYRazsCAXCANDQ2qcvF4nPr7+6m9vV1bWU4Kw8rU1SypqyuyRpJk
Wy4gVBA39MvLC42NjRFn5Hz//3MHBwcVzdTDtCSbbMsFhAdKnsG8v7+rCnr1gnItq1KzpGqz
rR8bQ+7u7rQ978eACLGtql46sdG28IEIsy18IMJsCx+IMNvCByLMtvCBCLMtFxAnM19cXKRE
IkFNTU2UzWYpykwd2bZcQJzMfKqQsG1vb6ufusBKZ+r4tuUBhN9650QGL6OgWdZP2xb+GCLM
tvCBCLMtfCDCbAsfiDDbwgcizLbwgQizLXwgwmzLBeTp6YnGx8dVJRYWFmh/fz/yPXVk29L2
kO7ublWJ5uZmKlzaQJtPv0u2LReQy8tLBSGZTNLKysrX3jqqZUVtW/hjiDDbwgcizLbwgQiz
LXwgwmwLH4gw28IHIsy28IEIsy0XEM7OnQbnXOTo6Ag6U4/atlxAXl9fKZPJqIuBjI6O0sfH
R+in3/FtywNIb28vra+v0/LyMm1ubhJ/PEAXeHx8TA8PD8aVu7q6sjLesa1yy7++vtbGG48h
DCSVStHZ2ZnRtbOzY2X8n4IzVKL83d3dygLhMcbvVErJN60oG+PZtsIq3wjI3NwcMRC/5Xk/
8dvlTCC+Gx90e8CvISYmJozjWanGxrLi0+m0Z/y3gXB3eyzMNhiI3/K8nzY2Nkou7/spyPaA
n3p6eozj2Wp+1daWVX5nZ6dnvFEPicVitLa25rs876cgy/teCro94KW3tzdiIKbxrELcZ7K+
3iieDyH29fV5lo+fGJqOASF9AQIfiKGyt7eUGxqi0IHwQevZ2VlVEGfpp6entLq6SviZukdP
KY4HoQA5OTlRA3ZbW5sqxMnSdckhaqauhbK0RJRIUCg9ZGtrSw2anK0zCG74mZkZwresElDu
74mGhwl/DKkyC8MHIszC8IGEaWHFr7viA7HYwvCBCLMwfCDCZmH4QIRZWI1XY/PiF9/zUrvu
GfxMvTwLy8fjFAjI3t7e1366s9TuBQQ/UzfX/cWF9quq2h7i7KczFF5qx2++6IT//0PwgeAL
Hwg+EHzhA8EHgi98IPhA8IUPBB8IvvCB4AsfCD4QfOEDwQeCL3wg+EDwhQ8EWX8BBR3Ll9qy
s4kAAAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherExample >> exampleSquaredCurve [

| data b ds |
data := (0 to: 40000 by: 1000) 
collect: [:n | n @ (Random new next * 3) floor].
b := RTGrapher new.
b extent: 1000@ 200. 
ds := RTData new.
ds dotShape rectangle height: 1; width: 25; color: Color blue.
ds connectUsing: (RTLine new 
	color: (Color blue); 
	width: 1; 
	withHorizontalAttachPoint; yourself).
ds 
	points: data;
	x: #x;
	y: #y.

b add: ds.
b axisX. 
b axisY title: 'alles Count'.
^ b
]

{ #category : #icons }
RTGrapherExample >> exampleSquaredCurveIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACV0lEQVR4XuXcPU8iQRzAYT6k
Jup3UaiML1/B91qN3wB6Co7QLVDREAoqErT5r9kzuYgzl9sgd8o9v2QSMpnZdXxAizU2ytLv
O9XwvwU+iJ8P4oP4+SA+iJ8P4oP4+SA+iJ8P4ueD+CB+PogP4ueD+CB+PogP4ueD+PkgPoif
D+KD+PkgPoifD+KD+PkgfjVAiiKi2Vwdp6cRdS6W23t+vv71hsP1945G6++tW+4eufOenKT3
HY/TdWdnEQnIxUW6OTeX6/Jys+uurtJ1ublc19fputzcZ7q9rXe93Lq7u/xeH8QH8UF8EB/E
B/FBfBAfxAfxQXwQH8QH8UF8EB/EB/FBfBAfxAfxQXwQH8QH8UFokGazLN+Pvb2/D3J/Xz1D
Xr1v7nl37pv/8JDufXuOvTq3v5/ufXxM1+Wed789K19dVz3v/jh3cFDvvE9P9ffW+quTTYNs
+tPwmW5u0nvk5v5VPogP4oP4ID6ID+KD+CA+iA/ig/ggPogP4oP4ID6ID+KD+CA+iA/ig/gg
PogP4oPQIO12u/zTODz8Ea1WlO/H8fFz+XFuZ+c56lwvN46Oesk9dndf1r5e3dFqfc19fzd+
fUKGw+GXvSs2WVEUW30O/19rfDeQyWQSy+UyxuNxjEajn++u6vW2HGCxWER1hm0/R/W1V2do
dDqdmM/n0ev1ot/vR1X1elsOMpvNYjAYxLafYzqdRrfbDf9Hlv87xM8H8UH8fBAfxM8H8UH8
fBAfxM8H8fNBfBA/H8QH8fNBfBA/H8QH8fNB/HwQH8TPB/FB/HyQ/7pXlUUAwIdknNYAAAAA
SUVORK5CYII='
]

{ #category : #sources }
RTGrapherExample >> exampleStackingX [

	| b ds |
	b := RTGrapher new.
	b extent: 400 @ 300.
	
	ds := RTData new.
	ds points: #( 5 6 7 ).
	ds connectColor: Color red.
	ds y: #yourself.
	b add: ds.
	
	ds := RTData new.
	ds points: #(1 7 10 4).
	ds connectColor: Color blue.
	ds y: #yourself.
	b add: ds.
	

	b axisXWithNumberOfTicks: 4.
	b axisYWithNumberOfTicks: 4.
	^ b
]

{ #category : #sources }
RTGrapherExample >> exampleStackingX3 [

	| b nbOfCurves normalizer |
	b := RTGrapher new.
	b extent: 400 @ 200.
	
	nbOfCurves := 3.
	normalizer := RTMultiLinearColorForIdentity new numberOfColors: (nbOfCurves).
	1 to: nbOfCurves do: [ :i |
		| data ds |
		ds := RTData new.
		data := (100 to: 1 by: -1) collect: #atRandom.
		ds dotShape ellipse size: 0.
		ds points: data.
		ds connectColor: (normalizer rtValue: i).
		b add: ds.
	].

	b axisXWithNumberOfTicks: 3.
	b axisYWithNumberOfTicks: 4.
b build.

^ b view
]

{ #category : #icons }
RTGrapherExample >> exampleStackingX3Icon [
	^ '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
TkSuQmCC'
]

{ #category : #icons }
RTGrapherExample >> exampleStackingXIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEZ0lEQVR4XuWdSU/jQBCF8+f4
KfwFDhxYDnDIhSCO7MsJBEisIgECB9ZLkNhBCA5JhmhYBJFAYSmPu2eAjGwn3Xbb6fZ7kpUQ
SBH1567qV25MwrLwpZMS+EOADwRf+EDwgeALHwg+EHzhA8EHgi98IPhA8IUPBF/4QPCB4Asf
CD4QfOEDQQPy9vZG7+/v/GBfFwoFwh+mBgLZ39+n8/Nzftze3lKpVHIAeXx8tOzv80cUbW5G
c2I6gDQ3N1M6nebHzs4OtbW1uX6Qm5sbmJkzMUH0+Ul0ckKkbQ1BAdLd/QOBgcEH0kB1djoB
rK2FCwUfiIf6+twHfmgIH0ikYrVifr72oIcJBR9IlfJ5oo2N+oMdZtrCB/JPW1tiMMIu8PhA
bGWzRIeHcgN8dET08aEeCjwQln7KZX8D29uLD0S54Qu6AFBtFmGBVBu+RkLFB+Jh+IKmPXwg
ig1fEKn0JQ4gT09PlLcX5H/X5XmKCxARw6cDFNcZMjMzw4O3tLS4/hLWdt/d3TWm/S5q+HRI
W65Azs7OyB5w6rSTbaVSMbr9Lmv4Gl3gY11D/Bi+IFJhFmMLZHW16Nvwualg0xX5uVQKH4jn
7AjyfmKFh1XqZJJfLhR9H5shQcxiLIGMjfkbEFpaIspkOIhG1ZLYAbHXIHRxIT4gfAYsLvLT
WodVV+yA1MvhflORrAYH8YFYuRxxhZWKojCLsQIyPv4zAL9Zj4RZc8WpSG6lBwwkvfIZSSoK
e4FhNJDqVDQ8TFrWNFmzaBwQPgMWFv5LRf39pLUn6umJERCRVVFQExi2ZMxiwrmOr3xvsK61
8z1MIDKrIr8mUNda4gAyNTXFN1qz53Z7nR4eHlx3v6tuv/+am5NeFcmawEZLxCw6gJzYA9La
2srb7+3t7a7rel2KetBGXtQaGPABxJRV1sEBeZ4sOquegzcWSLUJNEn1zKKRQOwSZ/QWpFoF
3kggIyNmA2FXMb3MonFARAqjCZqcLMYDiO4mMKiMAmKKCYQAYpoJjD2QMLb+4wMBM4GxBWKq
CYwlENNNoBIg9/f32ux+N90EKgHy1X732v3OWvLsPihurXl8E6gYyPr6+nf73Wv3Oyuw19fX
oRfaqHat49cQ/EJuFhBmAi8v8YFoAwTFBBoBhJlAC1jaAYniJmH4QPBNoJlARkfxgWgDZHq6
hH87Wgv/bkD4QPCFDwQfCL4UAxHZ/c5uRa7yg7y8vODHcwPS0dHBu7zsudfud/ZaJpOxlpeX
KZvNWiqO2dlZS1UsE+Jtb2+LzRDWfu/q6qq5+529ViwWlbbfWTyVZ6Cp8XzVEJGUJqNyuaw0
3tcVT1Xx7u7ulMZ7fX31jCcNRCSlySqZTCqNV+8PjmSVSqWUxbu6uqLj42PPeNJARFKajHK5
HDU1NSmLV33FU0W809NTYpeyVcV7fn6mvb09z3j4//IoLj4EX/hA8IHgCx8IPhD8IcAHgi98
IPhA8IUPBB8IvvCB4APBFz4QfCD4wgeCL3wghugPLJi7puVmqhwAAAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherExample >> exampleTwoInteractions [

	| b ds |
	b := RTGrapher new.
	b extent: 300 @ 200.

	ds := RTData new.
	ds interaction popupText: [ :c | 'Roassal class: ', c name ].
	ds dotShape circle color: (Color blue alpha: 0.3).
	ds points: RTShape withAllSubclasses.
	ds x: #numberOfMethods.
	ds y: #numberOfLinesOfCode.
	b add: ds.

	ds := RTData new.
	ds interaction popupText: [ :c | 'Trachel class: ', c name ].
	ds dotShape circle color: (Color red alpha: 0.3).
	ds points: TRShape withAllSubclasses.
	ds x: #numberOfMethods.
	ds y: #numberOfLinesOfCode.
	b add: ds.

	b axisX; axisY.

	b build.
	^ b view
]

{ #category : #icons }
RTGrapherExample >> exampleTwoInteractionsIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAD7UlEQVR4XuXcS0sbURyGcT9a
N+5d9gu46K4bF4qaeEUEbXcFXbgQ7KItggYkSmK8LFSKsS4kbgzxLhrwjtc3nTN4gpeJTDQm
o88LQzKlh8b5deZc/sdU5XL8BClV/EvAB+GHD8IH4YcPwgfhhw/CB+GHD8IH4YcPwg8fhA/C
Dx+ED8IPH4QPwg8fhA/CDx+EHz4IH4QfPggfhB8+CB+En2CDZLNZXV1dybzf2tpyX/f29sS/
nBUCGR8f18LCgnZ3d2UhwuGwWlpaHqCk0+lcKpUqyQfV+rq0sSE+yKPE43E1NDSorq5OsVhM
zc3Nmp+fV2trq6anp59cMAeFf+cEqQ/hg3wgECUS4oOUEUSLi9L5Of8O4j+y+CD88EH4IHyQ
SoGcnJxof39fx8fH2tzcdC+4OT/36KD5IGUA6e7uVmdnpztTj0Qi7gW3549n6nNzc/yr/JYg
yWRS1dXV6u/vl1lCaWtrc2fq9px/h/D7ED4IH+SDgehuIMBPUEBSKT5IUECWltzlKz7Ie+pD
tLyMXXTkd+ofZaZuS7d2pl6ops4HKdNM3dbQzYTQ/FmhmrrXTN0x5COVeqZuauimvt7e3l50
Td0ZZPFBgtqH6G7YxacIYKeukRHxQfijLD4IP3wQPshjEKd7ePDq9hmQ7aGBvUPMGpZZFTHv
d37GNDnJH/6WBOTo6EjmyGQyun/+HEjyW9x9NUPcTKhfOztSNssHKQnI4OCgEolEHsGee2A8
mKnbR5SdqTvzSj5IKUDMrndTP6+pqVE0GpU9fzKvcGLuEP6FD1gf4nghQM7O5G5XDjwIv2Qb
JJCZGS2Hf/FBAgPi9DFjX8fyIyz9+8fHqfQd8vv7Oh8hKCDRaFpdXfxRVmBAfnyOiF8hLAPI
/Rp6oXr67empvnz6+yKMm5sbXVxcYNq+GsTW0L1q6TZra2v609vrrFlN5oo9JiYmNDo6+u7a
2i9SKDuIraGbunpHR4fnhzD/Ww4ODl70AWlt37wP8fNIKxSzRma2F11fX+cPfzPlM7Nao8vL
S/fvF9PWbG1yH7O3t/mvDfH7ue0vMJn3r/2qkTcD8fNI88rU1JRCoVDOPDbM+erqqszhp63Z
/TI8PKyhoaGi25qtTQMDAzo8PHS/NuT+z+CnbU9Pj2ZnZ9XU1FRU27KB+HmkFbqz6uvrZbYb
OSvF7qKl18KlV8wi54wz71lZWXH/bb9t7dam7e1t96itrX12a5NX28bGRvX19bkwfttWZNjL
Dx+ED8IPH4QPwg8fhA/CDx+EHz4IH4QfPggfhB8+CB+EHz4IH4QfPgg/fBA+CD98ED4IP3wQ
Pgg/fBA+CD98EH74IEHNf4EL0NxGzOIGAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTGrapherExample >> exampleTwoStackedCurves [

	| b ds |
	b := RTGrapher new.
	b extent: 200 @ 200.
	
	ds := RTData new.
	ds points: #(0 1 2 3 10 20).
	ds connectUsing: (RTLine new color: Color blue).
	b add: ds.
	
	ds := RTData new.
	ds points: #(0 10 20 30).
	ds connectUsing: (RTLine new color: Color red).
	b add: ds.
	
	b axisXWithNumberOfTicks: 3.
	b axisYWithNumberOfTicks: 4.
	^ b
]

{ #category : #icons }
RTGrapherExample >> exampleTwoStackedCurvesIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEQUlEQVR4XuWcW0vrQBSF/XM+
+EP8C+KT1yqWvouXo1al+CBI8X6v1LsvCqK0LwqioiK9CEertitndjWHQmtN2mmaZi0YQkpm
muyveyZ79kybDINfblITvwn4gfCLHwg/EH7xA+EHwi9+IPxA+MUPhB8Iv/iB8IsfCD8QfvED
4QfCL34g/ED4xQ+EHwi/+IHwix8IPxB+8QPhB8IvfiD8QPjlHSC3t7f4/PzMFzm/u7sDv9nr
CKS3txfxeDxfHh4e8Pj4WAQkmUwasVgsf6y13t/f8XR9DUog4hXd3d1YX1/Pl8PDQ3R0dJQ0
xrVDRsL8PPjHEAtyDMjgID8QtwDBygr437LcBGRoiB+IW4BgcxP8b1luAjI6yg/ELUCwswP+
OMRNQIJBfiCm7u/v8fLyglwuBzNydxIIdnfBH6kXaHh4GIXH0RJ9uUToKmisSaSO6Wl+IKZk
mqSlpQVdXV0Ih8PY39+Hz+dzzENwcNBw82aeHkMwM8MPxC1A/p6eam0vlUqBH0g1BgyFtLYX
CvEDqbyrOjrSajzVHPi7LBeNHao5fiAVw9jb02o89WII/kG9GiDaxw6PAfn4+EA6nc4XOf8p
p64DCKJRrcZTzcFzr70nJycqWJ5W83s7ZXPqOiJ1TE5qNeDUlAeBtLa2Ymtrq+Y5dUQiWo2n
mgN/YFgNkLExrQYcH+cHUrEBdGcDVXN1m3LxBhDN2UDVHD+QSoHoXkmyuoq6Tkg2PpCREa0G
VM3xA6kUSHJuDm9vb9oMuLiY0NoeHRB8ZyF1KJOBzLrUPX9ScyASoZt59J/y6ZUA0b1GNxiE
K5JZjnjInOpa5NjW1lbyoSuJ1HV6Rz0i8roCicViKkVxlF8JL9sBioyrdHV1JQc47R0ym/v6
SgZE9xii0zvW1uCqvHvDAdHpHT4fXLcIovGAaPKO5WW4ckVKQwHR5R2pFNTMMz+Q6oFo8I6z
syzC4STnHkOdQOx6x1f8A/T3A2dnQCAA5HLg37CjDcgv3qEyxRgYAM7PvyDc3KSNRpQjQMy0
bbk96hKrWPUOiRvE+EtLT/D7M7i8tP7Lz2azyKh5ErvP8Kq+1BNAZKG1BITfETkSiUTRg8ln
GxsbxoqaSo9EIkZhubi4MOJ/Fo1AIIrm5ghmZyP/r1lYWJB6RXXKFble6tmpI0VmEjwBZHt7
G319fflIvbOzs2Q0Lp/JPhKrkbqp5+dn2792uV7q2X0OuT+aMcRKl/aTgUqtYiknc+OQnXrm
fTnxtyB1B2KlSyslcwNQYf3fNDExAVnFbqeO3+9XQ9i87ftrWCBWurRSHiUbgY6Pj9HT04Oo
xQVy4lVSzO+0Ukfabm9vt3V/nnjt5Rc/EH4g/OIHwg+EX/xA+IHwix8IPxB+8QPhFz8QfiD8
4gfCD4Rf/ED4gfCLHwg/EH7xA+EXPxB+IPziB8IPhF/8QPiB8IsfCD8Qfjmtf+Fp+dApOMdF
AAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTGrapherExample >> exampledoubleCurves [
	| f g b ds xValues |
	f := [ :x | x ].
	g := [ :x | x * x ].
	xValues := 0 to: 100 by: 0.1.
	b := RTGrapher new.
	b extent: 300 @ 200.
	ds := RTData new.
	ds noDot.
	ds points: xValues.
	ds y: g.
	ds x: #yourself.
	ds connectColor: Color green.
	b add: ds.
	ds := RTData new.
	ds noDot.
	ds points: xValues.
	ds y: f.
	ds x: #yourself.
	ds connectColor: Color blue.
	b add: ds.
	^ b
]

{ #category : #icons }
RTGrapherExample >> exampledoubleCurvesIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAErklEQVR4XuWc20sqURTG+2d7
6qGnXnqoFIrEJ4kkrOhiIKQIUUnTdMPqxSAqKCroQkfnona/39Y+rQ0TdjBRjzrjfB8srJzR
cX6z117fmm0tQuDLSWrBPwX4QPCFDwQfCL7wgeADwRc+EHwg+MIHgg8EX/hA8IUPBB8IvvCB
4APBFz4QfCD4wgeCDwRf+EDwhQ8EHwi+8IHgA8EXPhB8IPhyLpC3tzd6f3+XkclkiP9mmiZx
8M/Wc/intkFAUqkUHR0dybi+vqb29nbyeDzU09MjH63nrO01TSMOlBN6d3dHj4+P1DAgra2t
tLi4KKO7u5tWVlaot7eXvF4vJZPJ7+es7Z+enogDAcbz87Pw5D3i9fWV8OcQm/X5+UkT+oQc
IfiTugOkmAqdGWf4VZYTpBkaxc044Ze9DtD9/T2NG+OiVpUlPpD/m8TJn/OL/6mq8IHUcBKf
ycwILv3xnbpDJnFN1+w3hre3t5ROpymXy0l/wW690J1bjt3NOjVOhWqq5AinzorH49TX10d7
e3uyZWK5c8ut/6hAXObUs9kszWXmZMpyDJDDw0MaHh6mhYUF6urq+nbnPp9PuvbCbd3k1Dk7
BM2g7OfV6z3w55Ay9XVRybYIt0fqKXwg5cGoeXmLD6RKcXoa18fFzc1NQ9IuPpAS4spR/aOK
y8vLhs2B+EB+0cfHB81mZkWjK0R8IL+MDAmjDsYPH0gVIyORTtgCoyogfDes8B66m5w6f4b5
9LxtMKoCEo1GpQlkV97W1uYap87VlBwZNh9rxUAODg6os7NT3kNfW1tzhVNn0zetTTtidMPP
Iey8fTlfzdvo+ECqEPemvHmvvOvnlGOCBaLrOg2ZQ3XvTeEDKUOb2U2aTc/WtWuLD6SCslbN
qo4tMmCAPDw80IA5IAzDcHTFBwHky1uIiBZpSPscH0jpkpaiWpQUQ2maFfkVA9nf36dEIkHB
YJC4bNza2qL19XVpEgOBAA0ODjrCqfO9b3/WL3gxRjNdRFU59aWlJbnAob+/n1ZXV0lVVVIU
hTo6OigUCtnq1K1REdNj9PLy0nR9NdekLF4FwnNFIBsQ+Xy+aRucrgDCd/RCZkikjFTTf3ur
qYFw/4kXOnOKaoYKyrVArq6uZNsjZIQc1YeCAsKpiOcGTk1hLUyNWgWCD6TIaIhpMQrrYTlH
uCU1NQ0QHglfc4NQ0gpF9IgYMUaIoQgQtThhBDCAZDpJXLLyJL1xsSEh1GtBs2uB7OzsEDft
ijl0SxcXFxQO6z9iakoXHBNTGTH5FeEpTf7+73alYnJSKxljYzpFo5qwI/gCswUIt0x2d3dl
G2V0dJR+a2Fw64Sv+ErDartUu2+1J4b3s2NfVzl1/JRVo5RWTNzA5FUsJycnVPg65exb2PSs
dF8W9+oqfV/rf77w9vxFJv6shcfgGCDlpLRi4gbl+fk5LS8v0/Hxsewml9ugLGx6VrovXzi8
FKjS9+UmJgdvz6/Bx7+9vS2PAT9l4acsfOEDwQeCL3wg+EDwhQ8EX/hA8IHgCx8IPhB84QPB
B4IvfCD4QPCFDwRf+EDwgeALHwg+EHzhA8EHgi98IPhA8IUPBF/4QPCB4KtM/QXWS8k76Tz9
LAAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTGrapherExample >> examplesinAndCos [
	| b ds |
	b := RTGrapher new.
	b extent: 400 @ 400.
	
	ds := RTData new.
	ds label: 'sine'.
	ds dotShape rectangle size: 0.
	ds points: (-3 to: 3.1415 * 5 by: 0.01).
	ds y: [ :v | v sin ].
	ds x: #yourself.
	ds connectColor: (Color red alpha: 0.4).
	b add: ds.
	
	ds := RTData new.
	ds label: 'cosine'.
	ds dotShape rectangle size: 0.
	ds points: (0 to: 3.1415 * 5 by: 0.01).
	ds y: [ :v | v cos ].
	ds x: #yourself.
	ds connectColor: (Color blue alpha: 0.4).
	b add: ds.
	b legend.
	^ b
]

{ #category : #icons }
RTGrapherExample >> examplesinAndCosIcon [
	^ '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'
]

{ #category : #accessing }
RTGrapherExample >> label [
	^ 'Grapher - Overall'
]
