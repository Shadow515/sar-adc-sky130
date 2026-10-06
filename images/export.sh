M="magic -dnull -noconsole -rcfile /foss/pdks/sky130A/libs.tech/magic/sky130A.magicrc"
cd /foss/designs/inverter   && printf "load inverter\ngds write /foss/designs/images/inverter.gds\nquit -noprompt\n" > /tmp/e.tcl && $M /tmp/e.tcl > /dev/null 2>&1
cd /foss/designs/comparator && printf "load comp\ngds write /foss/designs/images/comp.gds\nquit -noprompt\n" > /tmp/e.tcl && $M /tmp/e.tcl > /dev/null 2>&1
cd /foss/designs/cdac       && printf "load cdac_array\ngds write /foss/designs/images/cdac_array.gds\nquit -noprompt\n" > /tmp/e.tcl && $M /tmp/e.tcl > /dev/null 2>&1
cd /foss/designs/images && klayout -zz -r render.py
