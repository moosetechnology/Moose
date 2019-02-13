"
RTCalendarExample new installTitle: 'VisualizationCSV' 
		code:
'
| b tab colors dictionary |
tab := RTTabTable new input: ''http://bl.ocks.org/mbostock/raw/4063318/dji.csv'' asUrl retrieveContents usingDelimiter: $,.
tab removeFirstRow.

dictionary := Dictionary new.
tab values do: [ :ar | | value |
	value := (ar fifth asNumber - ar second asNumber)/ ar second asNumber.
	dictionary at: ar first asDate put: value ].

colors := #(#(165 0 38) #(215 48 38) #(244 109 67)
	#(253 174 97) #(254 224 139) #(255 255 191) #(217 239 139)
	 #(166 217 106) #(102 189 99) #(26 152 80) #(0 104 55)
  ) collect: [ :ar| Color r: ar first g: ar second b: ar third range: 255 ].

b := RTCalendarBuilder new.
b dateShape rectangle size: 15; color: Color white; borderColor: Color lightGray.
b monthShape shape: (b monthShapePath: 15.0).
b yearShape composite: [ :comp | 
	comp add: (RTLabel new text: [ :d | d year ]; height: 20 ).
	comp add: (RTBox new color: Color transparent). ] .
b dates: ((Year year: 1990) to: (Year year: 2010) ).
b dateLayout gapSize: 0.
b monthLayout month.
b yearLayout horizontalLine.
b dateShape if: [ :d | dictionary includesKey: d ] color: 
	[ :d | | value index |
	value := (dictionary at: d)+0.05.
	index := (value * 11/ 0.1)+1.
	index < 1 ifTrue: [ index := 1 ].
	index > 11 ifTrue: [ index := 11 ].
	colors at: index. ].
b dateInteraction popup.
b build.
(b view elements select: [:e | e model isKindOf: Month]) pushFront.
^ b view

'
	
"
Class {
	#name : #RTCalendarExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-Builder-Calendar'
}

