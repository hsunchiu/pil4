-->What will the following script print? Explain.
 sunday = "monday"; monday = "sunday"
 t = {sunday = "monday", [sunday] = monday}
 print(t.sunday, t[sunday], t[t.sunday])


-->monday	sunday	sunday
 --[=[

 t            v

 "sunday"	"monday"
 "monday"	"sunday"

t.sunday = t['sunday']	= 'monday'
t[sunday] = t['monday'] = 'sunday'
t[t.sunday] = t[t['sunday']] = t['monday'] = sunday

]=]