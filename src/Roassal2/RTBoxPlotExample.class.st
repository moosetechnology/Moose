"
RTBoxPlotExample new installTitle: 'BoxPlot1' 
		code:
		'
| b createList r ds |
r := Random new.
createList := [ :size :d1 :d2 | (1 to: size) collect: [ :i | d1 + (r next * (d2-d1))] ].

b := RTGrapher new.
ds := RTBoxPlotDataSet new.
	ds points: (createList value: 20 value: 0 value: 20).
	b add: ds.
b build.
b view.
 '
"
Class {
	#name : #RTBoxPlotExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-Builder-BoxPlot'
}

{ #category : #sources }
RTBoxPlotExample >> exampleBoxPlot1 [

| b createList r ds |
r := Random new.
createList := [ :size :d1 :d2 | (1 to: size) collect: [ :i | d1 + (r next * (d2-d1))] ].

b := RTGrapher new.
b extent: 70@300.
ds := RTBoxPlotDataSet new.
	ds points: (createList value: 20 value: 0 value: 20).
	b add: ds.
b axisX noLabel; noTick.
b build.
^ b view.
 
]

{ #category : #icons }
RTBoxPlotExample >> exampleBoxPlot1Icon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACjUlEQVR4XuXcvWrCUBiAYW8u
gxfiLTg4+DO4eAfOjg6OguLPpOLipCgILiq6KCIIKn6pX6g2hTRTck7s+0LQ1uE0eYjhI9aU
6/JLUin+IeCD8OOD8EH48UH4IPz4IHwQfnwQPgg/Pgg/PggfhB8fhA/Cjw/CB+HHB+GD8OOD
8OOD8EH48UH4IPz4IHwQfp8Bst1u5X6/e5v+vNlshH9ILYJUq1VZLBbettvtZL/fv0GOx6M7
n8+9R34GQPTgp9NpabVa3jYcDiWfz/86Q1arFf+MSdI1hA/CB+GD8EF+Wi6Xwgfhg/BB+CB8
ED7IR4Lcbjc5nU7eFjSp80EMg4zHY6nVatLv9wMn9dFohJrUrYNkMhnpdDr8Sf3Z4/GQ9Xot
+si/hiSgw+Egz/31HvkgfBA+CB+ED8IH4YPwQfgg/wpEJ/Wwe+p8EAuTetg9ddKknggQndT5
99T51xA+CB+ED8IH4YPwQfggfBA+CB/EJMj1en0Pg0GffOeDGAap1+veUPg9mYv/j+FP6hZA
ZrOZ5HI5eR54KRQKor1e0+d6hvh/xwfhX0P4IHwQPkhi4n+UlA/CB+GD8EH4IB8NEjap661d
GwfmcrlYWXc6ndoFKRaLUiqVAid1fd5ut91msym9Xs81uTUaDdf0mroNBgPXKki325Vyufzn
pK7f9GBjUtd1bZwhUawb2zUk7K0szl7r6r8GmFz3fD5Hsr+xgIS9lcWZf91sNmsUpFKpRLK/
sYCEvZXFmX9dhdHbAybWnUwm4jhOJPvL/3qmhMUH4YPw44PwQfjxQfgg/PggfBB+fBA+CD8+
CD8+CB+EHx+ED8KPD8IH4ccH4YPw44Pw44PwQfjxQfgg/PggfBB+5voCUYQRoBEyxGMAAAAA
SUVORK5CYII='
]

{ #category : #sources }
RTBoxPlotExample >> exampleBoxPlot2 [
	| b createList r |
	r := Random new.
	createList := [ :size :d1 :d2 | (1 to: size) collect: [ :i | d1 + (r next * (d2 - d1)) ] ].
	b := RTGrapher new.
	(1 to: 10)
		do: [ :i | 
			| ds |
			ds := RTBoxPlotDataSet new.
			ds points: (createList value: 20 value: 0 value: 20).
			b add: ds ].
	^ b
]

{ #category : #icons }
RTBoxPlotExample >> exampleBoxPlot2Icon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAADyklEQVR4XuXcTUvrQBSHcT+1
W19Av4O4tCCCC0FcWFHRTe2i+4qvSK2Kb2CrCLYn9gQK3jozt2kzmYnPHwa8uaHmnl8nyWQm
dyZJ+IkpM/wS8EH44YPwQfjhg/BB+OGD8EH44YPwQfjhg/DDB+GD8MMH4YPwwwfhg/DDB+GD
8MMH4YcPwgfhhw/CB+GHD8IH4Sd+kLe3N+n3+3J7eyv656+vL9HGL2nAHrKysiKvr6/y8vIi
p6enaRv+3dXVVdJsNvkVLgpkfn5etra2ZG5uTmq1mlSr1bT93GeAkkuPUfTRbZ1OR25ubrz1
SO35w94/mouLCynlNcQEonhHR0cy7edoLi8vM31O1v1thTdtPzw8lI2NDdGUCkRzfX39a7ue
9mwFywJSr9dFW9EgmvPzcyldD7GBuPY3bddv4t3dXabC80E8guhNg7ZpQT4/P+X+/l74IJGA
TFL4PwXiKqQNxHS3wwcJBGLbPxTIx8eHtFqtX3dT+tl6PMHvsvTgbCP1vwhiK3w0ILOzs+kB
mEbqJycnCR+kIJDBQCjZ39+XhYUFOT4+HnukzgcpyTXk+fnZOK7IC6Tb7crw9MoHmaLAk24f
LYxtOx8kMpD393fjXdPwUc64heeD5ASStcB8kMhAdnZ2ZNASnZzjg4yxfX19PW38HsI/ZcUB
4ppT9wky7Al8kJG45tSzjNT5PSSnkXrWOXU+SGTXEL3nN42Y+SCBQDSmCaq8QHS9mGk1Ch8k
EIjtWRYfJDKQRqORtnELqbN/g2dZfBB+D+GD8EFMIIPxTJLH3VdWEE0ej9mjAHl8fBSd9Nef
Hx4eZBoQ1/55LAPStVfafIHoBJvWICjI8vJy+o/Uhdc6lTtaMNNIPRSIa3teE1HBlwGtrq6m
o/ODgwNZWlr652D0gMu8UM5VeNtxolcu6jXHtgTUNwh/KWnG1xHyALFN4fJBAoFMsp0PwgeJ
B0RPKdqyFN62Px7E9M7gJD3Eliwv5ugd4ubmpky7XqvUIK7CFA1iS7vdFm1ZelpwkJ+j89GR
eq/Xk7OzMykaVkfMlUql8PflB0+SZXd3N+xIfThCN43U9Vu6trYmOtVbZNvb25Pt7e0gv9f2
GnVhIIuLi+nKd9NIXd/de3p6KvybWvbf6+Ua4jqV+cz/Hnb6TF7/xYgXENepzGdcDzt9x7Yc
KgoQ16nMZ1wPO31lnOVQ0dz28sMH4YPwwwfhg/DDB+GD8MMH4YcPwgfhhw/CB+GHD8IH4YcP
wgfhhw/CDx+ED8IPH4QPwg8fhA/CDx+ED8IPH4QfPkjM+Qbkn0SlmLU0PQAAAABJRU5ErkJg
gg=='
]

{ #category : #sources }
RTBoxPlotExample >> exampleBoxPlot3 [

| b createList r d today |
r := Random new.
createList := [ :size :d1 :d2 | (1 to: size) collect: [ :i | d1 + (r next * (d2-d1))] ].

b := RTGrapher new.
today := d := Date today.
(1 to: 10) do: [ :i | | ds |
	ds := RTBoxPlotDataSet new.
	ds points: (createList value: 20 value: 0 value: 20).
	ds model: d.
	ds x: [ :date| date julianDayNumber - today julianDayNumber + 1 ].
	b add: ds.
	d := d next.].
b build.
^ b view.
 
]

{ #category : #icons }
RTBoxPlotExample >> exampleBoxPlot3Icon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAADzUlEQVR4XuXcS0vzQBSHcT91
t7WCfgcpuunCRQULBRdKFQRpsbpW8V5b8C5oEUV7Yk94C77pJGY00yQ+f5iF05Km8zOXkxmd
8jx+spQp/hDwQfjhg/BB+OGD8EH44YPwQfjhg/BB+OGD8MMH4YPwwwfhg/DDB+GD8MMH4YPw
wwfhhw/CB+GHD8IH4YcPwgfhJ/sgT09PMhgMpNfrif78/v4u2vhDmuIRMj8/L4+Pj/Lw8CCH
h4d+G712dnbmHRwcZH4Anp+fRVvuQaanp6VWq0mxWJRmsylra2t++/qeIYrxiypisG9jY0Ma
jUYqA3NyciKIa0gYyPn5udi8P6yfDwIDSQMKA/L29ibagv2np6ei1zsZJgtQqCNEB58PEsj9
/b1cXl7GHvhOpyPa8gCi3y13IPrltQVzc3Mj2uK+P4sgx8fHfwfEtp8PEpJutxtaqacFYhp4
DEihUPB3wlSpt1otzxXI3t6ebG9vCx/kXzY3Nz2trEulkmxtbcWu1JM8QmwGnn8NgYFEbYcP
4hDk6upKtAXfjwfR2iSswDQN/Gg7NgNpcyTkFmRpaclvkz5y+CCOj5Dv+oMDYwuSVD8fhA/C
B8kUSNScOh8kBZCoOXWXlXrWQLQ4HjZPF36kWqnbzqnnHWR4hyh6lxgceP41hH/K4oPwQX7Q
Pyo8+SAxQTSjORT+EZIRENMzqLRAwvaHD5IiiOmZVbValWHjg2QFJJdHyO3trby8vPg7cH19
Lb8B0dX0puU+tiDDQtUfHEP9YLzY/ymQubk5f7JGF17rVG5wwEyVehhIGKCiX1xcWC0Psnn8
bgvS7/f9X5xgv96omPonClIul/3qXFeuz87O/rcjumO2KxdNq+Jtb5+TAtEB1gV9NlO7uZxT
jwJJop5JCuQn/XwQPggfhA+SEIjefZlWi/BBIi7etttJYhmQ7cBr3+7urhE2tyBJbcc0wO12
e2xeJkmQqPBBQgY4LH8e5Gt1HqzUPz4+5Ojo6Nc7qDXO+vr62HZ0lnJ1dXWsXz/39fU1NqBu
f3l5eewUpPuur8XdT/3c/f39dEFGFbqpUtcvX6lURKd6J9kUr16vj33uysqKt7i46Gx/FhYW
ZGdnJ12QmZkZf+W7qVLX39K7u7uJ/xVr3j/XyTUk6lTmMt897HSZpP7FiBOQqFOZy0Q97HSd
sOVQmQCJOpW5TNTDTleJsxwqM7e9/PBB+CD88EH4IPzwQfgg/PBB+OGD8EH44YPwQfjhg/BB
+OGD8EH44YPwwwfhg/DDB+GD8MMH4YPwwwfhg/DDB+GHD5LlfAI06kS7B0UeLAAAAABJRU5E
rkJggg=='
]

{ #category : #sources }
RTBoxPlotExample >> exampleBoxPlot4 [

| b createList r d today |
r := Random new.
createList := [ :size :d1 :d2 | (1 to: size) collect: [ :i | d1 + (r next * (d2-d1))] ].

b := RTGrapher new.
today := d := Date today.
(1 to: 10) do: [ :i | | ds |
	ds := RTBoxPlotDataSet new.
	ds points: (createList value: 20 value: 0 value: 20).
	ds model: d.
	ds x: [ :date| date julianDayNumber - today julianDayNumber + 1 ].
	b add: ds.
	d := d next.].
b axisX labelRotation: -30;
	labelConversion: [ :v | Date julianDayNumber: v + today julianDayNumber -1];
	numberOfLabels: 10.
b build.
^ b view.
 
]

{ #category : #icons }
RTBoxPlotExample >> exampleBoxPlot4Icon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAFJ0lEQVR4XuWcZ0v8TBTF/59Z
v4D6QkRQQRRfKHZZRBHrC8Xee++KvWPv9e6zJxCJMVk2PtnMZM+FZfUYk8n9JZm5d27mXzTK
bzrZP34X8APhN34g/ED4jR8IPxB+4wfCD4Tf+IHwA+E3fiD8xg+EHwi/8QPhB8Jv/ED4gfAb
PxB+IPzGD4Tf+IHwA+E3tUByc3NlZGRERkdHBb8XFRUJv4sVApmYmJCtrS3js7u7K4+Pj99A
Xl5eZHx8PHpycpIUSDjW3NycbG5uil3HBYI2WfXb21vp6OiQ6elpSVkg3d3dMjk5KVNTU7K6
uir9/f0/TnZgYMDTyff29vqyvRf97u5Oenp6ZGFh4cffXl9fDc1+QQFsaWmpb2AD7UPCAMRP
nQLI8/OzdHZ2ysHBgegOZGdnRyjukLDr2gNJVcenFBCMymIjtV+jMonZ8vKyfH5+Cj8QDYC4
6fxAyICYxz0+PpbQAMF4HLHH0NCQY6SuAoibI9/f32V7e1uur68lZYEgdbK+vi5LS0uOkXpL
S4tnRyYKxM1hXvWUAoIG7O3tGdG6l0jdzH3xA9GgD/mr43UB8vb2JmdnZ3J5eSn8QDQA4qZ/
fHzI7Oys3N/fCz+QJDjST+D8QDTSQwvk/PxcIpFItKurix+IznfI1dUVsr3R2GQXPxD+R1bI
gCBSjzenzg9EQaQeb07dKVIPCxDEGU1NTdG+vr7wAMH4HXPLXubU+e8Q/j6EHwg/kBABMXNB
Nzc3CTt+f39fTk9P+YEkA4jX9Lvb9qiPis3DRFEsl6hj7H3cXxyMC+ro6EguLi74geiQRPxL
uj6UQFDMgImuRIsZ/HIkMgFtbW3RwcFBfiD/R4/nAKcJMJo7JCcnx2hAYWGh6ALEj/38EYh4
LS73HQgKrvGNIgJrY7zOqWsKRPxof2BAkDJHamFlZUWc7oYw3yF+tZO/D+EHwg+EH4iP+49X
nMAPhL/6XQ0QpxSGSsfQA0m2Y7y+ycQPJMmO8WopBcScR3eK1PFuIMyuI/XupLe2tv7Sn56e
BKVBCNIS3Y9XPZbLSnh7ZHtramp+ZXvj7ScwINZ5dKdIHe+pYxu8uGn9oGIejrZqmCPBiY6N
jSW0fTx9Y2PDVUd77TqubCfdbXs3He/Mf319qU2doIN2i9T9uoLDrmvTh/CbRkAaGxtFFx13
7/DwsJL2KAWCfmB+fl7QOaMsyHyMqdJh2dnZguUz8FIRovKgjqscSF1dneTn50t1dbUUFBR8
FzGo0tGp43VqOCktLc1YnySI4yoHgpEORhyRSEQwDdrQ0CAqdbzYidEehtwYijc3NwdyXC36
EKyWg6j48PBQMFGFagyVOh4blZWVxs8VFRXGYyqI42oBpKqqSvApKyv78exUoWNhGtNRuHIX
FxcDa49yIHl5eUa6Gs9MBEMqdXTS9fX1hpPwaAKQoNqjHEhGRoaxRBI6Mkzb1tbWGo0rLi42
vu16Zmamo56VleWol5SUOOrmcNJte1TgYxuMeOCw9PR0x+3hWLf24H/tutv5KgeCVRra29uN
DtJcscGqI7eDK9SuY8IHS+rZdVQcmoURVr28vNz42HX7cNLUAWJtbe17JThTR4drre0yddw9
1lXgTB3DYoyYrDo6a/v5ahUYosFO1RfQnaY+oc/MzIiX/eikA9zDw4OkVKTOb/xA+IHwGz8Q
fiD8xg+EHwi/8QPhN34g/ED4jR8IPxB+4wfCD4Tf+IHwA+E3fiD8xg+EHwi/8QPhB8Jv/ED4
gfBbsuw/+njh8GU4VAsAAAAASUVORK5CYII='
]

{ #category : #sources }
RTBoxPlotExample >> exampleBoxPlot5 [

| b createList r d today |
r := Random new.
createList := [ :size :d1 :d2 | (1 to: size) collect: [ :i | d1 + (r next * (d2-d1))] ].

b := RTGrapher new.
today := d := Date today.
(1 to: 10) do: [ :i | | ds |
	ds := RTBoxPlotDataSet new.
	ds showMean: true.
	ds boxShape if: [ :item | item median > 10 ] fillColor: [ Color green ];
	if: [ :item | item median < 5 ] fillColor: [ Color orange ];
	if: [ :item | item hasOutlier ] fillColor: [ Color red ].
	ds boxLineShape color: Color blue.
	
	ds points: (createList value: 20 value: 0 value: 20).
	ds model: d.
	ds x: [ :date| date julianDayNumber - today julianDayNumber + 1 ].
	b add: ds.
	
	d := d next.].

b axisX labelRotation: -30;
	labelConversion: [ :v | Date julianDayNumber: v + today julianDayNumber -1];
	numberOfLabels: 10.
b build.
^ b view.
 
]

{ #category : #icons }
RTBoxPlotExample >> exampleBoxPlot5Icon [
	^ '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'
]

{ #category : #sources }
RTBoxPlotExample >> exampleMethodDistribution [
	| b ds |
	b := RTGrapher new.
	b extent: 400 @ 200.
	RTShape withAllSubclasses
		do: [ :cls | 
			ds := RTBoxPlotDataSet new.
			ds points: (cls rtmethods collect: #numberOfLinesOfCode).
			b add: ds ].
	^ b
]

{ #category : #icons }
RTBoxPlotExample >> exampleMethodDistributionIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEAElEQVR4XuXc20syQRjH8f5r
L7uuu6LCG6GLIMroLuhw0TmiwsoyOlIQdKSiUIuix9dnYGPzHXfdXHfX/f5gEV101vk4Mzuz
ak+txk+S0sOvAj4IP3wQPgg/fBA+CD98ED4IP3wQPgg/fBB++CB8EH74IHwQfvggfBB++CB8
EH74IPzwQfgg/PBB+CD88EH4IPzEB/L9/S3v7+8yNDQken91ddXc51dVTCBjY2Oyv78v5XLZ
IPT29prNSbValaenJz5QlF2WtoilpSU5OjqSQqEgFxcXvwD4IAkbQ/ggfBA+CB+kVtNue3Jy
Uvgg/BbCB+G3EH7iBenv7zen0fwqDwgyMTEhCwsLsrGxYSrPmbHzW0hMIM/PzzI1NSVnZ2dy
eXn5M2N3z9Rvb2/5IFGBrK2tSTable3tbdPF6MDGbyH8QZ0Pwgfhg4QWqefu7k5vpPHxxsf4
IBHl8PBQ+C2ED8IH4YPwQeIFGR8fl6+vL89r6nyQCEEUY35+3vOaehJn6qkF2dzclEql0nXX
1OMGeXh4kK4dQ+otTtIGEtZKdioG9foYVzs5OZGXlxc+SBKiEPWVabPxQTyi41A+n5e4QPRx
3T4/P4UPEmMLccYo5zE9M7Q9z29/kC7z9PQ0lC4zFYN6sxZiq/DX11dTcXomGRZImF1mYlrI
/f29RAFyfX1tIB4fH7sDRCeFehv2TF2Xx732Hxwc8EFsIFtbW7+upTfO1BXnLzP1YrHYMojt
GoZXC0o1yPn5uXx8fLQ1U7eNEUFA9DcqQVpQp0BaPUtzl+9+/VjHEL8u6S8g7gqJA8TZrycA
XQdiq3CnQnWdx69J20DcFebVpYUJYtvfNSDuiZ8bpHEecHNz4wnS7A01ez4fxKeF6MTo+Pj4
v4lRp0H8WmDcIKOjo5LJZCRyEL9PaJBPuB+ITuz025XuiV0zcNugnOoWYvuE2mbC7gpzH7Dt
+X4grYA55duOvRMgGud6iO39BVlLCwXk7e3tp3B3hcS933bsfvvbXZy0HV/bIIODg+YF1tfX
f74Fn+TFxTTFCqKi2g3oN+B1axjAzUxeUdK0lUqlyMrSMTAQyPLysjnAnZ0d8y34xv3tLjUk
MfoBjKosr3/G4P/XSTd0Wc2iK786GdSBy9ZywsrMzMyvMgYGBmR4eDj08nTg1d/CRPG+rq6u
ZHp6Wvb29szCrVNmWyD6U7e5uTnZ3d2VxcXFjoGsrKyYvlbL0CtxIyMjksvlQi9P50Ozs7MS
xfvSRdq+vj4Dof8l45TJ77LS1GXxwwfhg/DDB+GHD8IH4YcPwgfhhw/CB+GHD8IH4YcPwg8f
hA/CDx+ED8IPH4QPwg8fhA/CDx+EHz4IH4QfPggfhJ+28g/i0bNGZk1ymwAAAABJRU5ErkJg
gg=='
]

{ #category : #sources }
RTBoxPlotExample >> exampleTitle [


| b classes deco |
b := RTGrapher new.
b extent: 700 @ 200.
classes := RTShape withAllSubclasses.
classes do: [ :cls | | ds |
	ds := RTBoxPlotDataSet new.
	ds points: cls rtmethods.
	ds model: cls.
	ds y: [ :method | method numberOfLinesOfCode ].
	b add: ds.
].

b axisX noTick; noLabel.

deco := RTHorizontalAllValuesDecorator new.
deco labelRotation: -45;
	labelConversion: [ :index | classes at: index ].
b addDecorator: deco.

b build.
^ b view
 
]

{ #category : #icons }
RTBoxPlotExample >> exampleTitleIcon [
	^ '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
QmCC'
]

{ #category : #accessing }
RTBoxPlotExample >> label [
	^ 'Box Plot'.
]
