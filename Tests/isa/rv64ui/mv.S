# See LICENSE for license details.

#*****************************************************************************
# move.S
#-----------------------------------------------------------------------------
#
# Test move instructions.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

# Test move chains

    TEST_CASE( 1, x14, 0xadcafedeadcafede, \
      la x1, ptr_to_tdat; \
      ld x1, 0(x1); \
      addi x2, x1, 0; \
      ld x14, 8(x1); \
    )

    TEST_CASE( 2, x13, 0xcafedeadcafedead, \
      la x1, ptr_to_tdat; \
      ld x1, 0(x1); \
      addi x2, x1, 0; \
      ld x13, 16(x1); \
    )


  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

ptr_to_tdat:
    .dword tdat

tdat:
tdat1:  .dword 0xdeadcafedeadcafe
tdat2:  .dword 0xdeadcafedeadcafe
tdat3:  .dword 0xdeadcafedeadcafe
tdat4:  .dword 0xdeadcafedeadcafe

RVTEST_DATA_END