{ #category : #sources }
RTCalendarExample >> exampleBasic [

| b |
b := RTCalendarBuilder new.
b dates: (Date today to: Date today next next).
b build.
^ b view

]

{ #category : #icons }
RTCalendarExample >> exampleBasicIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAB0klEQVR4XuXYvWoCQRSAUR/Q
d7K3sxK0WhTc0idQ/CnEwk4LRUERKxEsxEK4G2aLtIEQo8n5YIsdmGYOOxe2UhR+71TFPwIf
xM8H8UH8fBAfxM8H8UH8fBAfxM8H8fNBfBA/H8QH8fNBfBA/H8QH8fNB/HwQH8TPB/FB/HwQ
H8TPB/FB/HwQPx/EB/HzQXwQPx/EB/HzQXwQPx/EzwfxQfx8EB/EzwfxQfx8EB/kT9VsNuNw
OMTpdIpWqxW73S6u12v4IC8qz/Not9txPB6j0WhElmXR6XR8kHfodrtFv98P/8r6pdLVNBwO
i+88k8kkfJAfLs2HV+z1Qb441DQz0hCfTqfl+3K5jNFoFOkruN/v5Vqv14vH4xHj8Th8kCeD
1Ov1clZUq9XPQ+52u1Gr1Yr0pBLGer2O+XzugzwbZDAYxH6/Lw88va9Wqzifz7FYLGK73ZZr
s9ks0pDfbDY+iD9DEJDL5RKv2OuD+L9O/HwQPx/EB/HzQXwQPx/EB/HzQXwQPx/EzwfxQfx8
EB/EzwfxQfx8EB/Ezwfx80F8ED8fxAfx80F8ED8fxAfx80H8fBAfxM8H8UH8fBAfxM8H8UH8
fBA/H8QH8fNBfBA/H+Q/9gEUtn5Gru2F5QAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTCalendarExample >> exampleCodeCommits [

| classes dictByJulian dictByDate maxPerDays b |

"Set your classes here:"
classes := RTShape withAllSubclasses.
"classes := (RPackageOrganizer default packageNamed: 'Roassal2') definedClasses."


"Script"
dictByJulian := (classes flatCollect: #methods) groupedBy: [ :m | m date julianDayNumber ].
dictByDate := (classes flatCollect: #methods) groupedBy: [ :m | m date ].
maxPerDays := (dictByJulian values collect: #size) max.

b := RTCalendarBuilder new.
b yearShape composite: [ :comp | 
	comp add: (RTLabel new text: [ :d | d year ]; height: 20 ).
	comp add: (RTBox new color: Color lightGray trans)].
b yearLayout verticalLine.
b dateShape rectangle 
	size: 15; 
	borderColor: Color lightGray;
	color: Color lightGray;
	if: [ :d| dictByJulian includesKey: d julianDayNumber ] color: [ :d| |i|
		i := (dictByJulian at: d julianDayNumber) size / maxPerDays.
		Color r: i g: 0 b: 0 ].
b dateInteraction when: TRMouseClick do: [ :evt | 
	(dictByJulian at: evt element model julianDayNumber ifAbsent: [ #() ]) inspect ].
b dateInteraction popup text: [ :d | 
	(dictByJulian at: d julianDayNumber ifAbsent: [ #() ]) size asString, ' Methods' ].
b dates: (dictByDate keys min to: dictByDate keys max).
^ b

]

{ #category : #icons }
RTCalendarExample >> exampleCodeCommitsIcon [
	^ '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'
]

{ #category : #sources }
RTCalendarExample >> exampleMonth [

| b |
b := RTCalendarBuilder new.
b dates: (Month current to: Month current next).
b build.
^ b view


]

{ #category : #icons }
RTCalendarExample >> exampleMonthIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAFOklEQVR4XuWa10vtShTGz5+n
b4Lvgvrmk/okItixvagPYsGGiBW7IvZeUVRQUezYGyr2sjz3C3eFJLjvLudc93Z/HwSdJGsy
mV+yvpnJ/vX5ya9A0i/+LuAHwi9+IPxA+MUPhB8Iv/iB8APhFz8QfiD84gfCL34g/ED4xQ+E
Hwi/+IHwA+EXPxB+IPziB8IvfiD8QPjFD4QfCL/4gfAD4Rc/EH4g/OIHwi9+IPxA+MUPhB8I
v4IESH5+vkRFRcnm5qasrKwI9j09Pcl3tgHXxt/T01OZnJyUmZkZeXl5EUogMTExEh0dLVtb
W9La2iqxsbHf2hEfHx+yu7srUEtLi/T19UlkZKSMj48Ldcp6fX01OqC+vv5bO+L+/t643sPD
g3ndt7c3CYqUhafKX9vBwYHRie3t7X5rQ8AB2dnZ8duTpdf2ZxuogBwdHdnqXl1dlbm5OfEU
iLt4eAjeLus5U1NTtjLM/vHx0dyHAcDFxYVQAvlK3d3d8idviDUeKiwstJXDw8PNVAjB9K0e
NzExIW1tbZxAhoeHPwcHB8VaTk5O9jhluYuHkTuBWI0eKisrEx18QOvr6zI9Pc3/hvB7CD+Q
nw1kZGREysvLbR3T2NhoK2dnZ9vKubm5xuTMehyTNC3X1dVJZ2enWW5qapKcnByXHuJtPCaD
PT09kpWVZeyrqqqyzYswCNB26moC/m9oaBCn+QcckOfnZ8EN637c6OzsrK3R1hEONDY2Jufn
5+a+2tpa2/H+/n5jJq3lq6sriYiIcAnE23h0blpammRkZIi1fc52lpaW2mJQz9+ezP51IO/v
7+LpDFllHU5+JflXzmUPT1OWu3iVt+toTuPn9xB+D+EH8qOAqNkhF6upIseqKaqBolxUVGQa
KNKcrvTquc3NzTYDTUpKEoz9tc6BgQHB5MwJxJd4XeGNj4+3mbqavNaZl5dnltF+630G7Bvi
yiCdIyrtDD1eXV1tO29hYUEwQNAYQEtPTzdjurq6ZGlpSVy9Id7E6+gJ+/Q4lkWsIzMIEABY
22+9z4BOWb58ZHJnkM6BgJq1pynrv+JdyXkf7sr8HsLvIfxAfhQQ5GzNx2tra6KTMviDLu7F
xcUZebekpMQ0SBjw/Py8Ub67u5Pi4mLBeXock0v8hYEiteE4vnvjm7wTiC/xSD2Yl6iH6Lnb
29u2NunkUuu03mdAAsFqKIyzoKDAbCSWUpaXlwWzcZRxfH9/XyoqKkRnv5il/7MCa5Qx2kEH
qAHjhjEiwnnoTKi3t9eoQzvFCsSXeDxEuD5GYtqmvb098yHSOkdHR+Xy8lK0Tut98qcs/pTF
D+RHAsGCm3Wt6Pj4WG5vb40NZaQK/NXPqicnJ4IPRIeHh2a+RizirIuB1jLORYz+QsTpId7G
BzUQmGFlZaXc3NwYZZh3TU2NwEtQBhgsfXd0dJidgS9vaqgao7NkrTMzM9OchMEfNjY2jO2r
N8Tb+KAFMjQ0JImJicbTiO3s7ExCQ0MNc9QlhrCwMGMGnJCQYJRDQkJgqJ9qwikpKca3aoyA
rq+vzTrRyfh1I57q1NRUoz6t0wrEl3h+D+H3EA4g+Dkq3jZ/bAEJBKupSBHfnQqC4c34394Q
zMqdK7z8QPwEZHFx0RhN4dfsuvTND4TYQ/iBWIQhpr9uwp/XDlgg/OIHwg+EX/xA+IHwix8I
v/iB8APhFz8QfiD84gfCD4Rf/ED4gfCLHwi/+IHwA+EXPxB+IPziB8IPhF/8QPiB8IsfCL/4
gfAD4Rc/EH4g/OIHwg+EX/xA+IHwyy/6DSC1D9R8yJyVAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTCalendarExample >> exampleVisualizationCSV [
<noTest>
| b tab colors dictionary |
tab := RTTabTable new 
	input: (TRPlatform current downloadContent: 'http://bl.ocks.org/mbostock/raw/4063318/dji.csv')
	usingDelimiter: $,.
tab removeFirstRow.

dictionary := Dictionary new.
tab values do: [ :ar | | value |
	value := (ar fifth asNumber - ar second asNumber)/ ar second asNumber.
	dictionary at: ar first asDate put: value ].

colors := #(#(165 0 38) #(215 48 38) #(244 109 67)
	#(253 174 97) #(254 224 139) #(255 255 191) #(217 239 139)
	 #(166 217 106) #(102 189 99) #(26 152 80) #(0 104 55)
  ) collect: [ :ar| Color r: ar first g: ar second b: ar third range: 255 ].

b := RTCalendarBuilder new.
b dateShape rectangle size: 15; color: Color white; borderColor: Color lightGray.
b monthShape shape: (b monthShapePath: 15.0).
b yearShape composite: [ :comp | 
	comp add: (RTLabel new text: [ :d | d year ]; height: 20 ).
	comp add: (RTBox new color: Color transparent). ] .
b dates: ((Year year: 1990) to: (Year year: 2010) ).
b dateLayout gapSize: 0.
b monthLayout month.
b yearLayout horizontalLine.
b dateShape if: [ :d | dictionary includesKey: d ] color: 
	[ :d | | value index |
	value := (dictionary at: d)+0.05.
	index := ((value * 11/ 0.1)+1) asInteger.
	index < 1 ifTrue: [ index := 1 ].
	index > 11 ifTrue: [ index := 11 ].
	colors at: index. ].
b dateInteraction popup.
b build.
(b view elements select: [:e | e model isKindOf: Month]) pushFront.
^ b view


]

{ #category : #icons }
RTCalendarExample >> exampleVisualizationCSVIcon [
	^ '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
AABJRU5ErkJggg=='
]

{ #category : #sources }
RTCalendarExample >> exampleYear [

| b |
b := RTCalendarBuilder new.
b dateShape if: [ :date | date dayOfWeek = 1 ] color: Color red.
b dates: Year current.
b build.
^ b view


]

{ #category : #icons }
RTCalendarExample >> exampleYearIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAASg0lEQVR4XuWd968VRRTH779m
iBETjRr/AjGa+JtRwYK9YMGKYgGNEhuosTdsNBXFXrGggKBgxQYqwsH5DPvdnJ3de+9e2Hvf
880kN+9tOTtn5uzOKfOdM70DB/Iv06n08u+CjAXyxRdf2KOPPmrToeHwwt9Vq1bVrq1fv35i
PL733nuVunovvPCCvf3223bTTTfZfffdZzB6//33j4WhZ5991r766is7/fTTbdGiRfbaa6/Z
vffea7/88ouJueuvv97OOeccW7Zsma1evXpsHQMv11xzjV100UUH5syZE+tbunSpff3113bt
tdfaW2+9NRGhPPPMM7HuhQsX2t133229119/3V566SX77LPP7P33349MwNA430pegF27dsXG
f/jhh6a3kuN33303nrv55ptt3F/IDz/8YK+88opR96effhr7AB74f9OmTRMRCP3/3Xff2e23
327bt2+33rp168z/XnzxRUvPDfpt2bIlMv7xxx+PRDfs99hjj7W+9/fff488rF27tlMeRvmp
gw+V/rnnnot/D1uH8Eb5v1NRpgMPE1XqP//8c6WhfFqjdMYgeso///xTOf7xxx9tz5491u8Z
v/32mw3iwfburdDyBe3fv79y7qeffqoc88xBPPIMiudHuq+r8scff7T7QlD8/viyyy4bSSCD
6CkPPPBA5XjBggW2c+fO8tzKlSttzZo1lXu8tVYTyIYNNV7uuOOOyrkbb7yxcnzEEUdUjufN
m1c5PuGEE+JY78+9/PLLnQoEI6MmEMxAXxFK77zzziuP//33X7vkkkv6CyTQ2wj0FJTo33//
XZ7D2vFCxNrCGvE0KOC+Apk71w44c/biiy+2xx9/vLx/48aN5jucr/HMM8+sPB8e/Zd7+eWX
25NPPlmh6dr8PfLII/PXITPOMcxfIB0L5KqrrjLvrb766qsVM45xk3N+ONm9e3d5rjZchPM2
Ar2GJkxW/n7yySem8ZS/f/31V7x3xYoVkc7fK75rPATbPjg6ZZ3c/84771SOcUrxAcST6hFP
+/bts7vuuqvCk/wz3YuhwP9NHWtXXFE5z7DrvXKGv6efftq8QueZPfkRKrfeemvJCIWx95hj
jjGvePBu+TV2RqC3Eeg3FAp4Q6KI33zzzQoNFo0cV+6lMX15eOghM2cEYON/8MEH5TH0X375
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'
]

{ #category : #sources }
RTCalendarExample >> exampleYearShape [

| b |
b := RTCalendarBuilder new.
b dateShape if: [ :date | date dayOfWeek = 1 ] color: Color red.
b yearShape composite: [ :comp | 
	comp add: (RTLabel new text: [ :d | d year ]; height: 20 ).
	comp add: (RTBox new color: [:d | 
		(d year % 2 = 0) 
			ifTrue: [Color lightGray alpha: 0.2] 
			ifFalse: [ Color lightGreen alpha: 0.2 ]]). ] .
b dates: (Year current to: Year current next).

b build.
^ b view



]

{ #category : #icons }
RTCalendarExample >> exampleYearShapeIcon [
	^ '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'
]

{ #category : #sources }
RTCalendarExample >> exampleYearWithDayNames [

| b |
b := RTCalendarBuilder new.
b dateShape composite: [ :com | 
	com add: (RTEllipse new color: [ :d | 
		d = Date today
			ifTrue: [ Color blue alpha: 0.2 ]
			ifFalse: [Color transparent] ]; size: 18).
	com add: (RTLabel new text: [:d| d dayOfMonth];
		color: [:d | (d dayOfWeek = 1) 
			ifTrue: [Color red] 
			ifFalse: [ Color black ] ]) ].

b showDayNames.
b yearShape composite: [ :comp | 
	comp add: (RTLabel new text: [ :d | d year ]; height: 20 ).
	comp add: (RTBox new color: [ Color blue alpha: 0.1 ]). ] .
b dates: Year current.
b build.
^ b view


]

{ #category : #icons }
RTCalendarExample >> exampleYearWithDayNamesIcon [
	^ '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
QmCC'
]

{ #category : #accessing }
RTCalendarExample >> label [
	^ 'Calendar'
]
