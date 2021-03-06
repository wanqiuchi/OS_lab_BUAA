#include <asm/regdef.h>
#include <asm/cp0regdef.h>
#include <asm/asm.h>

LEAF(tlb_out)
		mfc0    k1, CP0_ENTRYHI
        mtc0    a0, CP0_ENTRYHI
        nop

        tlbp		/* ���� TLB */
        nop
        nop
        nop
        nop

        mfc0    k0, CP0_INDEX
        bltz    k0, NOFOUND
        nop

        mtc0    zero, CP0_ENTRYHI
        mtc0    zero, CP0_ENTRYLO0
        nop

        tlbwi		/* ���� TLB */

NOFOUND:
        mtc0    k1, CP0_ENTRYHI

        j       ra
        nop

END(tlb_out)
