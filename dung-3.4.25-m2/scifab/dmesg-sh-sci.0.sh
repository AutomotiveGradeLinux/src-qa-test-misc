#!/bin/sh

set -e
#set -x

echo "sh-sci dmesg feature test"


OK=0
NG=0

test_one ()
{
	if $(dirname $0)/../common/dmesg-quiet.sh "$@"; then
		OK=$(($OK + 1))
	else
		NG=$(($NG + 1))
		echo "Could not find $SW" >&2
	fi
}

test_one \
"sh-sci.0: ttySC0 at MMIO 0xe6c40000 (irq = 176) is a scifa"

test_one \
"sh-sci.1: ttySC1 at MMIO 0xe6c50000 (irq = 177) is a scifa"

test_one \
"sh-sci.2: ttySC2 at MMIO 0xe6c20000 (irq = 180) is a scifb"

test_one \
"sh-sci.3: ttySC3 at MMIO 0xe6c30000 (irq = 181) is a scifb"

test_one \
"sh-sci.4: ttySC4 at MMIO 0xe6ce0000 (irq = 182) is a scifb"

test_one \
"sh-sci.5: ttySC5 at MMIO 0xe6c60000 (irq = 183) is a scifa"

test_one \
"sh-sci.6: ttySC6 at MMIO 0xe6e60000 (irq = 184) is a scif"

test_one \
"sh-sci.7: ttySC7 at MMIO 0xe6e68000 (irq = 185) is a scif"

test_one \
"sh-sci.8: ttySC8 at MMIO 0xe62c0000 (irq = 186) is a hscif"

test_one \
"sh-sci.9: ttySC9 at MMIO 0xe62c8000 (irq = 187) is a hscif"

test_one \
"sh-sci.10: ttySC10 at MMIO 0xe6e56000 (irq = 196) is a scif"

test_one \
"sh-sci.11: ttySC11 at MMIO 0xe6ea8000 (irq = 55) is a scif"

test_one \
"sh-sci.12: ttySC12 at MMIO 0xe6ee0000 (irq = 56) is a scif"

test_one \
"sh-sci.13: ttySC13 at MMIO 0xe6ee8000 (irq = 57) is a scif"

test_one \
"sh-sci.14: ttySC14 at MMIO 0xe6c70000 (irq = 61) is a scifa"

test_one \
"sh-sci.15: ttySC15 at MMIO 0xe6c78000 (irq = 62) is a scifa"

test_one \
"sh-sci.16: ttySC16 at MMIO 0xe6c80000 (irq = 63) is a scifa"

test_one \
"sh-sci.17: ttySC17 at MMIO 0xe62d0000 (irq = 53) is a hscif"

echo "Passed:$OK Failed:$NG"

if [ "$NG" -ne 0 ]; then
	exit 1
fi

